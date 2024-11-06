import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/product/favourites_controller.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../common/widgets/product_cards/product_card_vertical.dart';
import '../../../../routs/pages_names.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=FavouritesController.instance;
    return  Scaffold(
      ///Custom AppBar
      appBar: CustomAppBar(
        title: Text(CustomTexts.wishList,style: Theme.of(context).textTheme.headlineMedium,),
        actions: [CustomCircularIcon(icon: Iconsax.add,
          onPressed: ()
        {Navigator.of(context).pushNamed(PagesNames.homeScreen);},)],
      ),

      ///Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          ///Products Grid
          child: Obx(
              ()=> FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                // Nothing Found Widget

                final emptyWidget = CustomAnimationLoaderWidget(
                  text: 'Whoops! WishList is Empty...',
                  animation:CustomImageStrings.pencilAnimation,
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () => Get.offNamed(PagesNames.navigationMenu),
                );


                const loader=CustomVerticalProductShimmer(itemCount: 6,);
                final widget=CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader,nothingFound: emptyWidget);
                if (widget!=null) return widget;

                final products=snapshot.data!;
                return CustomGridLayout(itemCount: products.length, itemBuilder: (context,index)
                {return  CustomProductCardVertical(product:products[index] ,);});
              }
            ),
          ),
        ),
      ),

    );
  }
}
