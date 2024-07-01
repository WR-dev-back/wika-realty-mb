import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
      body: Stack(
        children: [
          Obx(() {
            if (controller.approvalDetail.value.data.id.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }

            Data approval = controller.approvalDetail.value.data;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ApprovalDetails(
                    approval: approval, currencyFormat: currencyFormat),
              ),
            );
          }),
          Obx(() => controller.approvalStatus.value == 'pending'
              ? Positioned(
                  top: 630,
                  left: 5,
                  right: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ApprovalActions(controller: controller),
                  ),
                )
              : Container()),
        ],
      ),
    );
  }
}

class ApprovalDetails extends StatelessWidget {
  final Data approval;
  final NumberFormat currencyFormat;

  const ApprovalDetails({
    Key? key,
    required this.approval,
    required this.currencyFormat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextColumn('Approval Name', approval.name),
        if (approval.property != null) ...[
          buildTextColumn('Unit Description', approval.property?.unitDesc),
          const Divider(color: Colors.grey, height: 1, thickness: 2),
          buildTextColumn('Contract Number', approval.property!.contractNo),
          buildTextColumn('Customer Code', approval.property!.customerCode),
          buildTextColumn('Customer Name', approval.property!.customerName),
          buildTextColumn('Unit Code', approval.property!.unitCode),
          buildCurrencyColumn('Contract Value Netto',
              approval.property!.contractValueNetto, currencyFormat),
          buildCurrencyColumn('Contract Value Brutto',
              approval.property!.contractValueBrutto, currencyFormat),
          buildCurrencyColumn('Booking Fee Brutto',
              approval.property!.bookingFeeBruto, currencyFormat),
          buildCurrencyColumn('Booking Fee Netto',
              approval.property!.bookingFeeNetto, currencyFormat),
          buildTextColumn('Progress Count', approval.property!.progressConst),
          buildTextColumn('Cancel Date', approval.property!.cancelDate),
          buildTextColumn(
              'Refund Recommendation', approval.property!.refundRecommendation),
          buildTextColumn('Ri Refund', approval.property!.riRefound),
          buildTextColumn(
              'Recommendation Value', approval.property!.recommendationValue),
        ],
        if (approval.purchaseOrder != null) ...[
          buildTextColumn(
              'Vendor Description', approval.purchaseOrder!.vendorDesc),
          const Divider(color: Colors.grey, height: 1, thickness: 2),
          buildTextColumn('PO Type', approval.purchaseOrder!.poType),
          buildTextColumn('Type Description', approval.purchaseOrder!.typeDesc),
          buildTextColumn('Vendor', approval.purchaseOrder!.vendor),
          buildTextColumn('Document Date', approval.purchaseOrder!.docDate),
          buildCurrencyColumn('Total Price', approval.purchaseOrder!.totalPrice,
              currencyFormat),
          buildTextColumn('PO Organization', approval.purchaseOrder!.poOrg),
          buildTextColumn('PO Group', approval.purchaseOrder!.poGroup),
          buildTextColumn('Company Code', approval.purchaseOrder!.companyCode),
          buildTextColumn(
              'Release Group', approval.purchaseOrder!.releaseGroup),
          buildTextColumn('Release Group Description',
              approval.purchaseOrder!.releaseGroupDesc),
          buildTextColumn('Release Code', approval.purchaseOrder!.releaseCode),
          buildTextColumn('PO Number', approval.purchaseOrder!.poNumber),
        ],
        const SizedBox(height: 70),
      ],
    );
  }

  Widget buildTextColumn(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.approvalTextStyle),
        Text(value ?? '-', style: TextStyles.buttonprofileTextStyle),
      ],
    );
  }

  Widget buildCurrencyColumn(String label, String? value, NumberFormat format) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.approvalTextStyle),
        Text(format.format(double.tryParse(value ?? "0") ?? 0),
            style: TextStyles.buttonprofileTextStyle),
      ],
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
