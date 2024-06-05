import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wr_project/app/utils/constant/style/text_styles.dart'; // Import the style definitions

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildLoginForm(),
              buildBottomImageContainer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLoginForm() {
    return Container(
      key: Key('loginContentContainer'),
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeaderText(),
          buildDescriptionText(),
          buildEmailField(),
          buildPasswordField(),
          buildForgotPasswordButton(),
          buildLoginButton(),
        ],
      ),
    );
  }

  Widget buildHeaderText() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Text(
        'Masuk Akun',
        style: TextStyles.headerStyle, // Use the predefined style
      ),
    );
  }

  Widget buildDescriptionText() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Text(
        'Lengkapi data dibawah untuk masuk ke akunmu yang sudah terdaftar di We Stay.',
        style: TextStyles.descriptionStyle, // Use the predefined style
      ),
    );
  }

  Widget buildEmailField() {
    return Container(
      key: Key('emailContainer'),
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        style: GoogleFonts.plusJakartaSans(
          fontSize: 14,
        ),
        maxLines: 1,
        controller: controller.emailC,
        decoration: InputDecoration(
          label: Text(
            "Email",
            style: TextStyles.fieldLabelStyle, // Use the predefined style
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(),
          hintText: "Masukkan Email Anda",
        ),
      ),
    );
  }

  Widget buildPasswordField() {
    return Material(
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Obx(
          () => TextField(
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
            ),
            maxLines: 1,
            controller: controller.passC,
            obscureText: controller.obsecureText.value,
            decoration: InputDecoration(
              label: Text(
                "Password",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(),
              hintText: "Masukkan Password",
              suffixIcon: IconButton(
                icon: (controller.obsecureText != false)
                    ? SvgPicture.asset('asset/icons/show.svg')
                    : SvgPicture.asset('asset/icons/hide.svg'),
                onPressed: () {
                  controller.obsecureText.value =
                      !(controller.obsecureText.value);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForgotPasswordButton() {
    return Container(
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(foregroundColor: Colors.blue),
        child: Text("Lupa password?"),
      ),
    );
  }

  Widget buildLoginButton() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: controller.isFormValid.value
                ? () async {
                    await controller.login();
                  }
                : null,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 18),
              backgroundColor:
                  controller.isFormValid.value ? AppColor.primary : Colors.grey,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              (controller.isLoading.isFalse) ? 'Log in' : 'Loading...',
              style: TextStyles.buttonTextStyle, // Use the predefined style
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomImageContainer() {
    return Container(
      padding: EdgeInsets.only(top: 40),
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        'asset/images/background.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
