import 'package:get/get.dart';
import 'package:wr_project/app/modules/approval/controllers/approval_controller.dart';
import 'package:wr_project/app/modules/approval/detail_approval/provider/detail_approval_provider.dart';

class DetailApprovalController extends GetxController {
  final DetailApprovalProvider detailApprovalProvider = Get.find();
  final ApprovalController approvalController = Get.find();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> approve(String approvalId) async {
    try {
      final response = await detailApprovalProvider.approve(approvalId);
      if (response.statusCode == 200) {
        final responseData = response.body;
        if (responseData['status']) {
          Get.snackbar('Success', responseData['message'],
              snackPosition: SnackPosition.TOP);
          approvalController.fetchApproval();
        } else {
          Get.snackbar('Error', responseData['message'],
              snackPosition: SnackPosition.TOP);
        }
      } else {
        Get.snackbar('Error', 'Failed to approve: ${response.statusText}',
            snackPosition: SnackPosition.TOP);
      }
    } catch (error) {
      Get.snackbar('Error', 'Error approving: $error',
          snackPosition: SnackPosition.TOP);
    }
  }

  Future<void> reject(String approvalId) async {
    try {
      final response = await detailApprovalProvider.approve(approvalId);
      if (response.statusCode == 200) {
        final responseData = response.body;
        if (responseData['status']) {
          Get.snackbar('Success', responseData['message'],
              snackPosition: SnackPosition.TOP);
          approvalController.fetchApproval();
        } else {
          Get.snackbar('Error', responseData['message'],
              snackPosition: SnackPosition.TOP);
        }
      } else {
        Get.snackbar('Error', 'Failed to approve: ${response.statusText}',
            snackPosition: SnackPosition.TOP);
      }
    } catch (error) {
      Get.snackbar('Error', 'Error approving: $error',
          snackPosition: SnackPosition.TOP);
    }
  }
}
