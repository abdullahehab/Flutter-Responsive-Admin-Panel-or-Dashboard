import 'package:admin/features/add_new_user/data/datasource/remote_datasource.dart';
import 'package:admin/features/add_new_user/data/repositories/user_repositories_imp.dart';
import 'package:admin/features/add_new_user/domain/usecase/add_user_usecase.dart';
import 'package:admin/features/add_new_user/domain/usecase/update_user_usecase.dart';
import 'package:admin/screens/main/components/main_screen_controller.dart';
import 'package:admin/services/service_locator.dart';
import 'package:admin/utils/app_pages.dart';
import 'package:admin/utils/page_route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'features/add_new_user/presentation/controller/user_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocators();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ScreenUtilInit(
    designSize: const Size(414, 896),
    builder: () => GetMaterialApp(
      title: "Dewan Project",
      debugShowCheckedModeBanner: false,
      initialRoute: PageRouteName.ADD_NEW,
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
    Get.lazyPut(() => UpdateUserUsecase(Get.find<UserRepositoryImp>()));

    Get.put(UserController(Get.find<AddUserUsecase>(), Get.find<UpdateUserUsecase>()), permanent: true);

    Get.lazyPut<MainScreenController>(
      () => MainScreenController(),
      fenix: true,
    );
  }
}
