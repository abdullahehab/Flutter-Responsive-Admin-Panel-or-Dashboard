import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../housing/domain/entities/housing.dart';
import '../../../housing/presentation/controller/controller.dart';
import '../../../owning/domain/entities/owning.dart';
import '../../../owning/presentation/controller/controller.dart';
import '../../../social_status/domain/entities/social_status.dart';
import '../../../social_status/presentation/controller/controller.dart';
import '../../../working/domain/entities/work.dart';
import '../../../working/presentation/controller/controller.dart';
import '../../domain/entities/user_entity.dart';

class UsersListPdf extends StatefulWidget {
  const UsersListPdf({Key? key, required this.title, required this.users})
      : super(key: key);

  final String title;
  final List<UserEntity> users;
  @override
  State<UsersListPdf> createState() => _UsersListPdfState();
}

class _UsersListPdfState extends State<UsersListPdf> {
  pw.TextStyle? _style;
  pw.TextDirection? _direction;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final font =
          await rootBundle.load("assets/fonts/cairo/Cairo-Regular.ttf");

      final ttf = pw.Font.ttf(font);

      _style = pw.TextStyle(font: ttf);
      _direction = pw.TextDirection.rtl;
    });
  }

  pw.Text arabicText(final String text,
          {pw.TextStyle? style, pw.TextAlign? align}) =>
      pw.Text(text,
          textDirection: _direction, style: style ?? _style, textAlign: align);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        canDebug: false,
        build: (format) => _generatePdf(format, 'example'),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

    var socialStatusController = Get.find<SocialStatusController>();
    var workController = Get.find<WorkController>();
    var owningController = Get.find<OwningController>();
    var housingController = Get.find<HousingController>();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        margin: pw.EdgeInsets.all(10),
        build: (context) {
          return pw.Container(
              decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black, width: .5)),
              child: pw.Column(
                children: [
                  pw.SizedBox(height: 10),
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(horizontal: 5),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.SizedBox(width: 50),
                        arabicText("جمعية الديوان النوبية الخيرية",
                            style: _style!.copyWith(
                                fontSize: 12, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(width: 40),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 15),
                  // pw.Row(
                  //     mainAxisAlignment: pw.MainAxisAlignment.center,
                  //     crossAxisAlignment: pw.CrossAxisAlignment.center,
                  //     children: [
                  //       pw.SizedBox(width: 50),
                  //       arabicText('تقرير',
                  //           style: _style!.copyWith(fontSize: 19)),
                  //       pw.SizedBox(width: 40),
                  //     ]),
                  // pw.SizedBox(height: 20),
                  pw.Padding(
                      padding: pw.EdgeInsets.symmetric(horizontal: 8),
                      child: pw.Column(children: [
                        pw.SizedBox(height: 10),
                        operationTable(
                          title: '#',
                          value1: 'الاسم'.tr,
                          value2: 'الحالة الاجتماعية'.tr,
                          value3: 'الوظيفة'.tr,
                          value4: 'العنوان'.tr,
                          value5: 'رقم الهاتف'.tr,
                          value6: 'الحيازة'.tr,
                          value7: 'السكن'.tr,
                          value8: 'الحالة الصحية'.tr,
                          value9: 'التمييز'.tr,
                          value10: 'عدد الابناء'.tr,
                        ),
                        ...widget.users.map((item) {
                          return operationTable(
                              title: '${item.nationalId.toString()}',
                              value1: '${item.name!}',
                              value2:
                              (socialStatusController.getById(item.socialStatus!) ??
                                  SocialStatus(title: '', id: null))
                                  .title!,
                              value3: (workController.getById(item.working!) ??
                                      Work(title: '', id: null))
                                  .title!,
                              value4: '${item.address!}',
                              value5: '${item.phone!}',
                              value6:
                                  '${(owningController.getById(item.owning!) ?? Owning(title: '', id: null)).title!}',
                              value7:
                                  (housingController.getById(item.housing!) ??
                                          Housing(title: '', id: null))
                                      .title!,
                              value8: item.healthStatus.toString(),
                              value9: item.type.toString(),
                              value10: item.childrenNumber.toString());
                        }),
                        pw.SizedBox(
                          height: 20,
                        ),
                        pw.SizedBox(height: 20),
                      ]))
                ],
              ));
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildInvoiceInfo({
    required String title,
  }) {
    return pw.Expanded(
        child: pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
      arabicText(title, style: _style!.copyWith(fontSize: 8)),
    ]));
  }

  pw.Widget operationTable(
      {String? title,
      String? value1,
      String? value2,
      String? value3,
      String? value4,
      String? value5,
      String? value6,
      String? value7,
      String? value8,
      String? value9,
      String? value10,
      bool? titledBold = false}) {
    return pw.Table(
        columnWidths: {
          0: pw.FlexColumnWidth(1),
          1: pw.FlexColumnWidth(1),
          2: pw.FlexColumnWidth(1),
          3: pw.FlexColumnWidth(1),
          4: pw.FlexColumnWidth(1),
          5: pw.FlexColumnWidth(2),
          6: pw.FlexColumnWidth(1),
          7: pw.FlexColumnWidth(1),
          8: pw.FlexColumnWidth(1),
          9: pw.FlexColumnWidth(2),
          10: pw.FlexColumnWidth(2),
        },
        border: pw.TableBorder.all(color: PdfColors.black, width: .5),
        children: [
          pw.TableRow(
            verticalAlignment: pw.TableCellVerticalAlignment.middle,
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.symmetric(vertical: 5),
                child: arabicText('${value9 ?? '--'}',
                    align: pw.TextAlign.center,
                    style: _style!.copyWith(fontSize: 8)),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.symmetric(vertical: 5),
                child: arabicText('${value10 ?? '--'}',
                    align: pw.TextAlign.center,
                    style: _style!.copyWith(fontSize: 8)),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.symmetric(vertical: 5),
                child: arabicText('${value8 ?? '--'}',
                    align: pw.TextAlign.center,
                    style: _style!.copyWith(fontSize: 8)),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.symmetric(vertical: 5),
                child: arabicText('${value7 ?? '--'}',
                    align: pw.TextAlign.center,
                    style: _style!.copyWith(fontSize: 8)),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.symmetric(vertical: 5),
                child: arabicText('${value6 ?? '--'}',
                    align: pw.TextAlign.center,
                    style: _style!.copyWith(fontSize: 8)),
              ),
              arabicText('${value5 ?? '--'}',
                  align: pw.TextAlign.center,
                  style: _style!.copyWith(fontSize: 8)),
              pw.Padding(
                padding: pw.EdgeInsets.symmetric(horizontal: 5),
                child: arabicText('${value4 ?? '--'}',
                    align: pw.TextAlign.center,
                    style: _style!.copyWith(fontSize: 8)),
              ),
              arabicText('${value3 ?? '--'}',
                  align: pw.TextAlign.center,
                  style: _style!.copyWith(fontSize: 8)),
              arabicText('${value2 ?? '--'}',
                  align: pw.TextAlign.center,
                  style: _style!.copyWith(fontSize: 8)),
              pw.Padding(
                padding: pw.EdgeInsets.symmetric(horizontal: 8),
                child: arabicText('${value1 ?? '--'}',
                    align: pw.TextAlign.right,
                    style: _style!.copyWith(fontSize: 8)),
              ),
              pw.Padding(
                  padding: pw.EdgeInsets.symmetric(horizontal: 10),
                  child: arabicText(title!,
                      style: _style!.copyWith(fontSize: titledBold! ? 9 : 7)))
            ],
          ),
        ]);
  }
}
