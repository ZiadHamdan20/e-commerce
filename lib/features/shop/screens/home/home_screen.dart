import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_categories_widget.dart';
import 'package:ecommerce_app/features/shop/widgets/home_appbar.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';

import 'package:ecommerce_app/utils/constants/sizes.dart';

import 'package:ecommerce_app/utils/constants/texts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/primary_header_container.dart';
import '../../../../common/widgets/customShapes/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/productCart/product_card_vertical.dart';
import '../../../../utils/constants/pages_names.dart';
import '../../widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             PrimaryHeaderContainer(
                child: Column(
              children: [
                //AppBar
                 CustomHomeAppBar(),
                SizedBox(height: CustomSizes.spaceBetweenSections.h/2,),

                 CustomSearchContainer(
                  text: CustomTexts.searchInStore,
                  icon: Iconsax.search_normal,
                ),
                // SizedBox(height: CustomSizes.spaceBetweenSections.h,),
                SizedBox(
                  height: CustomSizes.spaceBetweenSections.h,
                ),
                Padding(
                    padding:
                    const EdgeInsets.only(left: CustomSizes.defaultSpace),
                    child: Column(
                        children: [
                          const CustomSectionHeading(
                            headTitle: CustomTexts.popularCategories,
                            showActionBtn: false,
                          ),
                          SizedBox(
                            height: CustomSizes.spaceBetweenItems.h,
                          ),
                          CustomHomeCategories(),
                        ])),



                SizedBox(height: CustomSizes.spaceBetweenSections.h,)

              ],
            )
             ),
            Padding(
                padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                child: Column(
                  children: [
                    const PromoSlider(
                      banners: [
                        CustomImageStrings.promoBanner1,
                        CustomImageStrings.promoBanner2,
                        CustomImageStrings.promoBanner3
                      ],
                    ),

                    SizedBox(
                      height: CustomSizes.spaceBetweenSections.h,
                    ),



                    //heading
                    CustomSectionHeading(
                      headTitle: "Popular Products",
                      onPressed: () {Navigator.of(context).pushNamed(PagesNames.allProductsScreen);},
                    ),
                    SizedBox(
                      height: CustomSizes.spaceBetweenSections.h,
                    ),
                    //Popular Products
                    CustomGridLayout(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const ProductCardVertical();
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
