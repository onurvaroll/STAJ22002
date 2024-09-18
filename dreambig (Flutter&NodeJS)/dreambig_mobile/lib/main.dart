import 'package:dreambig_mobile/controller/server/api/server_controller.dart';
import 'package:dreambig_mobile/controller/text_controller/text_controller.dart';
import 'package:dreambig_mobile/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //final themeController = Get.put(ThemeController());
  Get.put(TextControllers());
  Get.put(ServerController());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    //theme: themeController.lightTheme,
    home: SplashScreen(),
  ));
}
