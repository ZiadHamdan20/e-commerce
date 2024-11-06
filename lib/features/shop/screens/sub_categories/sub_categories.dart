import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/routs/pages_names.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/product_cards/product_card_horizontal.dart';
import '../../../../common/widgets/shimmers/horizontal_product_shimmer.dart';


class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller=CategoryController.instance;
    return  Scaffold(
      appBar:  CustomAppBar(title: Text(category.name),showBackArrow: true,),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Banner
              CustomRoundedImage(imgUrl: CustomImageStrings.banner4,width: double.infinity.w,height: null,applyImgRadius: true,),
              SizedBox(height: CustomSizes.spaceBetweenSections.h,),

              /// -- Sub-Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {

                  // Handle Loader, No Record, OR Error Message
                  const loader = CustomHorizontalProductShimmer();
                  final widget = CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  // Record found.
                  final subCategories = snapshot.data!;


                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_,index){

                      final subCategory=subCategories[index];

                        return FutureBuilder(
                          future: controller.getCategoryProducts(categoryId: subCategory.id),
                          builder: (context, snapshot) {


                            /// Handle Loader, No Record, OR Error Message
                            final widget = CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                            if (widget != null) return widget;

                            ///Congrats! Records found
                            final products=snapshot.data!;

                            return Column(
                              children: [
                                /// Heading
                                CustomSectionHeading(headTitle: subCategory.name,onPressed: ()=>Get.toNamed(PagesNames.allProductsScreen,arguments: [subCategory.name,null,controller.getCategoryProducts(categoryId: category.id,limit: -1)]),),
                                SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

                                SizedBox(
                                  height: 120.h,
                                  child: ListView.separated(
                                      separatorBuilder: (_,__)=>SizedBox(width: CustomSizes.spaceBetweenItems.w,),
                                      itemCount:products.length ,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context,index)=> CustomProductCardHorizontal(product:products[index])),
                                ),
                                SizedBox(height: CustomSizes.spaceBetweenSections.h,)


                              ],
                            );
                          }
                        );
                      }

                  );

                }
              )
            ],
          ),
        ),
      ) ,

    );
  }
}
