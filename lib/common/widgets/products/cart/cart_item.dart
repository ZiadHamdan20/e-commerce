import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/rounded_image.dart';
import '../../product_label_text.dart';
import '../../texts/brand_title_with verification_icon.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final bool isDarkMode=CustomHelpers.isDarkMode(context);

    return Row(
      children: [
        //image
        CustomRoundedImage(
          imgUrl: CustomImageStrings.productImage1,
          width: 60.w,
          height: 60.h,
          padding: const EdgeInsets.all(CustomSizes.sm),
          backgroundColor: isDarkMode?CustomColors.darkerGrey:CustomColors.light,
        ),

        SizedBox(width: CustomSizes.spaceBetweenItems.w,),


        //title,price,size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBrandTitleTextWithVerifiedIcon(title: "Nike"),
              const Flexible(child: CustomProductTitleText(title: "Green Sports Shoes",maxLines: 1,)),
              //Attributes
              Text.rich(TextSpan(
                  children:[
                    TextSpan(text: "Color ",style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: "Green ",style: Theme.of(context).textTheme.bodyLarge),

                    TextSpan(text: "Size ",style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: "Uk 34 ",style: Theme.of(context).textTheme.bodyLarge),

                  ]
              ))

            ],
          ),
        )


      ],
    );
  }
}
