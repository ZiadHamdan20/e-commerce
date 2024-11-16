import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../routs/pages_names.dart';
import '../navigation_menu.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Obx(() {
        // Nothing Found Widget

        final emptyWidget = CustomAnimationLoaderWidget(
          text: 'Whoops! Cart is EMPTY.',
          animation: CustomImageStrings.cartAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
                  padding: EdgeInsets.all(CustomSizes.defaultSpace),

                  /// -- items in cart
                  child: CustomCartItems()),
          );
        }
      }),

      /// checkout Button
      // Checkout Button
      bottomNavigationBar: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return Padding(
            padding: const EdgeInsets.all(CustomSizes.defaultSpace),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(PagesNames.checkoutScreen);
              },
              child: Text("Checkout \$${controller.totalCartPrice.value}"),
            ),
          );
        }
      }),

    );
  }
}
