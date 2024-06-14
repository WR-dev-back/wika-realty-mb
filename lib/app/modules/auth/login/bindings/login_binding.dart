import 'package:get/get.dart';
import 'package:wr_project/app/modules/auth/login/provider/login_provider.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.put(LoginProvider());
  }
}
