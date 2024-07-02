import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constant/style/app_color.dart';
import '../../../utils/constant/style/text_styles.dart';
import '../controllers/approval_controller.dart';

class ApprovalView extends GetView<ApprovalController> {
  ApprovalView({Key? key}) : super(key: key);

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
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Search Approval',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  controller.searchApproval(value);
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Obx(
                  () {
                    if (controller.isFetching.value) {
                      return Center(
                        child: Lottie.asset('asset/animations/loading.json'),
                      );
                    } else if (controller.hasError.value) {
                      return Center(
                        child: Lottie.asset('asset/animations/error.json'),
                      );
                    } else if (controller.filteredApprovals.isEmpty) {
                      return Center(
                        child: Lottie.asset('asset/animations/isEmpty.json'),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: controller.filteredApprovals.length,
                        itemBuilder: (context, index) {
                          final approval = controller.filteredApprovals[index];
                          IconData trailingIcon;
                          Color trailingIconColor = Colors.grey;
                          IconData statusIcon;
                          Color statusIconColor = Colors.grey;
                          Color textColor = Colors.black;

                          switch (approval.property?.approvalStatus) {
                            case 'approved':
                              trailingIcon = Icons.check;
                              trailingIconColor = Colors.green;
                              textColor = Colors.green;
                              break;
                            case 'reject':
                              trailingIcon = Icons.close;
                              trailingIconColor = Colors.redAccent;
                              textColor = Colors.redAccent;
                              break;
                            default:
                              trailingIcon = Icons.hourglass_empty;
                              trailingIconColor = Colors.blue;
                              textColor = Colors.grey;
                          }

                          switch (approval.status) {
                            case 'pending':
                              statusIcon = Icons.autorenew;
                              statusIconColor = Colors.grey;
                              break;
                            case 'approved':
                              statusIcon = Icons.done_all;
                              statusIconColor = Colors.green;
                              break;
                            case 'reject':
                              statusIcon = Icons.error;
                              statusIconColor = Colors.red;
                              break;
                            default:
                              statusIcon = Icons.help;
                              statusIconColor = Colors.blue;
                          }

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      approval.name,
                                      style: TextStyles
                                          .headerapprovalStyleProfile
                                          .copyWith(color: textColor),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Divider(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            approval.property?.unitDesc ??
                                                approval
                                                    .purchaseOrder!.typeDesc,
                                            style: TextStyles
                                                .headerapprovalStyleProfile
                                                .copyWith(color: textColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          trailingIcon,
                                          color: trailingIconColor,
                                        ),
                                        const SizedBox(width: 10),
                                        Icon(
                                          statusIcon,
                                          color: statusIconColor,
                                        ),
                                      ],
                                    ),
                                    onTap: () => Get.toNamed(
                                      Routes.DETAIL_APPROVAL,
                                      parameters: {'approvalId': approval.id},
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 150,
                                          child: ElevatedButton(
                                            onPressed: () => Get.toNamed(
                                              Routes.DETAIL_APPROVAL,
                                              parameters: {
                                                'approvalId': approval.id
                                              },
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColor.error,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Detail",
                                                  style: TextStyles
                                                      .cardbuttomTextStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        if (approval.property != null)
                                          Container(
                                            width: 150,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    TextEditingController
                                                        riRecommendationController =
                                                        TextEditingController();
                                                    TextEditingController
                                                        riRefundController =
                                                        TextEditingController();

                                                    return Dialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Container(
                                                        width: Get.width * 0.8,
                                                        // height: MediaQuery.of(
                                                        //             context)
                                                        //         .size
                                                        //         .height *
                                                        //     0.8, // Set dialog width to 80% of screen width
                                                        padding:
                                                            EdgeInsets.all(20),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              'Negosiasi',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyles
                                                                  .headerFieldStyle
                                                                  .copyWith(
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 20),
                                                            TextField(
                                                              controller:
                                                                  riRecommendationController,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'RI Recommendation',
                                                                labelStyle:
                                                                    TextStyles
                                                                        .approvalTextStyle,
                                                                prefixText:
                                                                    'Rp. ',
                                                              ),
                                                              inputFormatters: [
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly,
                                                                CurrencyInputFormatter(),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            TextField(
                                                              controller:
                                                                  riRefundController,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'RI Refund',
                                                                labelStyle:
                                                                    TextStyles
                                                                        .approvalTextStyle,
                                                                prefixText:
                                                                    'Rp. ',
                                                              ),
                                                              inputFormatters: [
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly,
                                                                CurrencyInputFormatter(),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 20),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                  child: Text(
                                                                      'Back'),
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    controller
                                                                        .submitNegotiation(
                                                                      approval
                                                                          .id,
                                                                      riRecommendationController
                                                                          .text,
                                                                      riRefundController
                                                                          .text,
                                                                    );
                                                                    Get.back();
                                                                  },
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                  ),
                                                                  child: Text(
                                                                    'Submit',
                                                                    style: TextStyles
                                                                        .cardbuttomTextStyle,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Negosiasi",
                                                    style: TextStyles
                                                        .cardbuttomTextStyle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    final int value = int.parse(newValue.text.replaceAll('.', ''));
    final formatter = NumberFormat('#,###');
    final newText = formatter.format(value);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
