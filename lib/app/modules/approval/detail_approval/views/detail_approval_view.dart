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
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Detail Approval',
          style: TextStyles.titleLabelStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: buildDynamicWidgets(
                                controller.approvalDetail.value,
                                currencyFormat),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 630,
            left: 5,
            right: 5,
            child: Obx(
              () => controller.approvalStatus.value == 'pending'
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildActionButton(
                              context, "Reject", Icons.cancel, AppColor.error,
                              () async {
                            _showConfirmationDialog(
                              context,
                              "Are you sure you want to Reject this item?",
                              () async {
                                await controller.reject(
                                    controller.approvalDetail.value.data!.id);
                              },
                            );
                          }),
                          buildActionButton(context, "Approve",
                              Icons.check_circle, Colors.green, () async {
                            _showConfirmationDialog(
                              context,
                              "Are you sure you want to Approve this item?",
                              () async {
                                await controller.approve(
                                    controller.approvalDetail.value.data!.id);
                              },
                            );
                          }),
                        ],
                      ),
                    )
                  : Container(height: 0),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  List<Widget> buildDynamicWidgets(
      ApprovalDetail approvalDetail, NumberFormat currencyFormat) {
    List<Widget> widgets = [];

    widgets.add(buildTextColumn('Approval Name', approvalDetail.data?.name));

    if (approvalDetail.data?.property != null) {
      widgets.addAll([
        const SizedBox(height: 10),
        buildTextColumn(
            'Unit Description', approvalDetail.data?.property!.unitDesc),
        const SizedBox(height: 15),
        Divider(color: Colors.grey, height: 1, thickness: 2),
        const SizedBox(height: 15),
        buildTextColumn(
            'Contract Number', approvalDetail.data?.property!.contractNo),
        const SizedBox(height: 10),
        buildTextColumn(
            'Customer Code', approvalDetail.data?.property!.customerCode),
        const SizedBox(height: 10),
        buildTextColumn(
            'Customer Name', approvalDetail.data?.property!.customerName),
        const SizedBox(height: 10),
        buildTextColumn('Unit Code', approvalDetail.data?.property!.unitCode),
        const SizedBox(height: 10),
        buildCurrencyColumn('Contract Value Netto',
            approvalDetail.data?.property!.contractValueNetto, currencyFormat),
        const SizedBox(height: 10),
        buildCurrencyColumn('Contract Value Brutto',
            approvalDetail.data?.property!.contractValueBrutto, currencyFormat),
        const SizedBox(height: 10),
        buildCurrencyColumn('Booking Fee Brutto',
            approvalDetail.data?.property!.bookingFeeBruto, currencyFormat),
        const SizedBox(height: 10),
        buildCurrencyColumn('Booking Fee Netto',
            approvalDetail.data?.property!.bookingFeeNetto, currencyFormat),
        const SizedBox(height: 10),
        buildTextColumn(
            'Progress Count', approvalDetail.data?.property!.progressConst),
        const SizedBox(height: 10),
        buildTextColumn(
            'Cancel Date', approvalDetail.data?.property!.cancelDate),
        const SizedBox(height: 10),
        buildTextColumn('Refund Recommendation',
            approvalDetail.data?.property!.refundRecommendation),
        const SizedBox(height: 10),
        buildTextColumn('Ri Refund', approvalDetail.data?.property!.riRefound),
        const SizedBox(height: 10),
        buildTextColumn('Recommendation Value',
            approvalDetail.data?.property!.recommendationValue),
        const SizedBox(height: 70),
      ]);
    }

    if (approvalDetail.data?.purchaseOrder != null) {
      widgets.addAll([
        const SizedBox(height: 10),
        buildTextColumn('PO Type', approvalDetail.data?.purchaseOrder.poType),
        const SizedBox(height: 10),
        buildTextColumn('Vendor', approvalDetail.data?.purchaseOrder.vendor),
        const SizedBox(height: 10),
        buildTextColumn('Vendor Description',
            approvalDetail.data?.purchaseOrder.vendorDesc),
        const SizedBox(height: 10),
        buildTextColumn(
            'Document Date', approvalDetail.data?.purchaseOrder.docDate),
        const SizedBox(height: 10),
        buildTextColumn(
            'Total Price',
            currencyFormat.format(double.tryParse(
                    approvalDetail.data!.purchaseOrder.totalPrice) ??
                0)),
        const SizedBox(height: 10),
        buildTextColumn('PO Org', approvalDetail.data!.purchaseOrder.poOrg),
        const SizedBox(height: 10),
        buildTextColumn(
            'PO Group', approvalDetail.data!.purchaseOrder.poGroup ?? '-'),
        const SizedBox(height: 10),
        buildTextColumn(
            'Release Group', approvalDetail.data?.purchaseOrder.releaseGroup),
        const SizedBox(height: 10),
        buildTextColumn('Release Group Description',
            approvalDetail.data?.purchaseOrder.releaseGroupDesc),
        const SizedBox(height: 10),
        buildTextColumn(
            'PO Number', approvalDetail.data?.purchaseOrder.poNumber),
        const SizedBox(height: 10),
        buildTextColumn('Approval Status',
            approvalDetail.data?.purchaseOrder.approvalStatus),
        const SizedBox(height: 10),
        Text("Purchase Order Items", style: TextStyles.approvalTextStyle),
        const SizedBox(height: 10),
      ]);

      for (var item in approvalDetail.data!.purchaseOrder.items) {
        widgets.addAll([
          buildTextColumn("PO Item", item.poItem),
          buildTextColumn("Material Description", item.materialDesc),
          buildTextColumn("Quantity", item.poQuantity),
          buildTextColumn("Unit", item.poUnit),
          buildTextColumn("Delivery Date", item.deliveryDate),
          buildTextColumn("Unit Price",
              currencyFormat.format(double.tryParse(item.unitPrice) ?? 0)),
          buildTextColumn("Item Total Price",
              currencyFormat.format(double.tryParse(item.itemTotalPrice) ?? 0)),
          const SizedBox(height: 10),
        ]);
      }
    }
    return widgets;
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

  Widget buildActionButton(BuildContext context, String text, IconData icon,
      Color color, VoidCallback onPressed) {
    return Container(
      width: 150,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 5),
            Text(text, style: TextStyles.cardbuttomTextStyle),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(
      BuildContext context, String message, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: onConfirm,
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }
}
