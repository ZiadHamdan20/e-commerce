import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/category_brands.dart';
import 'package:ecommerce_app/routs/pages_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/widgets/product_cards/product_card_vertical.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/helpers/cloud_helper_functions.dart';

class CustomCategoryTab extends StatelessWidget {
  const CustomCategoryTab({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(CustomSizes.defaultSpace),
            child: Column(
              children: [
                /// -- Brands
                CategoryBrands(category: category),
                SizedBox(
                  height: CustomSizes.spaceBetweenItems.h,
                ),

                /// -- Products
                FutureBuilder(
                    future:
                        controller.getCategoryProducts(categoryId: category.id),
                    builder: (context, snapshot) {
                      /// Handle Loader, No Record, OR Error Message
                      final response =

                          CustomCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: const CustomVerticalProductShimmer());
                      if (response != null) return response;

                      ///Record Found
                      final products = snapshot.data!;
                      return Column(
                        children: [
                          CustomSectionHeading(
                            headTitle: CustomTexts.youMightLike,
                            onPressed: () => Get.toNamed(
                                PagesNames.allProductsScreen,
                                arguments: [
                                  category.name,
                                  null,
                                  controller.getCategoryProducts(
                                      categoryId: category.id, limit: -1)
                                ]),
                          ),
                          SizedBox(
                            height: CustomSizes.spaceBetweenItems.h,
                          ),
                          CustomGridLayout(
                              itemCount: products.length,
                              itemBuilder: (_, index) {
                                return CustomProductCardVertical(
                                  product: products[index],
                                );
                              }),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ]);
  }
}
