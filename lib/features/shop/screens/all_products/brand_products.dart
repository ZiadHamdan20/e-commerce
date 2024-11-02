import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecommerce_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/brand_controller.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/features/shop/widgets/brand_card.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});


  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller=BrandController.instance;
    return Scaffold(
      appBar:  CustomAppBar(title: Text(brand.name),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              // Brand details
               CustomBrandCard(showBorder: true, brand: brand,),
              SizedBox(height: CustomSizes.spaceBetweenSections.h,),
               FutureBuilder(
                 future: controller.getBrandProducts(brand.id),
                 builder: (context, snapshot) {
                   /// Handle Loader , No Record, Or Error Message
                   const loader=CustomVerticalProductShimmer();
                   final widget=CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                   if (widget !=null) return widget;

                   ///Record found!
                   final brandProducts=snapshot.data!;
                   return CustomSortableProducts(products: brandProducts,);
                 }
               )
            ],
          ),
        ),
      ),
    );
  }
}
