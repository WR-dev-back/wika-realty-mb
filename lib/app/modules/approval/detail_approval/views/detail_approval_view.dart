import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:wr_project/app/utils/constant/style/app_color.dart';
import '../../../../common/models/approval.dart';
import '../../../../utils/constant/style/text_styles.dart';
import '../controllers/detail_approval_controller.dart';

class DetailApprovalView extends GetView<DetailApprovalController> {
  const DetailApprovalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Datum approval = Get.arguments;
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id_ID', // Indonesian locale
      symbol: 'Rp.', // Currency symbol
      decimalDigits: 0, // Number of decimal digits
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
                            children: [
                              buildTextColumn('Approval Name', approval.name),
                              const SizedBox(height: 10),
                              buildTextColumn('Unit Description',
                                  approval.property?.unitDesc),
                              const SizedBox(height: 15),
                              Divider(
                                  color: Colors.grey, height: 1, thickness: 2),
                              const SizedBox(height: 15),
                              buildTextColumn('Contract Number',
                                  approval.property?.contractNo),
                              const SizedBox(height: 10),
                              buildTextColumn('Customer Code',
                                  approval.property?.customerCode),
                              const SizedBox(height: 10),
                              buildTextColumn('Customer Name',
                                  approval.property?.customerName),
                              const SizedBox(height: 10),
                              buildTextColumn(
                                  'Unit Code', approval.property?.unitCode),
                              const SizedBox(height: 10),
                              buildCurrencyColumn(
                                  'Contract Value Netto',
                                  approval.property?.contractValueNetto,
                                  currencyFormat),
                              const SizedBox(height: 10),
                              buildCurrencyColumn(
                                  'Contract Value Brutto',
                                  approval.property?.contractValueBrutto,
                                  currencyFormat),
                              const SizedBox(height: 10),
                              buildCurrencyColumn(
                                  'Booking Fee Brutto',
                                  approval.property?.bookingFeeBruto,
                                  currencyFormat),
                              const SizedBox(height: 10),
                              buildCurrencyColumn(
                                  'Booking Fee Netto',
                                  approval.property?.bookingFeeNetto,
                                  currencyFormat),
                              const SizedBox(height: 10),
                              buildTextColumn('Progress Count',
                                  approval.property?.progressConst),
                              const SizedBox(height: 10),
                              buildTextColumn(
                                  'Cancel Date', approval.property?.cancelDate),
                              const SizedBox(height: 10),
                              buildTextColumn('Refund Recommendation',
                                  approval.property?.refundRecommendation),
                              const SizedBox(height: 10),
                              buildTextColumn(
                                  'Ri Refund', approval.property?.riRefound),
                              const SizedBox(height: 10),
                              buildTextColumn('Recommendation Value',
                                  approval.property?.recommendationValue),
                              const SizedBox(height: 70),
                            ],
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
                                await controller.reject(approval.id);
                              },
                            );
                          }),
                          buildActionButton(context, "Approve",
                              Icons.check_circle, Colors.green, () async {
                            _showConfirmationDialog(
                              context,
                              "Are you sure you want to Approve this item?",
                              () async {
                                await controller.approve(approval.id);
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
