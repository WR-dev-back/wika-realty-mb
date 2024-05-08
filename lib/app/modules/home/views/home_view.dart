import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wr_project/app/model/body.dart';
import 'package:wr_project/app/modules/login/controllers/login_controller.dart';
import 'package:wr_project/app/style/app_color.dart';

import 'package:wr_project/app/widgets/custom_navigation_bar.dart';
import '../../../controller/page_index_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final pageC = Get.find<PageIndexController>();

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
            ClipRRect(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: Image.asset(
                  'asset/images/Frame 52.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 90, left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Wika Realty",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 155, left: 25),
              child: Text(
                "Menu",
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 155),
              child: RefreshIndicator(
                onRefresh: controller.refreshData,
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
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 1.0,
                          ),
                          itemCount: menuList.length,
                          itemBuilder: (context, index) {
                            final menu = menuList[index];
                            return Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    String routeName =
                                        '/${menu.name.toLowerCase()}';
                                    Get.toNamed(routeName, arguments: menu);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(top: 10),
                                        child:
                                            Image.asset(menu.icon, width: 60),
                                      ),
                                      SizedBox(height: 5),
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
                                    ],
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
