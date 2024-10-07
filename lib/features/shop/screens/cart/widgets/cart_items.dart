import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class CustomCartItems extends StatelessWidget {
  const CustomCartItems({super.key,
     this.showAddRemoveButtons=true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) {
        return SizedBox(
          height: CustomSizes.spaceBetweenSections.h,
        );
      },
      itemCount: 2,
      itemBuilder: (_, index) {
        return Column(
          children: [
            const CustomCartItem(),
           if (showAddRemoveButtons)

             SizedBox(
              height: CustomSizes.spaceBetweenItems.h,
            ),
            if (showAddRemoveButtons)  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //extra space
                    SizedBox(width: 70.w,),
                    //Add remove buttons
                    const CustomProductWithAddRemoveButton(),
                  ],
                ),


                const ProductPriceText(price: "250")
              ],
            )
          ],
        );
      },
    );
  }
}
