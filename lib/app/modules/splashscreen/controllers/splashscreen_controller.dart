import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class SplashscreenController extends GetxController {
  final keyIntroScreen = GlobalKey<IntroductionScreenState>();

  void checkTokenAndNavigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      Get.offAllNamed(Routes.HOME); // Navigate to home route
    } else {
      Get.offAllNamed(Routes.SPLASHSCREEN); // Navigate to splash screen route
    }
  }

  SplashScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkTokenAndNavigate();
    });
  }

  @override
  void onClose() {}
  void goToHome() => Get.toNamed(Routes.LOGIN);
}
