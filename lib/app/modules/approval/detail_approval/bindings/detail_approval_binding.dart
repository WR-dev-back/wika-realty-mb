import 'package:get/get.dart';

import '../controllers/detail_approval_controller.dart';

class DetailApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailApprovalController>(
      () => DetailApprovalController(),
    );
  }
}
