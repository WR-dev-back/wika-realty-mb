import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/modules/dashboard/controller/page_index_controller.dart';

import '../../../utils/constant/style/text_styles.dart';

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
          _buildBottomNavigationButton(
            0,
            controller.pageIndex.value == 0
                ? SvgPicture.asset('asset/icons/home-active.svg')
                : SvgPicture.asset('asset/icons/home.svg'),
            TextStyles.menuTextStyleblue,
            'Home',
            TextStyles.menuTextStyleblue,
          ),
          _buildBottomNavigationButton(
            1,
            controller.pageIndex.value == 1
                ? SvgPicture.asset('asset/icons/profile-1.svg')
                : SvgPicture.asset('asset/icons/people.svg'),
            TextStyles.menuTextStyleblue,
            'Profile',
            TextStyles.menuTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationButton(
    int pageIndex,
    Widget icon,
    TextStyle activeTextStyle,
    String label,
    TextStyle inactiveTextStyle,
  ) {
    return Expanded(
      child: InkWell(
        onTap: () => controller.changePage(pageIndex),
        child: SizedBox(
          height: 65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 35,
                margin: const EdgeInsets.only(bottom: 4),
                child: icon,
              ),
              Container(
                child: Text(
                  label,
                  style: controller.pageIndex.value == pageIndex
                      ? activeTextStyle
                      : inactiveTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
