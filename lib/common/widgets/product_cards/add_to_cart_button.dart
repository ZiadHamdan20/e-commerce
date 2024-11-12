
import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/routs/pages_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key, required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController=CartController.instance;
    return InkWell(
      onTap:(){
     // have variations then show the product details for variation selection.
        // Else add product to the cart.
    if (product.productType == ProductType.single.toString()) {
    final cartItem = cartController.convertToCartItem(product, 1);
    cartController.addOneToCart(cartItem);
      }else{
      Get.toNamed(PagesNames.productDetails,arguments: [product]);
    }
    },
      child: Obx((){
        final productQuantityInCart=cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration:  BoxDecoration(
              color: productQuantityInCart >0 ?CustomColors.primary:CustomColors.dark,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(CustomSizes.cardRadiusMd),
                bottomRight: Radius.circular(CustomSizes.productImageRadius),
              )),
          child: SizedBox(
              width: CustomSizes.iconLg.w * 1.2,
              height: CustomSizes.iconLg.h * 1.2,
              child:  Center(
                  child:productQuantityInCart >0 ? Text(productQuantityInCart.toString(),style: Theme.of(context).textTheme.bodyLarge!.apply(color: CustomColors.white),):const Icon(
                    Iconsax.add,
                    color: CustomColors.white,
                  ))),
        );
      }

      ),
    );
  }
}
