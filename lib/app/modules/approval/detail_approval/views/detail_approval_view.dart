import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';

import '../../../../common/models/approval.dart';
import '../../../../utils/constant/style/text_styles.dart';
import '../controllers/detail_approval_controller.dart';

class DetailApprovalView extends GetView<DetailApprovalController> {
  const DetailApprovalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Approval approval = Get.arguments;

    Future<bool> showConfirmationDialog(
        BuildContext context, String action) async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Confirm $action'),
              content: Text('Are you sure you want to $action this item?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('Cancel'),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColor.primary), // Set the background color here
                  ),
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        color: Colors
                            .white), // Optionally set the text color to ensure readability
                  ),
                )
              ],
            ),
          ) ??
          false;
    }

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
      body: SingleChildScrollView(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Approval Name',
                                style: TextStyles.headerStyleProfile,
                              ),
                              Text(
                                '${approval.name}',
                                style: TextStyles.approvalTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contract Number',
                                style: TextStyles.headerStyleProfile,
                              ),
                              Text(
                                '${approval.property.contractNo}',
                                style: TextStyles.approvalTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Customer Code',
                                style: TextStyles.headerStyleProfile,
                              ),
                              Text(
                                '${approval.property.customerCode}',
                                style: TextStyles.approvalTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Customer Name',
                                style: TextStyles.headerStyleProfile,
                              ),
                              Text(
                                '${approval.property.customerName}',
                                style: TextStyles.approvalTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Unit Description',
                                style: TextStyles.headerStyleProfile,
                              ),
                              Text(
                                '${approval.property.unitDesc}',
                                style: TextStyles.approvalTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Unit Code',
                                style: TextStyles.headerStyleProfile,
                              ),
                              Text(
                                '${approval.property.unitCode}',
                                style: TextStyles.approvalTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contract Value Netto',
                                style: TextStyles.headerStyleProfile,
                              ),
                              Text(
                                '${approval.property.contractValueNetto}',
                                style: TextStyles.approvalTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contract Value Brutto',
                                style: TextStyles.headerStyleProfile,
                              ),
                              Text(
                                '${approval.property.contractValueBrutto}',
                                style: TextStyles.approvalTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Booking Fee Brutto',
                                style: TextStyles.headerStyleProfile,
                              ),
                              Text(
                                '${approval.property.bookingFeeBruto}',
                                style: TextStyles.approvalTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Booking Fee Netto',
                                style: TextStyles.headerStyleProfile,
                              ),
                              Text(
                                '${approval.property.bookingFeeNetto}',
                                style: TextStyles.approvalTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Progress Count',
                                style: TextStyles.headerStyleProfile,
                              ),
                              Text(
                                '${approval.property.progressConst}',
                                style: TextStyles.approvalTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cancel Date',
                                style: TextStyles.headerStyleProfile,
                              ),
                              Text(
                                '${approval.property.cancelDate}',
                                style: TextStyles.approvalTextStyle,
                              ),
                            ],
                          ),
                          // Add more details as needed
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (approval.status ==
                  'pending') // Check if the status is pending
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (await showConfirmationDialog(
                              context, 'approve')) {
                            await controller.approve(approval.id);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                        ),
                        child: Text(
                          "Accept",
                          style: TextStyles.cardbuttomTextStyle,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (await showConfirmationDialog(context, 'reject')) {
                            await controller.reject(approval.id);
                          }
                        },
                        child: const Text("Reject"),
                      ),
                    ],
                  ),
                )
              else
                Container(height: 0),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
