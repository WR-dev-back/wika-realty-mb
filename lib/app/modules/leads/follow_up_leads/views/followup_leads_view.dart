import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../utils/constant/style/text_styles.dart';
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
          title: Text('Follow Up'),
          bottom: TabBar(
            controller: controller.tabController,
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
          padding: const EdgeInsets.all(20.0),
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
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama",
                style: TextStyles.approvalTextStyle,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${leads?.fullName}',
                style: TextStyles.headStyle,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => TextFormField(
              readOnly: true,
              controller: controller.dateController,
              decoration: InputDecoration(
                label: Text(
                  "Tanggal",
                  style: TextStyles.approvalTextStyle,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: controller.hintText.value,
                hintStyle: TextStyles.approvalTextStyle,
              ),
              onTap: () => controller.showFollowUpDialog(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Date is required';
                }
                // Additional validation if needed
                return null;
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildTextFieldWithCounter(
            controller.followUpController,
            'Follow Up',
            241,
            controller.followUpCount,
          ),
          SizedBox(
            height: 20,
          ),
          _buildTextFieldWithCounter(
            controller.prospectsController,
            'Prospects',
            241,
            controller.prospectsCount,
          ),
          SizedBox(
            height: 20,
          ),
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
                  style: TextStyles.approvalTextStyle,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "",
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              width: 150,
              child: Obx(
                () => ElevatedButton(
                  onPressed: controller.isFormValid.value
                      ? () {
                          controller.updateFollowUp(
                            leads?.id ?? '', // Ensure leads.id is not null
                          );
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (controller.isFormValid.value) {
                          return Colors.blue; // Color when the form is valid
                        }
                        return Colors.grey; // Color when the form is not valid
                      },
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (controller.isFormValid.value) {
                          return Colors
                              .white; // Text color when the form is valid
                        }
                        return Colors
                            .black; // Text color when the form is not valid
                      },
                    ),
                  ),
                  child: Text('Save'),
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
          style: TextStyles.headStyle,
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: [
            ...?inputFormatters,
            LengthLimitingTextInputFormatter(maxLength),
          ],
          decoration: InputDecoration(
            label: Text(
              labelText,
              style: TextStyles.approvalTextStyle,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: "",
          ),
          onChanged: (value) {
            // update character count in controller
            this.controller.updateCount(counter, value);
          },
        ),
        SizedBox(height: 5),
        Obx(
          () => Text(
            '${counter.value}/$maxLength',
            style: TextStyle(color: Colors.grey, fontSize: 12),
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
