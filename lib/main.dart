import 'package:admin/features/add_new_user/data/datasource/remote_datasource.dart';
import 'package:admin/features/add_new_user/data/repositories/user_repositories_imp.dart';
import 'package:admin/features/add_new_user/domain/usecase/add_user_usecase.dart';
import 'package:admin/screens/main/components/main_screen_controller.dart';
import 'package:admin/services/service_locator.dart';
import 'package:admin/utils/app_pages.dart';
import 'package:admin/utils/page_route_name.dart';
import 'package:admin/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'controllers/appProvider.dart';
import 'controllers/auth_provider.dart';
import 'features/add_new_user/presentation/controller/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocators();

  runApp(ScreenUtilInit(
    designSize: const Size(414, 896),
    builder: () => GetMaterialApp(
      title: "Dewan Project",
      debugShowCheckedModeBanner: false,
      initialRoute: PageRouteName.MAIN_SCREEN,
      getPages: AppPages.routes,
      locale: const Locale('ar', 'EG'),
      initialBinding: Binding(),
      theme: ThemeData(
        fontFamily: 'Cairo',
      ),
    ),
  ));
}

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRemoteDataSourceImp());
    Get.lazyPut(() => UserRepositoryImp(Get.find<UserRemoteDataSourceImp>()));
    Get.lazyPut(() => AddUserUsecase(Get.find<UserRepositoryImp>()));

    Get.put(UserController(Get.find<AddUserUsecase>()), permanent: true);

    Get.lazyPut<MainScreenController>(
      () => MainScreenController(),
      fenix: true,
    );
  }
}
