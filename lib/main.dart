import 'package:admin/controllers/MenuController.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/services/service_locator.dart';
import 'package:admin/utils/page_route_name.dart';
import 'package:admin/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:provider/provider.dart';

import 'controllers/appProvider.dart';
import 'controllers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocators();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MenuController(),
    ),
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.read<AuthProvider>().initUser();
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: () => MaterialApp(
        navigatorKey: sL<AppProvider>().navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Admin Panel',
        theme: ThemeData(
            // textTheme: Theme.of(context).textTheme.apply(
            //       bodyColor: Colors.white,
            //     ),
            // canvasColor: secondaryColor,
            ),
        // theme: ThemeData.dark().copyWith(
        //   scaffoldBackgroundColor: bgColor,
        //   textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        //       .apply(bodyColor: Colors.white),
        //   canvasColor: secondaryColor,
        // ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("ar", "AE"),
        ],
        locale: Locale("ar", "AE"),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: PageRouteName.MAIN_SCREEN,
      ),
    );
  }
}
