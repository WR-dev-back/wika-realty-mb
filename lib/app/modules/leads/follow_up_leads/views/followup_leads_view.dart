import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../utils/constant/style/text_styles.dart';
import '../../../../utils/constant/style/app_color.dart'; // Assuming you have an AppColor class
import '../controllers/followup_leads_controller.dart';

class FollowupLeadsView extends GetView<FollowupLeadsController> {
  const FollowupLeadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leads = Get.arguments as dynamic;

    // Initialize character counters with existing text length
    controller.followUpCount.value = controller.followUpController.text.length;
    controller.prospectsCount.value =
        controller.prospectsController.text.length;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.primary,
          leading: const BackButton(
            color: Colors.white,
          ), // Align with app's theme
          title: Text(
            'Follow Up',
            style: TextStyles.titleLabelStyle.copyWith(
              color: Colors.white, // Use white text for contrast
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            controller: controller.tabController,
            indicatorColor: Colors.white, // Tab indicator color for consistency
            tabs: [
              Obx(
                () => FollowUpTab(
                  text: 'Follow Up 1',
                  completed: controller.followUp1Completed.value,
                ),
              ),
              Obx(
                () => FollowUpTab(
                  text: 'Follow Up 2',
                  completed: controller.followUp2Completed.value,
                ),
              ),
              Obx(
                () => FollowUpTab(
                  text: 'Follow Up 3',
                  completed: controller.followUp3Completed.value,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0), // Adjust padding for consistency
          child: TabBarView(
            controller: controller.tabController,
            children: [
              buildFollowUpTab(controller, leads, 1),
              Obx(
                () => controller.isNextFollowUpTypeEnabled(2)
                    ? buildFollowUpTab(controller, leads, 2)
                    : Center(child: Text('Complete Follow Up 1 first')),
              ),
              Obx(
                () => controller.isNextFollowUpTypeEnabled(3)
                    ? buildFollowUpTab(controller, leads, 3)
                    : Center(child: Text('Complete Follow Up 2 first')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFollowUpTab(
      FollowupLeadsController controller, dynamic leads, int followUpNumber) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            "Nama",
            style: TextStyles.descriptionStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '${leads?.fullName ?? 'N/A'}',
            style: TextStyles.headStyle,
          ),
          const SizedBox(height: 15),
          Obx(
            () => TextFormField(
              readOnly: true,
              controller: controller.dateController,
              decoration: InputDecoration(
                label: Text(
                  "Tanggal",
                  style: TextStyles.descriptionStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: controller.hintText.value,
                hintStyle: TextStyles.approvalTextStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded borders
                  borderSide: BorderSide(
                    color: Colors.grey.shade400, // Border color consistency
                  ),
                ),
              ),
              onTap: () => controller.showFollowUpDialog(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Date is required';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          _buildTextFieldWithCounter(
            controller.followUpController,
            'Follow Up',
            241,
            controller.followUpCount,
          ),
          const SizedBox(height: 20),
          _buildTextFieldWithCounter(
            controller.prospectsController,
            'Prospects',
            241,
            controller.prospectsCount,
          ),
          const SizedBox(height: 20),
          Obx(
            () => DropdownButtonFormField(
              value: controller.selectedFollowUpOption.value.isEmpty
                  ? null
                  : controller.selectedFollowUpOption.value,
              items: controller.followUpOptions.map((option) {
                return DropdownMenuItem(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (value) {
                controller.selectedFollowUpOption.value = value as String;
                controller.validateForm();
              },
              decoration: InputDecoration(
                label: Text(
                  "Status Leads",
                  style: TextStyles.descriptionStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: 300,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: controller.isFormValid.value
                          ? () {
                              controller.updateFollowUp(leads?.id ?? '');
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.isFormValid.value
                            ? AppColor.primary
                            : Colors.grey,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyles.btnLabelStyle
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    if (controller.showFillFormButton.value)
                      ElevatedButton(
                        onPressed: () {
                          // Handle "Fill Form" action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Fill Form',
                          style: TextStyles.btnLabelStyle
                              .copyWith(color: Colors.white),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldWithCounter(TextEditingController controller,
      String labelText, int maxLength, RxInt counter,
      {TextInputType keyboardType = TextInputType.text,
      List<TextInputFormatter>? inputFormatters}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          style: TextStyles.descriptionStyle,
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: [
            ...?inputFormatters,
            LengthLimitingTextInputFormatter(maxLength),
          ],
          decoration: InputDecoration(
            label: Text(
              labelText,
              style: TextStyles.descriptionStyle
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), // Rounded input fields
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
          ),
          onChanged: (value) {
            // update character count in controller
            this.controller.updateCount(counter, value);
          },
        ),
        const SizedBox(height: 5),
        Obx(
          () => Text(
            '${counter.value}/$maxLength',
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class FollowUpTab extends StatelessWidget {
  final String text;
  final bool completed;

  const FollowUpTab({
    Key? key,
    required this.text,
    required this.completed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: text,
      icon: Icon(
        Icons.check_circle,
        color: completed ? Colors.green : Colors.grey,
      ),
    );
  }
}
