import 'package:get/get.dart';

import '../controllers/edit_detail_leads_controller.dart';

class EditDetailLeadsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDetailLeadsController>(
      () => EditDetailLeadsController(),
    );
  }
}
