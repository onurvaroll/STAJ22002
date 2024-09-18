import 'package:dreambig_mobile/controller/server/api/server_controller.dart';
import 'package:dreambig_mobile/screens/authantication/login_screen.dart';
import 'package:dreambig_mobile/screens/home_page.dart';
import 'package:dreambig_mobile/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Autharization extends StatelessWidget {
  const Autharization({super.key});

  @override
  Widget build(BuildContext context) {
    final ServerController server = Get.find();
    return server.isSign ? LoginScreen() : MainPage();
  }
}
