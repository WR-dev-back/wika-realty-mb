import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wr_project/app/modules/approval/detail_approval/views/approval_details.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';
import '../../../../common/models/approval_details.dart';
import '../../../../utils/constant/style/text_styles.dart';
import '../controllers/detail_approval_controller.dart';

class DetailApprovalView extends GetView<DetailApprovalController> {
  const DetailApprovalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp.',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: Text('Detail Approval', style: TextStyles.titleLabelStyle),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: Obx(() {
        if (controller.approvalDetail.value.data.id.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        Data approval = controller.approvalDetail.value.data;

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ApprovalDetails(
                    approval: approval, currencyFormat: currencyFormat),
              ),
            ),
            if (controller.approvalStatus.value == 'pending')
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ApprovalActions(controller: controller),
              ),
          ],
        );
      }),
    );
  }
}

class ApprovalActions extends StatelessWidget {
  final DetailApprovalController controller;

  const ApprovalActions({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Data approval = controller.approvalDetail.value.data;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildActionButton(context, "Reject", Icons.cancel, AppColor.error,
            () async {
          _showConfirmationDialog(context, "reject", () {
            controller.reject(approval.id);
          });
        }),
        SizedBox(width: 20), // Add space between the buttons
        buildActionButton(
            context, "Approve", Icons.check_circle, AppColor.succes, () async {
          _showConfirmationDialog(context, "approve", () {
            controller.approve(approval.id);
          });
        }),
      ],
    );
  }

  Widget buildActionButton(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return Flexible(
      child: SizedBox(
        height: 40,
        width: 300,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
          ),
          icon: Icon(icon, color: Colors.white),
          label: Text(label, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  void _showConfirmationDialog(
      BuildContext context, String action, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm $action'),
          content: Text('Are you sure you want to $action this approval?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
            ),
          ],
        );
      },
    );
  }
}
