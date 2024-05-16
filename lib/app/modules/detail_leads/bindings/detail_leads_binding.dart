import 'package:get/get.dart';

import '../controllers/detail_leads_controller.dart';

class DetailLeadsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailLeadsController>(
      () => DetailLeadsController(),
    );
  }
}
