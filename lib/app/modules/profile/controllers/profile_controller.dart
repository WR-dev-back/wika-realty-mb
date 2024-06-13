import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wr_project/app/routes/app_pages.dart';

import '../../auth/login/model/login_model.dart';

class ProfileController extends GetxController {
  final GetStorage storage = GetStorage(); // Initialize GetStorage

  late User user;
  late Ppu ppu;

  @override
  void onInit() {
    super.onInit();

    final String userJson = storage.read('user');
    try {
      user = User.fromJson(jsonDecode(userJson));
    } catch (e) {
      print('Error parsing user data: $e');
    }

    final String ppuJson = storage.read('ppu');
    ppu = Ppu.fromJson(jsonDecode(ppuJson));
  }

  void deleteToken() async {
    await storage.remove('token');
    // Navigate to login screen
    Get.offAllNamed(Routes.LOGIN);
  }
}
