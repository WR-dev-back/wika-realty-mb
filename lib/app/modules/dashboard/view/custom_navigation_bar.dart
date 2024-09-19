import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wr_project/app/modules/dashboard/controller/page_index_controller.dart';
import '../../../utils/constant/style/text_styles.dart';
import '../../../utils/constant/style/app_color.dart';

class CustomBottomNavigationBar extends GetView<PageIndexController> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 5,
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildBottomNavigationButton(
            0,
            controller.pageIndex.value == 0
                ? SvgPicture.asset('asset/icons/home-active.svg',
                    color: AppColor.primary)
                : SvgPicture.asset('asset/icons/home.svg'),
            TextStyles.menuTextStyle,
            'Home',
            TextStyles.menuTextStyle,
          ),
          _buildBottomNavigationButton(
            1,
            controller.pageIndex.value == 1
                ? SvgPicture.asset('asset/icons/profile-1.svg',
                    color: AppColor.primary)
                : SvgPicture.asset('asset/icons/people.svg'),
            TextStyles.menuTextStyle,
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
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 28,
                margin: const EdgeInsets.only(bottom: 4),
                child: icon,
              ),
              Text(
                label,
                style: controller.pageIndex.value == pageIndex
                    ? activeTextStyle.copyWith(color: AppColor.primary)
                    : inactiveTextStyle.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
