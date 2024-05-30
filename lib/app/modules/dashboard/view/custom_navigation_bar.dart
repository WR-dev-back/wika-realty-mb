import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/modules/dashboard/controller/page_index_controller.dart';
import 'package:wr_project/app/utils/constant/style/app_color.dart';

class CustomBottomNavigationBar extends GetView<PageIndexController> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 1,
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
                      height: 35,
                      margin: const EdgeInsets.only(bottom: 4),
                      child: (controller.pageIndex.value == 0)
                          ? SvgPicture.asset('asset/icons/home-active.svg')
                          : SvgPicture.asset('asset/icons/home.svg'),
                    ),
                    Container(
                      child: (controller.pageIndex.value == 0)
                          ? Text(
                              "Home",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor.primary,
                              ),
                            )
                          : Text(
                              "Home",
                              style: TextStyle(
                                fontSize: 12,
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
                      height: 35,
                      margin: const EdgeInsets.only(bottom: 4),
                      child: (controller.pageIndex.value == 2)
                          ? SvgPicture.asset('asset/icons/profile-1.svg')
                          : SvgPicture.asset('asset/icons/people.svg'),
                    ),
                    Container(
                      child: (controller.pageIndex.value == 2)
                          ? Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor.primary,
                              ),
                            )
                          : Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 12,
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
    );
  }
}
