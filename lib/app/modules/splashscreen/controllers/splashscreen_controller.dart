import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../routes/app_pages.dart';

class SplashscreenController extends GetxController {
  final keyIntroScreen = GlobalKey<IntroductionScreenState>();

  @override
  void onClose() {}
  void goToHome() => Get.offAllNamed(Routes.LOGIN);
}
