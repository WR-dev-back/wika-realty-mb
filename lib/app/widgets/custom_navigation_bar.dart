import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/controller/page_index_controller.dart';
import 'package:wr_project/app/style/app_color.dart';

class CustomBottomNavigationBar extends GetView<PageIndexController> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Stack(
        alignment: const FractionalOffset(.5, 1.0),
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColor.secondary, width: 1),
                ),
              ),
              child: BottomAppBar(
                elevation: 2,
                shape: const CircularNotchedRectangle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () => controller.changePage(0),
                        child: SizedBox(
                          height: 65,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 25,
                                margin: const EdgeInsets.only(bottom: 4),
                                child: (controller.pageIndex.value == 0)
                                    ? SvgPicture.asset(
                                        'asset/icons/home-active.svg')
                                    : SvgPicture.asset('asset/icons/home.svg'),
                              ),
                              Container(
                                child: (controller.pageIndex.value == 0)
                                    ? Text(
                                        "Home",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: AppColor.primary,
                                        ),
                                      )
                                    : Text(
                                        "Home",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => controller.changePage(2),
                        child: SizedBox(
                          height: 65,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 25,
                                margin: const EdgeInsets.only(bottom: 4),
                                child: (controller.pageIndex.value == 2)
                                    ? SvgPicture.asset(
                                        'asset/icons/profile-1.svg')
                                    : SvgPicture.asset(
                                        'asset/icons/people.svg'),
                              ),
                              Container(
                                child: (controller.pageIndex.value == 2)
                                    ? Text(
                                        "Profile",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: AppColor.primary,
                                        ),
                                      )
                                    : Text(
                                        "Profile",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
