import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wr_project/app/routes/app_pages.dart';
import '../controllers/splashscreen_controller.dart';
import '../widgets/introscreen_widget.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  SplashscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _checkToken(context);
    return Scaffold(
        appBar: AppBar(), body: IntroscreenWidget(controller: controller));
  }
}

void _checkToken(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  if (token != null && token.isNotEmpty) {
    // Token exists, navigate to home screen

    Get.toNamed(Routes.HOME);
  } else {
    // Token doesn't exist,
    Get.toNamed(Routes.SPLASHSCREEN);
  }
}
