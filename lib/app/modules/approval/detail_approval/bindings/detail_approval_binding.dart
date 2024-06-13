import 'package:get/get.dart';
import 'package:wr_project/app/modules/approval/detail_approval/provider/detail_approval_provider.dart';

import '../controllers/detail_approval_controller.dart';

class DetailApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailApprovalController>(
      () => DetailApprovalController(),
    );
    Get.put(
      DetailApprovalProvider(),
    );
  }
}
