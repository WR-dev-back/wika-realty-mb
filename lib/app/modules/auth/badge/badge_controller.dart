import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/modules/auth/badge/badge_provider.dart';

class BadgeController extends GetxController {
  final BadgeProvider badgeProvider = Get.put(
    BadgeProvider(),
  );

  RxInt pendingApprovalsCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPendingApprovals(); // Fetch pending approvals when the controller is initialized
  }

  Future<void> fetchPendingApprovals() async {
    try {
      final response = await badgeProvider.fetchPendingApprovals();
      if (response.statusCode == 200) {
        final approvals = response.body['data'] as List;
        pendingApprovalsCount.value = approvals
            .where((approval) =>
                approval['status'] == 'PENDING') // Assuming status is a String
            .length;

        // Call the function to update the badge count in the app launcher
        print(response.body);
        print('Pending approvals count: $pendingApprovalsCount.');
        updateAppBadge(pendingApprovalsCount.value);
      } else {
        print('Failed to fetch pending approvals: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching pending approvals: $e');
    }
  }

  void updateAppBadge(int count) {
    if (count > 0) {
      FlutterAppBadger.updateBadgeCount(count);
    } else {
      FlutterAppBadger.removeBadge();
    }
  }
}
