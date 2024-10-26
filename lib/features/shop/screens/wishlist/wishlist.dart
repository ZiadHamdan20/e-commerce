import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/productCart/product_card_vertical.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../routs/pages_names.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: Text(CustomTexts.wishList,style: Theme.of(context).textTheme.headlineMedium,),
        actions: [CircularIcon(icon: Iconsax.add,
          onPressed: ()
        {Navigator.of(context).pushNamed(PagesNames.homeScreen);},)],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              CustomGridLayout(itemCount: 4, itemBuilder: (context,index)
              {return const ProductCardVertical();})

            ],
          ),
        ),
      ),

    );
  }
}
