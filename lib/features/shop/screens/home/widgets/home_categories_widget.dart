import 'package:ecommerce_app/common/widgets/shimmers/category_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/imgTexts/vertical_img_txt.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class CustomHomeCategories extends StatelessWidget {
  const CustomHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final isDarkMode=CustomHelpers.isDarkMode(context);
    final categoryController=Get.put(CategoryController());


    return Obx((){
      if(categoryController.isLoading.value)return CustomCategoryShimmer();

      if (categoryController.featuredCategories.isEmpty) {
        return Center(child: Text("No Data Found!",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: CustomColors.white),),);

      }
        return SizedBox(
          height: 90.h,
          child: ListView.builder(
              itemCount: categoryController.featuredCategories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category=categoryController.featuredCategories[index];
                return CustomVerticalImageText(
                  onTap: () {Navigator.of(context).pushNamed(PagesNames.subCategoriesScreen);},
                  image: category.image,
                  title: category.name,
                  // backgroundColor:isDarkMode? CustomColors.black:CustomColors.white,
                );
              }),
        );
      }
    );

}}
