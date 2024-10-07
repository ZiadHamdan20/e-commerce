
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appBar/custom_app_bar.dart';
import '../../../../../common/widgets/appBar/custom_curved_edges_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return CustomCurvedEdgesWidget(
      child: Container(
        color: isDarkMode? CustomColors.darkerGrey:CustomColors.light,
        child: Stack(
          children: [
            SizedBox(
              height:400.h,
              child: const Padding(
                padding: EdgeInsets.all(CustomSizes.productImageRadius*2),
                child: Center(child: Image(image: AssetImage(CustomImageStrings.productImage1))),
              ),
            ),

            //Image slider
            Positioned(
              right: 0.w,
              bottom: 30.h,
              left: CustomSizes.defaultSpace.w,
              child: SizedBox(
                height: 80.h,
                child: ListView.separated(
                  separatorBuilder: (_, __) {  return SizedBox(width: CustomSizes.spaceBetweenItems.w,);},
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_,index) {
                    return
                      RoundedImage(
                          width: 80.w,
                          backgroundColor: isDarkMode?CustomColors.dark:CustomColors.white,
                          border:Border.all(color: CustomColors.primary),
                          padding: const EdgeInsets.all(CustomSizes.sm),
                          imgUrl: CustomImageStrings.productImage3);
                  },

                ),
              ),
            ),

            //appbar icons
            const CustomAppBar(showBackArrow: true,
              actions: [CircularIcon(icon: Iconsax.heart5,iconColor: Colors.red,)],)
          ],
        ),
      ),
    );
  }
}
