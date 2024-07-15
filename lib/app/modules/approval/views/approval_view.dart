import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../common/models/approval.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constant/style/app_color.dart';
import '../../../utils/constant/style/text_styles.dart';
import '../controllers/approval_controller.dart';

class ApprovalView extends GetView<ApprovalController> {
  ApprovalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: Obx(
          () => AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: controller.isSearching.value
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: AppBar(
              leading: const BackButton(
                color: Colors.white,
              ),
              backgroundColor: AppColor.primary,
              title: Text(
                'Approval View',
                style: TextStyles.titleLabelStyle,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.isSearching.value = true;
                  },
                ),
              ],
            ),
            secondChild: AppBar(
              backgroundColor: AppColor.primary,
              title: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Approval',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
                autofocus: true,
                onChanged: (value) {
                  controller.searchApproval(value);
                },
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  controller.isSearching.value = false;
                },
              ),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
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
                          final status = approval.status ?? Status.PENDING;
                          final approvalStatus =
                              approval.property?.approvalStatus ??
                                  Status.PENDING;

                          IconData trailingIcon;
                          Color trailingIconColor;
                          Color textColor;

                          switch (approvalStatus) {
                            case Status.PENDING:
                              trailingIcon = Icons.hourglass_empty;
                              trailingIconColor = Colors.grey;
                              textColor = Colors.grey;
                              break;
                            case Status.APPROVED:
                              trailingIcon = Icons.check;
                              trailingIconColor = Colors.green;
                              textColor = Colors.green;
                              break;
                            case Status.REJECT:
                              trailingIcon = Icons.close;
                              trailingIconColor = Colors.redAccent;
                              textColor = Colors.redAccent;
                              break;
                            default:
                              trailingIcon = Icons.hourglass_empty;
                              trailingIconColor = Colors.blue;
                              textColor = Colors.grey;
                          }

                          IconData statusIcon;
                          Color statusIconColor;

                          switch (status) {
                            case Status.PENDING:
                              statusIcon = Icons.autorenew;
                              statusIconColor = Colors.grey;
                              break;
                            case Status.APPROVED:
                              statusIcon = Icons.done_all;
                              statusIconColor = Colors.green;
                              break;
                            case Status.REJECT:
                              statusIcon = Icons.error;
                              statusIconColor = Colors.red;
                              break;
                            default:
                              statusIcon = Icons.help;
                              statusIconColor = Colors.blue;
                          }

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: InkWell(
                              onTap: () => Get.toNamed(
                                Routes.DETAIL_APPROVAL,
                                parameters: {
                                  'approvalId': approval.id.toString()
                                },
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 0.7,
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              approval.name ?? '',
                                              style: TextStyles
                                                  .headerapprovalStyleProfile
                                                  .copyWith(
                                                color: textColor,
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              approval.property?.unitDesc ??
                                                  approval
                                                      .purchaseOrder?.vendor ??
                                                  approval.purchaseRequisition
                                                      ?.prType ??
                                                  '',
                                              style: TextStyles
                                                  .headerapprovalStyleProfile
                                                  .copyWith(
                                                color: textColor,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(trailingIcon,
                                                  color: trailingIconColor),
                                              SizedBox(width: 10),
                                              Icon(
                                                statusIcon,
                                                color: statusIconColor,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      // if (approvalStatus == Status.PENDING)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          // if (approval.property != null &&
                                          // approval
                                          // .property!.isNegotiation)
                                          // Container(
                                          //   width: 150,
                                          //   child: ElevatedButton(
                                          //     onPressed: () {
                                          //       showDialog(
                                          //         context: context,
                                          //         builder: (context) {
                                          //           TextEditingController
                                          //               valueController =
                                          //               TextEditingController();

                                          //           valueController
                                          //               .addListener(() {
                                          //             final text =
                                          //                 valueController
                                          //                     .text;
                                          //             valueController
                                          //                     .value =
                                          //                 valueController
                                          //                     .value
                                          //                     .copyWith(
                                          //               text: _formatNumber(
                                          //                   text),
                                          //               selection: TextSelection
                                          //                   .collapsed(
                                          //                       offset: _formatNumber(
                                          //                               text)
                                          //                           .length),
                                          //             );
                                          //           });

                                          //           return Dialog(
                                          //             shape:
                                          //                 RoundedRectangleBorder(
                                          //               borderRadius:
                                          //                   BorderRadius
                                          //                       .circular(
                                          //                           20),
                                          //             ),
                                          //             child: Container(
                                          //               width:
                                          //                   Get.width * 0.8,
                                          //               padding:
                                          //                   const EdgeInsets
                                          //                       .all(20),
                                          //               child: Column(
                                          //                 mainAxisSize:
                                          //                     MainAxisSize
                                          //                         .min,
                                          //                 children: [
                                          //                   Text(
                                          //                     'Negosiasi',
                                          //                     textAlign:
                                          //                         TextAlign
                                          //                             .center,
                                          //                     style: TextStyles
                                          //                         .headerFieldStyle
                                          //                         .copyWith(
                                          //                       color: Colors
                                          //                           .blue,
                                          //                     ),
                                          //                   ),
                                          //                   const SizedBox(
                                          //                       height: 20),
                                          //                   TextField(
                                          //                     controller: TextEditingController(
                                          //                         text: _formatNumber(approval
                                          //                                 .property
                                          //                                 ?.contractValueNetto
                                          //                                 ?.toString() ??
                                          //                             '0')),
                                          //                     enabled:
                                          //                         false,
                                          //                     decoration:
                                          //                         InputDecoration(
                                          //                       labelText:
                                          //                           'Contract Value Netto',
                                          //                       labelStyle:
                                          //                           TextStyles
                                          //                               .approvalTextStyle,
                                          //                       prefixText:
                                          //                           'Rp. ',
                                          //                     ),
                                          //                   ),
                                          //                   const SizedBox(
                                          //                       height: 20),
                                          //                   TextField(
                                          //                     controller:
                                          //                         valueController,
                                          //                     keyboardType:
                                          //                         TextInputType
                                          //                             .number,
                                          //                     decoration:
                                          //                         InputDecoration(
                                          //                       labelText:
                                          //                           'Value',
                                          //                       labelStyle:
                                          //                           TextStyles
                                          //                               .approvalTextStyle,
                                          //                       prefixText:
                                          //                           'Rp. ',
                                          //                     ),
                                          //                     inputFormatters: [
                                          //                       FilteringTextInputFormatter
                                          //                           .digitsOnly,
                                          //                       CurrencyInputFormatter(),
                                          //                     ],
                                          //                   ),
                                          //                   const SizedBox(
                                          //                       height: 20),
                                          //                   Row(
                                          //                     mainAxisAlignment:
                                          //                         MainAxisAlignment
                                          //                             .end,
                                          //                     children: [
                                          //                       TextButton(
                                          //                         onPressed:
                                          //                             () {
                                          //                           Get.back();
                                          //                         },
                                          //                         child: const Text(
                                          //                             'Back'),
                                          //                       ),
                                          //                       ElevatedButton(
                                          //                         onPressed:
                                          //                             () {
                                          //                           // Remove commas from the string before parsing
                                          //                           final text = valueController.text.replaceAll(
                                          //                               '.',
                                          //                               '');
                                          //                           int? value = int.tryParse(text.replaceAll(
                                          //                               ',',
                                          //                               ''));
                                          //                           if (value !=
                                          //                               null) {
                                          //                             controller.submitNegotiation(
                                          //                                 approval.property?.id ?? "",
                                          //                                 value);
                                          //                           } else {
                                          //                             Get.snackbar(
                                          //                                 'Error',
                                          //                                 'Invalid input value');
                                          //                           }
                                          //                           Get.back();
                                          //                         },
                                          //                         style: ElevatedButton
                                          //                             .styleFrom(
                                          //                           backgroundColor:
                                          //                               Colors.blue,
                                          //                         ),
                                          //                         child:
                                          //                             Text(
                                          //                           'Submit',
                                          //                           style: TextStyles
                                          //                               .cardbuttomTextStyle,
                                          //                         ),
                                          //                       ),
                                          //                     ],
                                          //                   )
                                          //                 ],
                                          //               ),
                                          //             ),
                                          //           );
                                          //         },
                                          //       );
                                          //     },
                                          //     style:
                                          //         ElevatedButton.styleFrom(
                                          //       backgroundColor:
                                          //           Colors.green,
                                          //     ),
                                          //     child: Row(
                                          //       mainAxisAlignment:
                                          //           MainAxisAlignment
                                          //               .center,
                                          //       children: [
                                          //         Text(
                                          //           "Negosiasi",
                                          //           style: TextStyles
                                          //               .cardbuttomTextStyle,
                                          //         ),
                                          //       ],
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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

  String _formatNumber(String number) {
    if (number.isEmpty) {
      return '';
    }
    final int value = int.parse(number.replaceAll(',', ''));
    final formatter = NumberFormat('#,###');
    return formatter.format(value);
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any existing commas before formatting
    final String input = newValue.text.replaceAll(',', '');
    final int value = int.tryParse(input) ?? 0;
    final formatter = NumberFormat('#,###');
    final newText = formatter.format(value);

    final int cursorPosition = newValue.selection.baseOffset;
    final int newCursorPosition =
        (cursorPosition <= input.length) ? cursorPosition : newText.length;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newCursorPosition),
    );
  }
}
