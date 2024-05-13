import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/style/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

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
          buildLoginForm(),
          buildBottomImageContainer(),
        ],
      ),
    );
  }

  Widget buildLoginForm() {
    return Container(
      key: Key('loginContentContainer'),
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
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
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        'Masuk Akun',
        style: GoogleFonts.plusJakartaSans(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildDescriptionText() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        'Lengkapi data dibawah untuk masuk ke akunmu yang sudah terdaftar di We Stay.',
        style: GoogleFonts.plusJakartaSans(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return Container(
      key: Key('emailContainer'),
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        style: GoogleFonts.plusJakartaSans(fontSize: 14),
        maxLines: 1,
        controller: controller.emailC,
        decoration: InputDecoration(
          label: Text("Email"),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(),
          hintText: "youremail@email.com",
        ),
      ),
    );
  }

  Widget buildPasswordField() {
    return Material(
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: TextField(
          style: GoogleFonts.plusJakartaSans(fontSize: 14),
          maxLines: 1,
          controller: controller.passC,
          obscureText: controller.obsecureText.value,
          decoration: InputDecoration(
            label: Text("Password"),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            border: OutlineInputBorder(),
            hintText: "*************",
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
      () => SizedBox(
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
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomImageContainer() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        'asset/images/background.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
