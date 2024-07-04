import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';
import 'package:wr_project/app/utils/constant/style/text_styles.dart';
import '../controllers/edit_detail_leads_controller.dart';

class EditDetailLeadsView extends GetView<EditDetailLeadsController> {
  EditDetailLeadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leads = Get.arguments;
    controller.fullNameController.text = leads.fullName;
    controller.emailController.text = leads.email;
    controller.phoneNumController.text = leads.phoneNumber;
    controller.sumDController.text = leads.digitalSource ?? '';
    controller.sumOfController.text = leads.offlineSource ?? '';
    controller.lokController.text = leads.locationOffline ?? '';
    controller.npwpController.text = leads.npwp;
    controller.cityController.text = leads.city ?? '';
    controller.typeController.text = leads.type ?? '';
    controller.areaController.text = leads.area.toString();
    controller.omzetController.text = leads.omzet ?? '';

    controller.setOriginalValues(leads.npwp, leads.email, leads.phoneNumber);

    // Update counters based on the initial text in the controllers
    controller.updateCount(
        controller.fullNameCount, controller.fullNameController.text);
    controller.updateCount(
        controller.emailCount, controller.emailController.text);
    controller.updateCount(
        controller.phoneCount, controller.phoneNumController.text);
    controller.updateCount(
        controller.digitalSourceCount, controller.sumDController.text);
    controller.updateCount(
        controller.offlineSourceCount, controller.sumOfController.text);
    controller.updateCount(
        controller.locationCount, controller.lokController.text);
    controller.updateCount(
        controller.npwpCount, controller.npwpController.text);
    controller.updateCount(
        controller.cityCount, controller.cityController.text);
    controller.updateCount(
        controller.typeCount, controller.typeController.text);
    controller.updateCount(
        controller.areaCount, controller.areaController.text);
    controller.updateCount(
        controller.omzetCount, controller.omzetController.text);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: AppColor.primary,
        title: Text(
          "Edit Leads",
          style: TextStyles.titleLabelStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildTextFieldWithCounter(
              controller.fullNameController,
              'Nama Panjang',
              30,
              controller.fullNameCount,
            ),
            SizedBox(height: 20),
            _buildTextFieldWithCounter(
              controller.emailController,
              'Email',
              241,
              controller.emailCount,
            ),
            SizedBox(height: 20),
            _buildTextFieldWithCounter(
              controller.phoneNumController,
              'Nomor Telepon',
              30,
              controller.phoneCount,
            ),
            SizedBox(height: 20),
            _buildTextFieldWithCounter(
              controller.sumDController,
              'Sumber Digital',
              30,
              controller.digitalSourceCount,
            ),
            SizedBox(height: 20),
            _buildTextFieldWithCounter(
              controller.sumOfController,
              'Sumber Offline',
              30,
              controller.offlineSourceCount,
            ),
            SizedBox(height: 20),
            _buildTextFieldWithCounter(
              controller.lokController,
              'Lokasi',
              30,
              controller.locationCount,
            ),
            SizedBox(height: 20),
            _buildTextFieldWithCounter(
              controller.npwpController,
              'Npwp',
              60,
              controller.npwpCount,
            ),
            SizedBox(height: 20),
            _buildTextFieldWithCounter(
              controller.cityController,
              'Kota',
              10,
              controller.cityCount,
            ),
            SizedBox(height: 20),
            _buildTextFieldWithCounter(
              controller.typeController,
              'Type',
              10,
              controller.typeCount,
            ),
            SizedBox(height: 20),
            _buildTextFieldWithCounter(
              controller.areaController,
              'Area',
              15,
              controller.areaCount,
            ),
            SizedBox(height: 20),
            _buildTextFieldWithCounter(
              controller.omzetController,
              'Omzet',
              15,
              controller.omzetCount,
            ),
            // Add input fields for other lead properties
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 140,
                child: ElevatedButton(
                  onPressed: () {
                    controller.updateLeadsData(leads.id, leads);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4B70F5),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyles.btnLabelStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithCounter(TextEditingController controller,
      String labelText, int maxLength, RxInt counter,
      {TextInputType keyboardType = TextInputType.text,
      List<TextInputFormatter>? inputFormatters,
      String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: TextStyles.buttonprofileTextStyle,
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
          validator: validator,
          onChanged: (value) {
            // update character count in controller
            this.controller.updateCount(counter, value);
          },
        ),
        SizedBox(height: 5),
        Obx(() => Text(
              '${counter.value}/$maxLength',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            )),
      ],
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String newText =
        newValue.text.startsWith('+') ? newValue.text : '+${newValue.text}';
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
