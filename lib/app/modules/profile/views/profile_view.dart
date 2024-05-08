import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wr_project/app/widgets/custom_navigation_bar.dart';

import '../../../controller/page_index_controller.dart';
import '../../../style/app_color.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final pageC = Get.find<PageIndexController>();
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: AppColor.cblight,
          ),
          Container(
            color: AppColor.pcolor,
            height: 200,
            width: MediaQuery.of(context).size.width,
          ),
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        width: 90,
                        height: 28,
                        child: Image.asset(
                          'asset/images/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.only(bottom: 20),
                          icon: Icon(Icons.message),
                        ),
                        IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.only(bottom: 20),
                          icon: Icon(Icons.notifications),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          left: 24, top: 24, right: 24, bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: SizedBox(
                                      width: 56,
                                      height: 56,
                                      child: Image.asset(
                                        'asset/images/Rectangle.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Costumer WeStay",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Costumer@WeStay.com",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "085608783675",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  backgroundColor: AppColor.pcolor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Lihat Detail',
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "Pengaturan Akun",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    MenuTile(
                      title: 'Akun Saya',
                      icon: Icon(Icons.account_circle),
                      onTap: () {},
                    ),
                    MenuTile(
                      title: 'Keamanan Akun',
                      icon: Icon(Icons.lock),
                      onTap: () {},
                    ),
                    MenuTile(
                      title: 'Bahasa',
                      icon: Icon(Icons.lock_open_outlined),
                      onTap: () {},
                    ),
                    MenuTile(
                        title: 'Log Out',
                        icon: Icon(Icons.account_circle),
                        isDanger: true,
                        onTap: controller.deleteToken),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final void Function() onTap;
  final bool isDanger;
  const MenuTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              margin: const EdgeInsets.only(right: 24),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: icon,
            ),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                  color: (isDanger == false) ? AppColor.txt : AppColor.error,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24),
              child: SvgPicture.asset(
                'asset/icons/arrow-right.svg',
                color: (isDanger == false) ? AppColor.txt : AppColor.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
