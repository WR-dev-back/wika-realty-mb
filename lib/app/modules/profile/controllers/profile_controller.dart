import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wr_project/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  void deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    // Navigate to login screen
    Get.toNamed(Routes.LOGIN);
  }
}
