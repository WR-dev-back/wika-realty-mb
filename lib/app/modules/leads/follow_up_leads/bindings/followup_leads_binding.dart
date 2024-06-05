import 'package:get/get.dart';

import '../controllers/followup_leads_controller.dart';

class FollowupLeadsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FollowupLeadsController>(
      () => FollowupLeadsController(),
    );
  }
}
