import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../customShapes/rounded_container.dart';

class CustomCouponCode extends StatelessWidget {
  const CustomCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final bool isDarkMode=CustomHelpers.isDarkMode(context);

    return CustomRoundedContainer(showBorder: true,
      backgroundColor: isDarkMode?CustomColors.dark:CustomColors.white,
      padding: EdgeInsets.only(top: CustomSizes.sm.h,bottom: CustomSizes.sm.h,right: CustomSizes.sm.w,left: CustomSizes.md.w),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Have a promo code? Enter here",
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),


          //button
          SizedBox(width:80.w,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: isDarkMode?CustomColors.white.withOpacity(0.5):CustomColors.dark.withOpacity(0.5),
                    backgroundColor: CustomColors.grey.withOpacity(0.2),
                    side: BorderSide(color: CustomColors.grey.withOpacity(0.1)),

                  ),
                  onPressed: (){},
                  child: const Text("Apply")))



        ],
      ),);
  }
}
