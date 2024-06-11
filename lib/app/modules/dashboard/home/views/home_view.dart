import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:wr_project/app/modules/dashboard/view/custom_navigation_bar.dart';
import '../../controller/page_index_controller.dart';
import '../../../../utils/constant/style/app_color.dart';
import '../../../auth/login/model/login_model.dart';
import '../controllers/home_controller.dart';
import '../../../../utils/constant/style/text_styles.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  final PageIndexController pageC = Get.find<PageIndexController>();
  // late User user;

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final user = Get.arguments;

    // print(user!.name);

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: Stack(
          children: [
            Container(
              child: ClipPath(
                clipper: ClipPathClass(),
                child: Container(
                  height: 250,
                  width: Get.width,
                  color: AppColor.primary,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 33, 143, 247),
                              Color.fromARGB(255, 97, 136, 242),
                            ],
                          ),
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "081290112333",
                                    style: TextStyles
                                        .headerhomeStyle, // Use the predefined style
                                  ),
                                  Image.asset("asset/images/logo.png"),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                "name",
                                style: TextStyles
                                    .descriptionhomeStyle, // Use the predefined style
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "username",
                                    style: TextStyles
                                        .headerhomeStyle, // Use the predefined style
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      final SharedPreferences prefs =
                                          await SharedPreferences.getInstance();

                                      // Mendapatkan nilai token dari SharedPreferences
                                      String? token = prefs.getString('token');

                                      print(token);
                                    },
                                    child: Text(
                                      "Profile",
                                      style: TextStyles
                                          .cardbuttomTextStyle, // Use the predefined style
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFF7B731),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Divider(
                                color: Colors.black,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "id",
                                style: TextStyles.cardbuttomTextStyle,
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 10,
                    color: Colors.grey[300],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child:
                                Text("Menu", style: TextStyles.fieldLabelStyle),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 4,
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Expanded(
                                  child: FutureBuilder<List<Menu>>(
                                    future: controller.retrieveStoredData(
                                        MediaQuery.of(context)
                                                .size
                                                .shortestSide <
                                            600),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Center(
                                          child:
                                              Text('Error: ${snapshot.error}'),
                                        );
                                      } else {
                                        final List<Menu> menuList =
                                            snapshot.data ?? [];
                                        return GridView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            mainAxisSpacing: 4,
                                            crossAxisSpacing: 4,
                                            childAspectRatio: 1,
                                          ),
                                          itemCount: menuList.length,
                                          itemBuilder: (context, index) {
                                            final Menu menu = menuList[index];
                                            if ((menu.isMobile &&
                                                    MediaQuery.of(context)
                                                            .size
                                                            .shortestSide <
                                                        600) ||
                                                (!menu.isMobile &&
                                                    MediaQuery.of(context)
                                                            .size
                                                            .shortestSide >=
                                                        600)) {
                                              return InkWell(
                                                onTap: () {
                                                  String routeName =
                                                      '/${menu.name.toLowerCase()}';
                                                  Get.toNamed(routeName,
                                                      arguments: menu);
                                                },
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      menu.icon,
                                                      width: 80,
                                                      height: 70,
                                                    ),
                                                    Text(menu.name,
                                                        style: TextStyles
                                                            .menuTextStyle),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              return SizedBox();
                                            }
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pembayaran Terbaru",
                                  style: TextStyles
                                      .fieldLabelStyle, // Use the predefined style
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text("Lihat Semua",
                                      style: TextStyles.buttonTextStyle),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    width: Get.width * 0.8,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "asset/images/obito.jpeg",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    width: Get.width * 0.8,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "asset/images/obito.jpeg",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    width: Get.width * 0.8,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "asset/images/obito.jpeg",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipInfoClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 80, size.height);
    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
