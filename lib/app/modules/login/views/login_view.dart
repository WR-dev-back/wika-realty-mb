import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/routes/app_pages.dart';
import 'package:wr_project/app/style/app_color.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.close),
        ),
      ),
      body: ListView(shrinkWrap: true, children: [
        Container(
          height: MediaQuery.of(context).size.height * 65 / 100,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 36, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  'Masuk Akun',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  'Lengkapi data dibawah untuk masuk ke akunmu yang sudah terdaftar di We Stay.',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                  style: const TextStyle(fontSize: 14, fontFamily: 'poppins'),
                  maxLines: 1,
                  controller: controller.emailC,
                  decoration: InputDecoration(
                    label: Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "youremail@email.com",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Material(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Obx(
                    () => TextField(
                      style:
                          const TextStyle(fontSize: 14, fontFamily: 'poppins'),
                      maxLines: 1,
                      controller: controller.passC,
                      obscureText: controller.obsecureText.value,
                      decoration: InputDecoration(
                        label: Text(
                          "Password",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: InputBorder.none,
                        hintText: "*************",
                        suffixIcon: IconButton(
                          icon: (controller.obsecureText != false)
                              ? SvgPicture.asset('assets/icons/show.svg')
                              : SvgPicture.asset('assets/icons/hide.svg'),
                          onPressed: () {
                            controller.obsecureText.value =
                                !(controller.obsecureText.value);
                          },
                        ),
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                  ),
                  child: const Text("Lupa password?"),
                ),
              ),
              Obx(
                () => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () => Get.offAllNamed(Routes.HOME),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      backgroundColor: AppColor.cblight,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      (controller.isLoading.isFalse) ? 'Log in' : 'Loading...',
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 18),
                  child: Center(
                    child: Text('atau masuk dengan'),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: AppColor.cblight,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 5),
                            child: Image.asset("assets/images/fl.png"),
                          ),
                          Text(
                            'Facebook',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: AppColor.cblight,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 5),
                            child: Image.asset("assets/images/gl.png"),
                          ),
                          Text(
                            'Google',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          child: Image.asset(
            'assets/images/background.png',
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
      ]),
    );
  }
}
