import 'package:admin/features/working/domain/entities/work.dart';

class WorkModel extends Work {
  WorkModel({String? title, int? id}) : super(title: title, id: id);

  factory WorkModel.fromJson(Map<String, dynamic> json) =>
      WorkModel(id: json['id'], title: json['title']);

  Map<String, dynamic> toJson() {
    return {'title': title, 'id': id};
  }
}
