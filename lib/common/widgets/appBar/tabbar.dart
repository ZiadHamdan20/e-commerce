import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/device/custom_device_utils.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key, required this.tabs});

  final List<Widget>tabs;

  @override
  Widget build(BuildContext context) {
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return Material(
      color: isDarkMode?CustomColors.black:CustomColors.white,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        tabs: tabs,
        isScrollable: true,
        indicatorColor: CustomColors.primary,
        labelColor: isDarkMode?CustomColors.white:CustomColors.primary,
        unselectedLabelColor:CustomColors.darkGrey ,



      ),

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(CustomDeviceUtils.getAppBarHeight());
}
