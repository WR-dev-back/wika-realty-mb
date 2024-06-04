import 'package:get/get.dart';
import 'package:wr_project/app/modules/leads/detail_leads/controllers/detail_leads_controller.dart';

class DetailLeadsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailLeadsController>(() => DetailLeadsController());
  }
}
