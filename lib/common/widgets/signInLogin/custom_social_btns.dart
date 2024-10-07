import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class CustomSocialBtns extends StatelessWidget {
  const CustomSocialBtns({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(color: CustomColors.grey)),
            child: IconButton(
              onPressed: (){},
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
