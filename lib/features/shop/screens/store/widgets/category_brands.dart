
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/shimmers/boxes_shimmer.dart';
import '../../../../../common/widgets/shimmers/list_tile_shimmer.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/brand_controller.dart';
import '../../../models/category_model.dart';
import '../../../widgets/brand_show_case.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {

         // Handle Loader, No Record, OR Error Message
          final loader = Column(
            children: [
              const CustomListTileShimmer(),
              SizedBox(height: CustomSizes.spaceBetweenItems.h),
              const CustomBoxesShimmer(),
              SizedBox(height: CustomSizes.spaceBetweenItems.h)
            ],
          );

          final widget = CustomCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          ///Record Found
          final brands = snapshot.data!;

          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (_, index) {
                final brand = brands[index];
                return FutureBuilder(
                  future: controller.getBrandProducts(brandId:brand.id,limit: 3),
                  builder: (context, snapshot) {
                    // Handle Loader, No Record, OR Error Message
                    final widget = CustomCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    ///Record Found
                    final products = snapshot.data!;


                    return CustomBrandShowcase(images: products.map((e)=>e.thumbnail).toList(), brand: brand,);
                  }
                );
              });
        });
  }
}
