import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../common/models/approval.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constant/style/app_color.dart';
import '../../../utils/constant/style/text_styles.dart';
import '../controllers/approval_controller.dart';

class ApprovalView extends GetView<ApprovalController> {
  const ApprovalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: AppColor.primary,
        title: Text(
          'Approval View',
          style: TextStyles.titleLabelStyle,
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _buildSearchField(),
              Expanded(
                child: Obx(
                  () => _buildApprovalList(controller.filteredApprovals),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Search Approval',
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: controller.searchApproval,
    );
  }

  Widget _buildApprovalList(List<Approval> approvals) {
    if (controller.isFetching.value) {
      return _buildLoadingIndicator();
    } else if (controller.hasError.value) {
      return _buildErrorIndicator();
    } else if (approvals.isEmpty) {
      return _buildEmptyIndicator();
    } else {
      return ListView.builder(
        itemCount: approvals.length,
        itemBuilder: (context, index) {
          final approval = approvals[index];
          final icon = _getTrailingIcon(approval.property.approvalStatus);
          final iconColor =
              _getTrailingIconColor(approval.property.approvalStatus);
          final statusIcon = _getStatusIcon(approval.status);
          final statusIconColor = _getStatusIconColor(approval.status);
          return _buildApprovalItem(
              approval, icon, iconColor, statusIcon, statusIconColor);
        },
      );
    }
  }

  Widget _buildLoadingIndicator() {
    return Center(child: Lottie.asset('asset/animations/loading.json'));
  }

  Widget _buildErrorIndicator() {
    return Center(child: Lottie.asset('asset/animations/error.json'));
  }

  Widget _buildEmptyIndicator() {
    return Center(child: Lottie.asset('asset/animations/isEmpty.json'));
  }

  IconData _getTrailingIcon(String status) {
    switch (status) {
      case 'approved':
        return Icons.check;
      case 'reject':
        return Icons.close;
      default:
        return Icons.hourglass_empty;
    }
  }

  Color _getTrailingIconColor(String status) {
    switch (status) {
      case 'approved':
        return Colors.green;
      case 'reject':
        return Colors.redAccent;
      default:
        return Colors.blue;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'pending':
        return Icons.autorenew;
      case 'approved':
        return Icons.done_all;
      case 'reject':
        return Icons.error;
      default:
        return Icons.help;
    }
  }

  Color _getStatusIconColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.grey;
      case 'approved':
        return Colors.green;
      case 'reject':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  Widget _buildApprovalItem(Approval approval, IconData icon, Color iconColor,
      IconData statusIcon, Color statusIconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ListTile(
          title: Text(
            approval.name,
            style: TextStyles.headerapprovalStyleProfile
                .copyWith(color: _getTextColor(statusIconColor)),
          ),
          subtitle: Text(approval.property.unitDesc),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 10),
              Icon(statusIcon, color: statusIconColor),
            ],
          ),
          onTap: () => Get.toNamed(
            Routes.DETAIL_APPROVAL,
            arguments: approval,
          ),
        ),
      ),
    );
  }

  Color _getTextColor(Color statusIconColor) {
    if (statusIconColor == Colors.green) {
      return Colors.green;
    } else if (statusIconColor == Colors.red) {
      return Colors.redAccent;
    } else {
      return Colors.black;
    }
  }
}
