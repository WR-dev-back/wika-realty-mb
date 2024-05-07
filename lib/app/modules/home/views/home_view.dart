import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wr_project/app/model/body.dart';
import 'package:wr_project/app/modules/login/controllers/login_controller.dart';

import 'package:wr_project/app/widgets/custom_navigation_bar.dart';
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
                'asset/images/Frame 52.png',
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
              padding: EdgeInsets.only(top: 180),
              child: FutureBuilder<List<Menu>>(
                future: LoginController.retrieveStoredData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    final menuList = snapshot.data ?? [];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: menuList.length,
                        itemBuilder: (context, index) {
                          final menu = menuList[index];
                          return Card(
                            child: InkWell(
                              onTap: () {
                                String routeName =
                                    '/${menu.name.toLowerCase()}';
                                Get.toNamed(routeName, arguments: menu);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Image.asset(menu.icon, width: 40),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    menu.name,
                                    style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    menu.name,
                                    style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
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
