import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wr_project/app/utils/constant/style/text_styles.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

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
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
        'Lengkapi data dibawah untuk masuk ke akunmu yang sudah terdaftar di We Stay.',
        style: TextStyles.descriptionStyle,
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
            style: TextStyles.fieldLabelStyle,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(),
          hintText: "Masukkan Email Anda",
        ),
        validator: controller.validateEmail,
      ),
    );
  }

  Widget buildPasswordField() {
    return Material(
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Obx(
          () => TextFormField(
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
            ),
            maxLines: 1,
            controller: controller.passC,
            obscureText: controller.obsecureText.value,
            decoration: InputDecoration(
              label: Text(
                "Password",
                style: TextStyles.headStyle,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(),
              hintText: "Masukkan Password",
              suffixIcon: IconButton(
                icon: (controller.obsecureText.value)
                    ? SvgPicture.asset('asset/icons/show.svg')
                    : SvgPicture.asset('asset/icons/hide.svg'),
                onPressed: () {
                  controller.obsecureText.value =
                      !(controller.obsecureText.value);
                },
              ),
            ),
            validator: controller.validatePassword,
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
                    if (_formKey.currentState!.validate()) {
                      await controller.login();
                    }
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
              style: TextStyles.buttonauthTextStyle.copyWith(
                color:
                    controller.isFormValid.value ? Colors.white : Colors.black,
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
