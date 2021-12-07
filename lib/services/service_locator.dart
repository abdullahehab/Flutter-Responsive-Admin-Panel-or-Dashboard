import 'package:admin/controllers/appProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';



final GetIt sL = GetIt.I;

Future<void> setupLocators() async {
  final SharedPreferences sharedPref = await SharedPreferences.getInstance();
  // sL.registerSingleton<SharedPrefService>(SharedPrefService(sharedPref));

  sL.registerSingleton<AppProvider>(AppProvider());

  sL.registerLazySingleton<BuildContext>(() {
    final BuildContext? context = sL<AppProvider>().navigatorKey.currentContext;
    return context!;
  });
  //
  // sL.registerLazySingleton<SignUpProvider>(() {
  //   final SignUpProvider signUpProvider = SignUpProvider();
  //   return signUpProvider;
  // });
  //
  // sL.registerLazySingleton<ForgetPasswordProvider>(() {
  //   final ForgetPasswordProvider forgetPasswordProvider =
  //       ForgetPasswordProvider();
  //   return forgetPasswordProvider;
  // });
  //
  // sL.registerLazySingleton<ForgetPasswordConfirmationProvider>(() {
  //   final ForgetPasswordConfirmationProvider
  //       forgetPasswordConfirmationProvider =
  //       ForgetPasswordConfirmationProvider();
  //   return forgetPasswordConfirmationProvider;
  // });
  //
  // sL.registerLazySingleton<ConfirmationProvider>(() {
  //   final ConfirmationProvider confirmationProvider = ConfirmationProvider();
  //   return confirmationProvider;
  // });
  //
  // sL.registerLazySingleton<ProductProvider>(() {
  //   final ProductProvider productProvider = ProductProvider();
  //   return productProvider;
  // });
  //
  // sL.registerLazySingleton<ProfileProvider>(() {
  //   final ProfileProvider profileProvider = ProfileProvider();
  //   return profileProvider;
  // });
}
