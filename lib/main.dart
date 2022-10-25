import 'package:admin/features/add_new_user/data/datasource/remote_datasource.dart';
import 'package:admin/features/add_new_user/data/repositories/user_repositories_imp.dart';
import 'package:admin/features/add_new_user/domain/usecase/add_user_usecase.dart';
import 'package:admin/features/add_new_user/domain/usecase/delete_user_usecase.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

import 'core/constants/db_constants.dart';
import 'features/add_new_user/domain/usecase/get_users_usercase.dart';
import 'features/add_new_user/presentation/controller/user_controller.dart';
import 'features/housing/data/datasource/local_datasource.dart';
import 'features/housing/data/datasource/remote_datasource.dart';
import 'features/housing/data/repositories/housing_repository.dart';
import 'features/housing/domain/usecase/add_housing_usecase.dart';
import 'features/housing/domain/usecase/delete_housing_usecase.dart';
import 'features/housing/domain/usecase/get_housings_usecase.dart';
import 'features/housing/domain/usecase/update_housing_usecase.dart';
import 'features/housing/presentation/controller/controller.dart';
import 'features/owning/data/datasource/local_datasource.dart';
import 'features/owning/data/datasource/remote_datasource.dart';
import 'features/owning/data/repositories/owning_repository.dart';
import 'features/owning/domain/usecase/add_owning_usecase.dart';
import 'features/owning/domain/usecase/delete_owning_usecase.dart';
import 'features/owning/domain/usecase/get_housings_usecase.dart';
import 'features/owning/domain/usecase/update_owning_usecase.dart';
import 'features/owning/presentation/controller/controller.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocators();

  await Hive.initFlutter();
  await Hive.openBox(DBConstants.SOCIAL_STATUS_NAME);
  await Hive.openBox(DBConstants.WORK_NAME);
  await Hive.openBox(DBConstants.HOUSING_NAME);
  await Hive.openBox(DBConstants.OWNING_NAME);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ScreenUtilInit(
    designSize: const Size(414, 896),
    builder: (_,__) => GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', '')
      ],
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

    Get.put(SocialStatusLocalDataSource());
    Get.put(WorkLocalDataSource());
    Get.put(HousingLocalDataSource());
    Get.put(OwningLocalDataSource());
    // end register local storage

    Get.lazyPut(() => UserRemoteDataSourceImp());
    Get.lazyPut(() => UserRepositoryImp(Get.find<UserRemoteDataSourceImp>()));
    Get.lazyPut(() => AddUserUsecase(Get.find<UserRepositoryImp>()));
    Get.lazyPut(() => GetUsersUsecase(Get.find<UserRepositoryImp>()));
    Get.lazyPut(() => UpdateUserUsecase(Get.find<UserRepositoryImp>()));
    Get.lazyPut(() => DeleteUserUsecase(Get.find<UserRepositoryImp>()));

    Get.put(
        UserController(
            Get.find<AddUserUsecase>(),
            Get.find<UpdateUserUsecase>(),
            Get.find<GetUsersUsecase>(),
            Get.find<DeleteUserUsecase>()),
        permanent: true);

    Get.lazyPut<MainScreenController>(
      () => MainScreenController(),
      fenix: true,
    );
    Get.lazyPut<MainScreenController>(
      () => MainScreenController(),
      fenix: true,
    );

    //===================== work controllers =====================
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

    //===================== end work controllers =====================

    //===================== social status controllers =====================
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

    //=====================end social status controllers =====================

    //===================== housing controllers =====================
    Get.lazyPut(() => HousingRemoteDataSource());
    Get.lazyPut(() => HousingRepository(Get.find<HousingRemoteDataSource>(),
        Get.find<HousingLocalDataSource>()));
    Get.lazyPut(() => GetHousingsUseCase(Get.find<HousingRepository>()));
    Get.lazyPut(() => AddHousingUsecase(Get.find<HousingRepository>()));
    Get.lazyPut(() => UpdateHousingUsecase(Get.find<HousingRepository>()));
    Get.lazyPut(() => RemoveHousingUseCase(Get.find<HousingRepository>()));

    Get.lazyPut(() => HousingController(
          Get.find<GetHousingsUseCase>(),
          Get.find<AddHousingUsecase>(),
          Get.find<UpdateHousingUsecase>(),
          Get.find<RemoveHousingUseCase>(),
        ));

    //===================== end housing controllers =====================

    //===================== owning controllers =====================
    Get.lazyPut(() => OwningRemoteDataSource());
    Get.lazyPut(() => OwningRepository(
        Get.find<OwningRemoteDataSource>(), Get.find<OwningLocalDataSource>()));
    Get.lazyPut(() => GetOwningUseCase(Get.find<OwningRepository>()));
    Get.lazyPut(() => AddOwningUsecase(Get.find<OwningRepository>()));
    Get.lazyPut(() => UpdateOwningUsecase(Get.find<OwningRepository>()));
    Get.lazyPut(() => RemoveOwningUseCase(Get.find<OwningRepository>()));

    Get.lazyPut(() => OwningController(
          Get.find<GetOwningUseCase>(),
          Get.find<AddOwningUsecase>(),
          Get.find<UpdateOwningUsecase>(),
          Get.find<RemoveOwningUseCase>(),
        ));

    //===================== end owning controllers =====================
  }
}
