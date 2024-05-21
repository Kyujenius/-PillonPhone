import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:pill_on_phone/config/app_config.dart';
import 'package:pill_on_phone/config/app_pages.dart';
import 'package:pill_on_phone/config/app_routes.dart';
import 'package:pill_on_phone/utility/dependency.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      // App Title
      title: AppConfig.APP_TITLE,

      // Localization
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('ko', 'KR'),

      // Theme
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: AppConfig.APP_FONT_STYLE,
        primaryColor: const Color(0xFFf6f6f8),
        scaffoldBackgroundColor: const Color(0xFFf6f6f8),
      ),

      // Initial Route
      initialRoute: AppRoutes.ROOT,
      initialBinding: Dependency(),
      getPages: AppPages.data,
    );
  }
}
