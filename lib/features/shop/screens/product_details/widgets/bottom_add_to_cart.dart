import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomAddToCart extends StatelessWidget {
  const CustomBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
   final isDarkMode=CustomHelpers.isDarkMode(context);

    return  Container(
      padding: EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpace.w,vertical: CustomSizes.defaultSpace.h/2),
      decoration: BoxDecoration(
        color: isDarkMode?CustomColors.darkerGrey:CustomColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(CustomSizes.cardRadiusLg.r),
          topRight: Radius.circular(CustomSizes.cardRadiusLg.r),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircularIcon(icon: Iconsax.minus,width: 40.w,height: 40.h,iconColor: Colors.white,backgroundColor: CustomColors.darkGrey,),
            SizedBox(width: CustomSizes.spaceBetweenItems.w,),
            Text("2",style: Theme.of(context).textTheme.titleSmall,),
            SizedBox(width: CustomSizes.spaceBetweenItems.w,),
            CircularIcon(icon: Iconsax.add,width: 40.w,height: 40.h,iconColor: Colors.white,backgroundColor: CustomColors.black,),

          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(CustomSizes.md),
            backgroundColor: CustomColors.black,
            side: const BorderSide(color: CustomColors.black)
          ),
            onPressed: (){}, child: const Text("Add to Cart"))
      ],
      ),
    );
  }
}
