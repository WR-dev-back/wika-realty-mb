import 'dart:convert';
import 'package:get/get.dart';
import 'package:wr_project/app/modules/approval/controllers/approval_controller.dart';
import 'package:wr_project/app/modules/approval/detail_approval/provider/detail_approval_provider.dart';
import 'package:wr_project/app/routes/app_pages.dart';
import '../../../../common/models/approval_details.dart';

class DetailApprovalController extends GetxController {
  final DetailApprovalProvider detailApprovalProvider = Get.find();
  final ApprovalController approvalController = Get.find();
  final RxString approvalStatus = ''.obs;
  var approvalDetail = ApprovalDetail().obs;

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

  Future<void> fetchApprovalDetail(String approvalId) async {
    try {
      final response =
          await DetailApprovalProvider().fetchApprovalDetail(approvalId);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        approvalDetail.value = ApprovalDetail.fromJson(responseData['data']);
        approvalStatus.value = approvalDetail.value.data?.status ?? '';
      } else {
        print('Request failed: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
}
