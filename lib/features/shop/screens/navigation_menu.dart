import 'package:ecommerce_app/features/shop/screens/store/store.dart';
import 'package:ecommerce_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../personalization/screens/settings/settings.dart';
import 'home/home_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationBarController=Get.put(NavigationMenuController());
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return  Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80.h,
          elevation: 0,
          selectedIndex: navigationBarController.selectedIndex.value,
          onDestinationSelected: (index){navigationBarController.selectedIndex.value=index;},
              backgroundColor: isDarkMode? CustomColors.black : CustomColors.white,
              indicatorColor: isDarkMode? CustomColors.white.withOpacity(0.1) : CustomColors.black.withOpacity(0.1),
              destinations: const[
          NavigationDestination(icon: Icon(Iconsax.home), label: CustomTexts.home),
          NavigationDestination(icon: Icon(Iconsax.shop), label: CustomTexts.store),
          NavigationDestination(icon: Icon(Iconsax.heart), label: CustomTexts.wishList),
          NavigationDestination(icon: Icon(Iconsax.user), label: CustomTexts.profile),

        ],

        ),
      ),
      body: Obx(()=> navigationBarController.screens[navigationBarController.selectedIndex.value]),

    );
  }
}
class NavigationMenuController extends GetxController
{
  final Rx<int>selectedIndex=0.obs;
  final  screens=[
    const HomeScreen(),
    const StoreScreen(),
    const WishlistScreen(),
    const SettingsScreen(),


  ];
}
