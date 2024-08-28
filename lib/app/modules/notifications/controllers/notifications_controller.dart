import 'package:get/get.dart';

class NotificationsController extends GetxController {
  RxString selectedValue = ''.obs;
  RxBool isBreakdown = false.obs;

  void updateDropdownValue(String? newValue) {
    if (newValue != null) {
      selectedValue.value = newValue;
    }
  }
}
