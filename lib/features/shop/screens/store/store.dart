import 'package:ecommerce_app/common/widgets/appbar/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/appbar/tabbar.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/brand_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';

import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/customShapes/search_container.dart';
import '../../../../common/widgets/product_cards/cart_counter_icon.dart';
import '../../../../common/widgets/shimmers/brand_shimmer.dart';
import '../../../../routs/pages_names.dart';
import '../../widgets/brand_card.dart';
import '../../widgets/category_tab.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController=Get.put(BrandController());
    final categories=CategoryController.instance.featuredCategories;
    final isDarkMode = CustomHelpers.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        /// -- Appbar
        appBar: CustomAppBar(
          title: Text(
            CustomTexts.store,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [CartCounterWidget(onPressed: () {})],
        ),
        body: NestedScrollView(
          /// --Header
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 410.h,
                backgroundColor: isDarkMode ? CustomColors.black : CustomColors.white,
                // Space between Appbar and TabBar
                automaticallyImplyLeading: false,

                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: CustomSizes.xs.h,
                      ),

                      /// -- Search bar
                      const CustomSearchContainer(
                        text: CustomTexts.searchInStore,
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(
                        height: CustomSizes.spaceBetweenSections.h,
                      ),

                      /// -- Featured Brands
                      CustomSectionHeading(
                        headTitle: CustomTexts.featuredBrands,
                        onPressed: () {Navigator.of(context).pushNamed(PagesNames.allBrandsScreen);},
                      ),
                      SizedBox(
                        height: CustomSizes.spaceBetweenItems.h / 1.5,
                      ),

                       /// -- Brands Grid
                       Obx(
                           (){
                             if(brandController.isLoading.value)return const CustomBrandsShimmer();

                             if (brandController.featuredBrands.isEmpty) {
                               return Center(
                                 child: Text("No Data Found!",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: CustomColors.white),),
                               );
                             }
                            return  CustomGridLayout(
                                 itemCount: brandController.featuredBrands.length,
                                 mainAxisExtent: 80,
                                 itemBuilder: (_,index){
                                   final brand=brandController.featuredBrands[index];
                                   return  CustomBrandCard(showBorder: true,brand:brand ,onTap: ()=>Get.toNamed(PagesNames.brandProducts,arguments: [brand]),);
                                 });}

                       )
                    ],
                  ),
                ),

                /// -- Tabs
                bottom:  CustomTabBar
                  (tabs:categories.map((category)=> Tab(child: Text(category.name),)).toList()
                ),



              )
            ];
          },

          //body
          body:   TabBarView(
            children:categories.map((category)=>CustomCategoryTab(category: category,)).toList()

          ),
        ),
      ),
    );
  }
}

