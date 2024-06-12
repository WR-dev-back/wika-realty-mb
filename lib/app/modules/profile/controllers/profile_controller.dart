import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wr_project/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final GetStorage storage = GetStorage(); // Initialize GetStorage

  void deleteToken() async {
    await storage.remove('token');
    // Navigate to login screen
    Get.offAllNamed(Routes.LOGIN);
  }
}
