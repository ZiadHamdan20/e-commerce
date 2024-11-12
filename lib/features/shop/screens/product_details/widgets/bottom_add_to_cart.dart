import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomAddToCart extends StatelessWidget {
  const CustomBottomAddToCart({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = CustomHelpers.isDarkMode(context);

    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: CustomSizes.defaultSpace.w,
          vertical: CustomSizes.defaultSpace.h / 2),
      decoration: BoxDecoration(
          color: isDarkMode ? CustomColors.darkerGrey : CustomColors.light,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(CustomSizes.cardRadiusLg.r),
            topRight: Radius.circular(CustomSizes.cardRadiusLg.r),
          )),
      child: Obx(()=>
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Row(
                children: [
                  CustomCircularIcon(
                    icon: Iconsax.minus,
                    width: 40.w,
                    height: 40.h,
                    iconColor: Colors.white,
                    backgroundColor: CustomColors.darkGrey,
                     onPressed:    () => controller.productQuantityInCart.value < 1
                        ? null
                        : controller.productQuantityInCart.value -= 1,
                  ),
                  SizedBox(
                    width: CustomSizes.spaceBetweenItems.w,
                  ),
                  Text(
                    controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    width: CustomSizes.spaceBetweenItems.w,
                  ),
                  CustomCircularIcon(
                    icon: Iconsax.add,
                    width: 40.w,
                    height: 40.h,
                    iconColor: Colors.white,
                    backgroundColor: CustomColors.black,
                    onPressed: () =>
                        controller.productQuantityInCart.value += 1,
                  ),
                ],
              ),

            ElevatedButton(
               onPressed: controller.productQuantityInCart.value < 1 ? null : ()=>controller.addToCart(product),

          //  onPressed: (){},
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(CustomSizes.md),
                    backgroundColor: CustomColors.black,
                    side: const BorderSide(color: CustomColors.black)),
                child: const Text("Add to Cart"))
          ],
        ),
      ),
    );
  }
}
