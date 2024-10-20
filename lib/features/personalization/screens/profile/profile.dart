import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/images/circular_Image.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;

    return  Scaffold(
      appBar: CustomAppBar(
        title: Text(CustomTexts.profile,style: Theme.of(context).textTheme.headlineMedium,),
      showBackArrow: true,),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.sm),
          child: Column(
            children: [
              //Profile picture
              SizedBox(
                width: double.infinity.w,
                child: Column(
                  children: [
                    // profile pic
                    CircularImage(image: CustomImageStrings.user,width: 80.w,height: 80.h,),
                    TextButton(onPressed: (){}, child: const Text(CustomTexts.changeProfilePicture,))

                  ],
                ),
              ),

              //Details
              SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),
              const Divider(),
              SizedBox(height: CustomSizes.spaceBetweenItems.h,),
              const SectionHeading(headTitle: CustomTexts.profileInformation,showActionBtn: false,),

              SizedBox(height: CustomSizes.spaceBetweenItems.h,),

              ProfileMenu(onPressed: () { Get.offNamed(PagesNames.changeNameScreen); }, title: CustomTexts.name, value: controller.user.value.fullName,),
              ProfileMenu(onPressed: () {  }, title: CustomTexts.userName, value: controller.user.value.username,),

              SizedBox(height: CustomSizes.spaceBetweenItems.h,),
              const Divider(),
              SizedBox(height: CustomSizes.spaceBetweenItems.h,),

              const SectionHeading(headTitle: CustomTexts.personalInformation,showActionBtn: false,),

              SizedBox(height: CustomSizes.spaceBetweenItems.h,),

              ProfileMenu(onPressed: () {  }, title: CustomTexts.userId, icon:Iconsax.copy,value: controller.user.value.id,),
              ProfileMenu(onPressed: () {  }, title: CustomTexts.email, value: controller.user.value.email,),
              ProfileMenu(onPressed: () {  }, title: CustomTexts.phoneNumber, value: controller.user.value.phoneNumber,),
              ProfileMenu(onPressed: () {  }, title: CustomTexts.gender, value: 'Male',),
              ProfileMenu(onPressed: () {  }, title: CustomTexts.dateOfBirth, value: '25 jul, 1999',),
              const Divider(),


              SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

              Center(
                child:
                TextButton(
                  onPressed: ()=>controller.deleteAccountWarningPopup(),
                  child: const Text(CustomTexts.closeAccount,style: TextStyle(color: Colors.red),),
                ),
              )

            ],
          )

        ),
      ),
    );
  }
}
