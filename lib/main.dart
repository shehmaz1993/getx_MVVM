import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_project/res/getx_localization/languages.dart';
import 'package:getx_project/res/routes/routes.dart';
import 'package:getx_project/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Languages(),
      locale: const Locale('bn','BD'),
      fallbackLocale: const Locale('en','US'),
     // home: SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}

