import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wr_project/app/modules/dashboard/view/custom_navigation_bar.dart';
import '../../dashboard/controller/page_index_controller.dart';
import '../../../utils/constant/style/app_color.dart';
import '../controllers/profile_controller.dart';
import '../../../utils/constant/style/text_styles.dart';

class ProfileView extends GetView<ProfileController> {
  final pageC = Get.find<PageIndexController>();

  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Stack(
        children: [
          // Background color
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
          ),
          // Header section
          Container(
            color: AppColor.primary,
            height: 200,
            width: MediaQuery.of(context).size.width,
          ),
          // Main content
          ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              _buildHeader(context),
              _buildProfileSection(context),
              const SizedBox(height: 10),
              _buildMenuOptions(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo(),
          _buildActionIcons(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      width: 90,
      height: 28,
      child: Text(
        "SiOlife",
        style: TextStyles.headerhomeStyle.copyWith(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }

  Widget _buildActionIcons() {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.message),
          color: Colors.white,
          tooltip: 'Messages',
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
          color: Colors.white,
          tooltip: 'Notifications',
        ),
      ],
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileInfo(),
              const SizedBox(height: 15),
              _buildDetailButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Row(
      children: [
        ClipOval(
          child: SizedBox(
            width: 56,
            height: 56,
            child: Image.asset('asset/images/Rectangle.png'),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.user.name,
                style: TextStyles.headerStyleProfile.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                controller.user.email,
                style: TextStyles.descriptionStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Divider(thickness: 1, color: Colors.grey[300]),
              const SizedBox(height: 10),
              Text(
                controller.user.position.title,
                style: TextStyles.descriptionStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: AppColor.pcolor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Lihat Detail',
          style: TextStyles.buttonprofileTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuOptions(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          MenuTile(
            title: 'Favorites',
            icon: Icon(Icons.favorite_border_outlined, color: AppColor.primary),
            onTap: () {},
          ),
          MenuTile(
            title: 'Privacy Policy',
            icon: Icon(Icons.shield_outlined, color: AppColor.primary),
            onTap: () => debugPrint('Privacy Policy tapped'),
          ),
          MenuTile(
            title: 'Log Out',
            icon: Icon(Icons.logout, color: Colors.red),
            onTap: controller.deleteToken,
            isDanger: true,
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
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isDanger = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[300]!,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isDanger
                    ? Colors.red.withOpacity(0.1)
                    : AppColor.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: icon,
            ),
            Expanded(
              child: Text(
                title,
                style: isDanger
                    ? TextStyles.dangerTextStyle.copyWith(fontSize: 16)
                    : TextStyles.generalTextStyle.copyWith(fontSize: 16),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: isDanger ? Colors.red : Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
