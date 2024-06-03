import 'package:get/get.dart';
import 'package:wr_project/app/modules/leads/detail_leads/provider/detail_leads_provider.dart';

class DetailLeadsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailLeadsProvider>(() => DetailLeadsProvider());
  }
}
