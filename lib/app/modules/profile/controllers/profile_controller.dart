import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wr_project/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  void deleteToken() async {
    final SharedPreferences tkne = await SharedPreferences.getInstance();
    await tkne.remove('token');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    // Navigate to login screen
    Get.offAllNamed(Routes.LOGIN);
  }
}
