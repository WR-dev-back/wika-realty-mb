import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';
import 'package:wr_project/app/utils/constant/style/text_styles.dart';

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
        style: TextStyles.headerStyle,
      ),
    );
  }

  Widget buildDescriptionText() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Text(
        'Lengkapi data dibawah untuk masuk ke akunmu yang sudah terdaftar di Olife Mobile.',
        style: TextStyles.descriptionStyle,
      ),
    );
  }

  Widget buildEmailField() {
    return Container(
      key: Key('emailContainer'),
      margin: EdgeInsets.only(bottom: 20),
      child: Obx(() {
        return TextFormField(
          style: TextStyles.descriptionStyle,
          maxLines: 1,
          controller: controller.emailC,
          focusNode: controller.emailFocusNode,
          decoration: InputDecoration(
            label: Text(
              "Email",
              style: TextStyles.fieldLabelStyle,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(),
            hintText: "Masukkan Email Anda",
            errorText: controller.emailError.value.isEmpty
                ? null
                : controller.emailError.value,
          ),
        );
      }),
    );
  }

  Widget buildPasswordField() {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Obx(() {
        return TextField(
          style: TextStyles.descriptionStyle,
          maxLines: 1,
          controller: controller.passC,
          focusNode: controller.passwordFocusNode,
          obscureText: controller.obsecureText.value,
          decoration: InputDecoration(
            label: Text(
              "Password",
              style: TextStyles.fieldLabelStyle,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(),
            hintText: "Masukkan Password",
            errorText: controller.passwordError.value.isEmpty
                ? null
                : controller.passwordError.value,
            suffixIcon: IconButton(
              icon: (controller.obsecureText.value)
                  ? SvgPicture.asset('asset/icons/show.svg')
                  : SvgPicture.asset('asset/icons/hide.svg'),
              onPressed: () {
                controller.obsecureText.value = !controller.obsecureText.value;
              },
            ),
          ),
        );
      }),
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
              style: TextStyles.buttonTextStyle.copyWith(
                color:
                    controller.isFormValid.value ? Colors.white : Colors.blue,
              ),
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
