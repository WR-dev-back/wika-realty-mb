import 'package:get/get.dart';
import 'package:wr_project/app/modules/approval/controllers/approval_controller.dart';
import 'package:wr_project/app/modules/approval/detail_approval/provider/detail_approval_provider.dart';
import 'package:wr_project/app/routes/app_pages.dart';

class DetailApprovalController extends GetxController {
  final DetailApprovalProvider detailApprovalProvider = Get.find();
  final ApprovalController approvalController = Get.find();

  final count = 0.obs;
  final RxString approvalStatus = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final approval = Get.arguments;
    approvalStatus.value = approval.status;
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
        print(responseData);
        if (responseData['status']) {
          Get.snackbar('Success', responseData['message'],
              snackPosition: SnackPosition.TOP);
          approvalStatus.value = 'accepted';
          approvalController.fetchApproval();
          Get.offAllNamed(Routes.HOME);
          Get.toNamed(Routes.APPROVAL);
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
      final response = await detailApprovalProvider.reject(approvalId);
      if (response.statusCode == 200) {
        final responseData = response.body;
        print(responseData);
        if (responseData['status']) {
          Get.snackbar('Success', responseData['message'],
              snackPosition: SnackPosition.TOP);
          approvalStatus.value = 'rejected';
          approvalController.fetchApproval();
          Get.offAllNamed(Routes.HOME);
          Get.toNamed(Routes.APPROVAL);
        } else {
          Get.snackbar('Error', responseData['message'],
              snackPosition: SnackPosition.TOP);
        }
      } else {
        Get.snackbar('Error', 'Failed to reject: ${response.statusText}',
            snackPosition: SnackPosition.TOP);
      }
    } catch (error) {
      Get.snackbar('Error', 'Error rejecting: $error',
          snackPosition: SnackPosition.TOP);
    }
  }
}
