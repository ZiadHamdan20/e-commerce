import 'package:ecommerce_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_categories_widget.dart';
import 'package:ecommerce_app/features/shop/widgets/home_appbar.dart';

import 'package:ecommerce_app/utils/constants/sizes.dart';

import 'package:ecommerce_app/utils/constants/texts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/primary_header_container.dart';
import '../../../../common/widgets/customShapes/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/productCart/product_card_vertical.dart';
import '../../../../routs/pages_names.dart';
import '../../controllers/product/product_controller.dart';
import '../../widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             PrimaryHeaderContainer(
                child: Column(
              children: [
                //AppBar
                 const CustomHomeAppBar(),
                SizedBox(height: CustomSizes.spaceBetweenSections.h/2,),

                 const CustomSearchContainer(
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
                          const CustomHomeCategories(),
                        ])),



                SizedBox(height: CustomSizes.spaceBetweenSections.h,)

              ],
            )
             ),
            Padding(
                padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                child: Column(
                  children: [
                    const CustomPromoSlider(),

                    SizedBox(height: CustomSizes.spaceBetweenSections.h,),

                    //heading
                    CustomSectionHeading(
                      headTitle: "Popular Products",
                      onPressed: () {Navigator.of(context).pushNamed(PagesNames.allProductsScreen);},
                    ),
                    SizedBox(height: CustomSizes.spaceBetweenSections.h,),
                    //Popular Products

                    Obx((){
                      if(controller.isLoading.value)return const CustomVerticalProductShimmer();

                      if (controller.featuredProducts.isEmpty) {
                        return Center(child: Text("No Data Found!",style: Theme.of(context).textTheme.titleMedium,),);
                      }

                      return CustomGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) {
                          return  CustomProductCardVertical( product: controller.featuredProducts[index],);
                        },
                      );

                    })
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
