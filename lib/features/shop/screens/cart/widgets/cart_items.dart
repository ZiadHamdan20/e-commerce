import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/cart_controller.dart';

class CustomCartItems extends StatelessWidget {
  const CustomCartItems({super.key,
     this.showAddRemoveButtons=true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return  Obx(
      ()=>ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) {
          return SizedBox(
            height: CustomSizes.spaceBetweenSections.h,
          );
        },
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) {
          return Obx((){
            final item=cartController.cartItems[index];
            return Column(
              children: [
                 CustomCartItem(cartItem: item,),
                if (showAddRemoveButtons)

                  SizedBox(
                    height: CustomSizes.spaceBetweenItems.h,
                  ),
                if (showAddRemoveButtons)  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        /// Extra space
                        SizedBox(width: 70.w,),
                        /// Add remove buttons
                         CustomProductWithAddRemoveButton(quantity: item.quantity,add: ()=>cartController.addOneToCart(item),remove: ()=>cartController.removeOneFromCart(item),),
                      ],
                    ),


                     ProductPriceText(price: (item.price*item.quantity).toStringAsFixed(1))
                  ],
                )
              ],
            );
          }

          );
        },
      ),
    );
  }
}
