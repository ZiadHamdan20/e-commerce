import 'package:ecommerce_app/features/shop/models/cart_item_model.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/rounded_image.dart';
import '../../product_label_text.dart';
import '../../texts/brand_title_with verification_icon.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    super.key, required this.cartItem,
  });
final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode=CustomHelpers.isDarkMode(context);

    return Row(
      children: [
        //image
        CustomRoundedImage(
          imgUrl: cartItem.image??"",
          isNetworkImage: true,
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
               CustomBrandTitleTextWithVerifiedIcon(title: cartItem.brandName??""),
               Flexible(child: CustomProductTitleText(title: cartItem.title,maxLines: 1,)),
              //Attributes
              Text.rich(TextSpan(

                children: (cartItem.selectedVariation ?? {})
                    .entries
                    .map(
                        (e) => TextSpan(
                      children: [
                        TextSpan(text: ' ${e.key} ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: '${e.value} ', style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    )) .toList(),

              ))

            ],
          ),
        )


      ],
    );
  }
}
