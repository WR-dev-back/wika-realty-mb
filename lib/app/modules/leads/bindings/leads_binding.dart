import 'package:get/get.dart';
import 'package:wr_project/app/modules/leads/provider/leads_provider.dart';

import '../controllers/leads_controller.dart';

class LeadsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeadsController>(
      () => LeadsController(),
    );
    Get.put(LeadsProvider());
  }
}
