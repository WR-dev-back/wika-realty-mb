import 'package:get/get.dart';

class HomeController extends GetxController {
  var isRefreshing = false.obs;

  Future<void> refreshData() async {
    // Set isRefreshing to true to indicate the refresh operation has started
    isRefreshing(true);

    // Simulate a delay for the refresh operation
    await Future.delayed(Duration(seconds: 2));

    // After the delay, set isRefreshing back to false
    isRefreshing(false);
  }
}
