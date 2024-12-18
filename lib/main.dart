import 'dart:io';

import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/app_routes_fun.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/local_notifications_service.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/phoneix.dart';
import 'core/utils/unfucs.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (v) => GlobalNotification().setUpFirebase(),
  );
  await lang.EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();
  Prefs = await SharedPreferences.getInstance();
  // Prefs.clear();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return lang.EasyLocalization(
      path: 'assets/translations',
      saveLocale: true,
      startLocale: Prefs.getString('lang') != 'en' ? const Locale('en', "US") : const Locale('ar', 'EG'),
      fallbackLocale: const Locale('en', "US"),
      supportedLocales: const [Locale('ar', 'EG'), Locale('en', "US")],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            themeMode: ThemeMode.light,
            initialRoute: AppRoutes.init.initial,
            routes: AppRoutes.init.appRoutes,
            navigatorKey: navigator,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.lightTheme,
            builder: (context, child) {
              ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                return Scaffold(appBar: AppBar(elevation: 0, backgroundColor: Colors.white));
              };
              return Phoenix(
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.sp)),
                  child: Unfocus(child: child ?? const SizedBox.shrink()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ignore: non_constant_identifier_names
late SharedPreferences Prefs;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (cert, host, port) => true;
  }
}
