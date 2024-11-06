import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/favourites_controller.dart';
import '../../icons/circular_icon.dart';

class CustomFavouriteIcon extends StatelessWidget {
  const CustomFavouriteIcon({
    super.key, required this.productId,
  });

  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(FavouritesController());
    return Obx(
      ()=>CustomCircularIcon(
        icon: controller.isFavorite(productId)?Iconsax.heart5:Iconsax.heart,
        iconColor: controller.isFavorite(productId)?CustomColors.error:null,
        onPressed: ()=>controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}

