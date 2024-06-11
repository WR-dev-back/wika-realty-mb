import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/models/approval.dart';
import '../provider/approval_provider.dart';

class ApprovalController extends GetxController {
  final ApprovalProvider approvalProvider = Get.find();
  var isFetching = false.obs;
  var approvals = <Approval>[].obs;
  var isLoading = false.obs;

  void startFetching() => isFetching(true);

  void stopFetching() => isFetching(false);

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    fetchApproval();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchApproval() async {
    isLoading(true);
    try {
      final response = await approvalProvider.getApproval();
      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.body;
        approvals.value =
            responseData.map((e) => Approval.fromJson(e)).toList();
      } else {
        print('Failed to load approvals: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    } finally {
      isLoading(false);
    }
  }

  var isRefreshing = false.obs;

  Future<void> refreshData() async {
    isRefreshing(true);
    await fetchApproval();
    isRefreshing(false);
  }
}
