import 'package:ecommerce_app/common/widgets/appbar/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/appbar/tabbar.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';

import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/customShapes/search_container.dart';
import '../../../../common/widgets/productCart/cart_counter_icon.dart';
import '../../../../utils/constants/pages_names.dart';
import '../../widgets/brand_card.dart';
import '../../widgets/category_tab.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = CustomHelpers.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            CustomTexts.store,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [CartCounterWidget(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor:
                    isDarkMode ? CustomColors.black : CustomColors.white,
                expandedHeight: 440.h,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: CustomSizes.xs.h,
                      ),

                      // search bar
                      const SearchContainer(
                        text: CustomTexts.searchInStore,
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(
                        height: CustomSizes.spaceBetweenSections.h,
                      ),

                      // featured brands
                      SectionHeading(
                        headTitle: CustomTexts.featuredBrands,
                        onPressed: () {Navigator.of(context).pushNamed(PagesNames.allBrandsScreen);},
                      ),
                      SizedBox(
                        height: CustomSizes.spaceBetweenItems.h / 1.5,
                      ),

                       CustomGridLayout(
                           itemCount: 4,
                           mainAxisExtent: 80,
                           itemBuilder: (context,index){
                        return const BrandCard(showBorder: true,);
                       })
                    ],
                  ),
                ),

                //tabs
                bottom: const CustomTabBar(tabs: [
                  Tab(child: Text(CustomTexts.furniture),),
                  Tab(child: Text(CustomTexts.sports),),
                  Tab(child: Text(CustomTexts.electronics),),
                  Tab(child: Text(CustomTexts.clothes),),
                  Tab(child: Text(CustomTexts.cosmetics),),

                ],)



              )
            ];
          },

          //body
          body:  const TabBarView(
            children: [
              CustomCategoryTab(),
              CustomCategoryTab(),
              CustomCategoryTab(),
              CustomCategoryTab(),
              CustomCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}

