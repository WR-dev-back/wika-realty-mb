import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wr_project/app/model/body.dart';
import 'package:wr_project/app/modules/login/controllers/login_controller.dart';
import 'package:wr_project/app/style/app_color.dart';
import 'package:wr_project/app/widgets/custom_navigation_bar.dart';
import '../../../controller/page_index_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final PageIndexController pageC = Get.find<PageIndexController>();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      extendBody: true,
      body: Stack(
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
          Positioned(
            top: 90,
            left: 20,
            child: Text(
              "Wika Realty",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Positioned(
            top: 155,
            left: 25,
            child: Text(
              "Menu",
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 155),
            child: Container(
              child: RefreshIndicator(
                onRefresh: controller.refreshData,
                child: FutureBuilder<List<Menu>>(
                  future: LoginController.retrieveStoredData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final List<Menu> menuList = snapshot.data ?? [];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 1.0,
                          ),
                          itemCount: menuList.length,
                          itemBuilder: (context, index) {
                            final Menu menu = menuList[index];
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
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child:
                                            Image.asset(menu.icon, width: 40),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        menu.name,
                                        style: GoogleFonts.plusJakartaSans(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
          ),
        ],
      ),
    );
  }
}
