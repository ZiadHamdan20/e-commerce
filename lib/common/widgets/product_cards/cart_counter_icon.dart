
import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/routs/pages_names.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class CustomCartCounterIcon extends StatelessWidget {
  const CustomCartCounterIcon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });
  final Color? iconColor,counterBgColor,counterTextColor;

  @override
  Widget build(BuildContext context) {
    // Get an instance of the CartController
    final controller=Get.put(CartController());
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: (){Navigator.of(context).pushNamed(PagesNames.cartScreen);},
            icon:  Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            height: 20.h,
            width: 20.w,
            decoration: BoxDecoration(
                color: counterBgColor??(isDarkMode?CustomColors.white:CustomColors.black),
                borderRadius: BorderRadius.circular(18)),
            child: Center(
              child: Obx(()=>
                  Text(
                    controller.noOfCartItems.value.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: counterBgColor??(isDarkMode?CustomColors.black:CustomColors.white), fontSizeFactor: 0.8,),
                  ),
              ),
            ),
          ),
        )
      ],
    );
  }
}