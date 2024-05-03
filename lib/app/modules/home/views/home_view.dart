import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wr_project/app/widgets/custom_navigation_bar.dart';
import 'package:wr_project/app/widgets/gridDashboard.dart';
import '../../../controller/page_index_controller.dart';
import '../../../style/app_color.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final pageC = Get.find<PageIndexController>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      extendBody: true,
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: AppColor.cblight,
            ),
            Container(
              child: Image.asset(
                'assets/images/Frame 52.png',
                fit: BoxFit.cover,
              ),
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
                padding: EdgeInsets.only(top: 150),
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Wika Realty",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(top: 220), child: GridDashboard()),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(top: 450, left: 300),
                child: TextButton(
                    onPressed: () async {
                      final SharedPreferences? prefs = await _prefs;
                      print(prefs?.get('token'));
                    },
                    child: Text('print token'))),
          ],
        ),
      ),
    );
  }
}
