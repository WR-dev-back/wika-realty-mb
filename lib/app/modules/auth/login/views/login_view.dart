import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColor.primary, AppColor.primary.withOpacity(0.8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Text(
                  'SiOlife',
                  style: TextStyles.headerStyle
                      .copyWith(color: Colors.white, fontSize: 36),
                ),
              ),
            ),
          ),
          Positioned(
            top: 180,
            left: 20,
            right: 20,
            bottom: 20,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Masuk Akun',
                      style: TextStyles.headerStyle,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Lengkapi data di bawah untuk masuk ke akunmu yang sudah terdaftar di Olif Mobile.',
                      style: TextStyles.descriptionStyle,
                    ),
                    SizedBox(height: 30),
                    buildLoginForm(),
                    SizedBox(height: 20),
                    buildBottomImageContainer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildEmailField(),
        SizedBox(height: 16),
        buildPasswordField(),
        SizedBox(height: 16),
        buildForgotPasswordButton(),
        SizedBox(height: 24),
        buildLoginButton(),
      ],
    );
  }

  Widget buildEmailField() {
    return Obx(() {
      return TextFormField(
        style: TextStyles.descriptionStyle,
        maxLines: 1,
        controller: controller.emailC,
        focusNode: controller.emailFocusNode,
        decoration: InputDecoration(
          labelText: "Email",
          labelStyle: TextStyles.fieldLabelStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: "Masukkan Email Anda",
          errorText: controller.emailError.value.isEmpty
              ? null
              : controller.emailError.value,
        ),
      );
    });
  }

  Widget buildPasswordField() {
    return Obx(() {
      return TextField(
        style: TextStyles.descriptionStyle,
        maxLines: 1,
        controller: controller.passC,
        focusNode: controller.passwordFocusNode,
        obscureText: controller.obsecureText.value,
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle: TextStyles.fieldLabelStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: "Masukkan Password",
          errorText: controller.passwordError.value.isEmpty
              ? null
              : controller.passwordError.value,
          suffixIcon: IconButton(
            icon: SvgPicture.asset(
              controller.obsecureText.value
                  ? 'asset/icons/show.svg'
                  : 'asset/icons/hide.svg',
              // ignore: deprecated_member_use
              color: AppColor.primary,
            ),
            onPressed: () {
              controller.obsecureText.value = !controller.obsecureText.value;
            },
          ),
        ),
      );
    });
  }

  Widget buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(foregroundColor: AppColor.primary),
        child: Text("Lupa password?", style: TextStyles.descriptionStyle),
      ),
    );
  }

  Widget buildLoginButton() {
    return Obx(
      () => ElevatedButton(
        onPressed: controller.isFormValid.value
            ? () async {
                await controller.login();
              }
            : null,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          backgroundColor:
              controller.isFormValid.value ? AppColor.primary : Colors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          controller.isLoading.isFalse ? 'Log in' : 'Loading...',
          style: TextStyles.buttonTextStyle.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildBottomImageContainer() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Image.asset(
        'asset/images/background.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
