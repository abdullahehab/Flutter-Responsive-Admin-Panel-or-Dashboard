import 'package:admin/features/add_new_user/data/datasource/remote_datasource.dart';
import 'package:admin/features/add_new_user/data/repositories/user_repositories_imp.dart';
import 'package:admin/features/add_new_user/domain/usecase/add_user_usecase.dart';
import 'package:admin/features/add_new_user/domain/usecase/update_user_usecase.dart';
import 'package:admin/features/social_status/data/repositories/social_status_repository.dart';
import 'package:admin/features/social_status/domain/usecase/get_social_statues_usecase.dart';
import 'package:admin/features/working/domain/usecase/add_work_usecase.dart';
import 'package:admin/features/working/domain/usecase/delete_work_usecase.dart';
import 'package:admin/features/working/domain/usecase/update_work_usecase.dart';
import 'package:admin/features/working/presentation/controller/controller.dart';
import 'package:admin/screens/main/components/main_screen_controller.dart';
import 'package:admin/services/service_locator.dart';
import 'package:admin/utils/app_pages.dart';
import 'package:admin/utils/page_route_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

import 'core/constants/db_constants.dart';
import 'features/add_new_user/presentation/controller/user_controller.dart';
import 'features/social_status/data/datasource/local_datasource.dart';
import 'features/social_status/data/datasource/remote_datasource.dart';
import 'features/social_status/domain/usecase/add_social_statues_usecase.dart';
import 'features/social_status/domain/usecase/delete_social_status_usecase.dart';
import 'features/social_status/domain/usecase/update_social_statues_usecase.dart';
import 'features/social_status/presentation/controller/controller.dart';
import 'features/working/data/datasource/local_datasource.dart';
import 'features/working/data/datasource/remote_datasource.dart';
import 'features/working/data/repositories/work_repository.dart';
import 'features/working/domain/usecase/get_works_usecase.dart';
import 'firebase_options.dart';

StoreRef<int, Map<String, Object?>>? _socialStatusStore;
StoreRef<int, Map<String, Object?>>? _workStore;

late final Database? _db;

Future initLocalStorage() async {
  _socialStatusStore = intMapStoreFactory.store(DBConstants.SOCIAL_STATUS_NAME);
  _workStore = intMapStoreFactory.store(DBConstants.WORK_NAME);
  var factory = databaseFactoryWeb;

  // Open the database
  _db = await factory.openDatabase('dewan_project');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocators();

  await initLocalStorage();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // if (kIsWeb) {
  //   _socialStatusStore = intMapStoreFactory.store();
  //   var factory = databaseFactoryWeb;
  //   db = await factory.openDatabase('test');
  // } else {
  //   _socialStatusStore =
  //       intMapStoreFactory.store(DBConstants.SOCIAL_STATUS_NAME);
  //   db = await databaseFactoryIo.openDatabase(
  //       join('.dart_tool', 'sembast', 'example', 'record_demo.db'));
  // }

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
  void dependencies() async {
    // register local storage

    Get.put(SocialStatusLocalDataSource(_socialStatusStore, _db));
    Get.put(WorkLocalDataSource(_workStore, _db));
    // end register local storage

    Get.lazyPut(() => UserRemoteDataSourceImp());
    Get.lazyPut(() => UserRepositoryImp(Get.find<UserRemoteDataSourceImp>()));
    Get.lazyPut(() => AddUserUsecase(Get.find<UserRepositoryImp>()));
    Get.lazyPut(() => UpdateUserUsecase(Get.find<UserRepositoryImp>()));

    Get.put(
        UserController(
            Get.find<AddUserUsecase>(), Get.find<UpdateUserUsecase>()),
        permanent: true);

    Get.lazyPut<MainScreenController>(
      () => MainScreenController(),
      fenix: true,
    );
    Get.lazyPut<MainScreenController>(
      () => MainScreenController(),
      fenix: true,
    );

    Get.lazyPut(() => WorkRemoteDataSource());
    Get.lazyPut(() => WorkRepository(
        Get.find<WorkRemoteDataSource>(), Get.find<WorkLocalDataSource>()));
    Get.lazyPut(() => GetWorksUseCase(Get.find<WorkRepository>()));
    Get.lazyPut(() => AddWorkUsecase(Get.find<WorkRepository>()));
    Get.lazyPut(() => UpdateWorkUsecase(Get.find<WorkRepository>()));
    Get.lazyPut(() => RemoveWorkUseCase(Get.find<WorkRepository>()));

    Get.put(
        WorkController(
          Get.find<GetWorksUseCase>(),
          Get.find<AddWorkUsecase>(),
          Get.find<UpdateWorkUsecase>(),
          Get.find<RemoveWorkUseCase>(),
        ),
        permanent: true);

    Get.lazyPut(() => SocialStatusRemoteDataSource());
    Get.lazyPut(() => SocialStatusRepository(
          Get.find<SocialStatusRemoteDataSource>(),
          Get.find<SocialStatusLocalDataSource>(),
        ));
    Get.lazyPut(
        () => GetSocialStatuesUseCase(Get.find<SocialStatusRepository>()));
    Get.lazyPut(
        () => AddSocialStatusUsecase(Get.find<SocialStatusRepository>()));
    Get.lazyPut(
        () => UpdateSocialStatusUsecase(Get.find<SocialStatusRepository>()));
    Get.lazyPut(
        () => RemoveSocialStatuesUseCase(Get.find<SocialStatusRepository>()));

    Get.lazyPut(() => SocialStatusController(
          Get.find<GetSocialStatuesUseCase>(),
          Get.find<AddSocialStatusUsecase>(),
          Get.find<UpdateSocialStatusUsecase>(),
          Get.find<RemoveSocialStatuesUseCase>(),
        ));
  }
}
