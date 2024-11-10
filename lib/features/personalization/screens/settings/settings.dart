import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/appBar/primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/listTiles/settings_menu_tile.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/routs/pages_names.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/listTiles/user_profile_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header

            PrimaryHeaderContainer(
                child: Column(
              children: [
                CustomAppBar(title: Text(CustomTexts.account,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color:CustomColors.white ),),),

                //user profile card
                 UserProfileTile(onPressed: (){
                  Navigator.of(context).pushNamed(PagesNames.profileScreen);
                },),
                SizedBox(height: CustomSizes.spaceBetweenSections.h,),




              ],
            )
            ),
            
            Padding(
                padding: const EdgeInsets.all(CustomSizes.defaultSpace),

              child: Column(
                children: [
                  const CustomSectionHeading(headTitle: CustomTexts.accountSettings,showActionBtn: false,),
                  SizedBox(height: CustomSizes.spaceBetweenItems.h,),

                   SettingsMenuTile(
                    onTap: (){Navigator.of(context).pushNamed(PagesNames.userAddressScreen);},
                    icon: Iconsax.safe_home,
                    title: "My Addresses",
                    subTitle: "Set shopping delivery address",
                    ),

                   SettingsMenuTile(
                    onTap:(){Navigator.of(context).pushNamed(PagesNames.cartScreen);},
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    subTitle: "Add,remove products and move to checkout",
                  ),


                   SettingsMenuTile(
                    onTap:(){Navigator.of(context).pushNamed(PagesNames.orderScreen);},
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subTitle: "In-progress and Completed Orders",
                  ),

                  const SettingsMenuTile(
                    icon: Iconsax.bank,
                    title: "Bank Account",
                    subTitle: "Withdraw balance to registered bank account",
                  ),

                  const SettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Coupons",
                    subTitle: "List of all the discounted coupons",
                  ),

                  const SettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "Notifications",
                    subTitle: "Set any kind of notification message",
                  ),


                  const SettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: "Account Privacy",
                    subTitle: "Manage data usage and connected accounts",
                  ),

                  //App settings
                  SizedBox(height: CustomSizes.spaceBetweenSections.h,),
                  const CustomSectionHeading(headTitle: "App Settings",showActionBtn: false,),
                  SizedBox(height: CustomSizes.spaceBetweenItems.h,),


                   SettingsMenuTile(
                    onTap: (){Get.toNamed(PagesNames.loadDataScreen);},
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subTitle: "Upload Data to your Cloud Firebase",
                  ),


                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: "Geolocation",
                    subTitle: "Set recommendation based on location",
                    trailing: Switch(value: true,onChanged: (value){},),
                  ),

                  SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe Mode",
                    subTitle: "Search results is safe for all ages",
                    trailing: Switch(value: false,onChanged: (value){},),
                  ),

                  SettingsMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality",
                    subTitle: "Set image quality tob be seen",
                    trailing: Switch(value: true,onChanged: (value){},),
                  ),


                  //Logout button
                  SizedBox(height: CustomSizes.spaceBetweenSections.h,),
                  SizedBox(
                    width: double.infinity.w,
                    child: OutlinedButton(onPressed: () async{await AuthenticationRepository.instance.logout();},child: const Text(CustomTexts.logout),),

                  ),
                  SizedBox(height: CustomSizes.spaceBetweenSections.h*2.5,)



                ],
              ),
            ),

            //list of settings
          ],
        ),
      ),
    );
  }
}

