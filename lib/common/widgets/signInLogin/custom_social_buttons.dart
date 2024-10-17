import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class CustomSocialButtons extends StatelessWidget {
  const CustomSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(LoginController());

    return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(color: CustomColors.grey)),
            child: IconButton(
              onPressed: ()=>controller.googleSignIn(),
              icon: const Image(width: CustomSizes.iconMd,
                height: CustomSizes.iconMd,
                image: AssetImage(CustomImageStrings.googleIcon),),
            ),
          ),

          const SizedBox(width: CustomSizes.spaceBetweenItems,),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(color: CustomColors.grey)),
            child: IconButton(
              onPressed: (){},
              icon: const Image(width: CustomSizes.iconMd,
                height: CustomSizes.iconMd,
                image: AssetImage(CustomImageStrings.fbIcon),),
            ),
          ),

        ],
      );

  }
}
