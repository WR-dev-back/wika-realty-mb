import 'package:get/get.dart';
import 'package:wr_project/app/modules/approval/provider/approval_provider.dart';

import '../controllers/approval_controller.dart';

class ApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApprovalController>(
      () => ApprovalController(),
    );
    Get.put(
      ApprovalProvider(),
    );
  }
}
