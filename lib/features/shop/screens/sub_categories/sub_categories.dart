import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/productCart/product_card_horizontal.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(title: Text("Sports"),showBackArrow: true,),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              //Banner
              CustomRoundedImage(imgUrl: CustomImageStrings.banner4,width: double.infinity.w,height: null,applyImgRadius: true,),
              SizedBox(height: CustomSizes.spaceBetweenSections.h,),

              //sub categories
              Column(
                children: [
                  //heading
                  CustomSectionHeading(headTitle: "Sports shirts",onPressed: (){},),
                  SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

                  SizedBox(
                    height: 120.h,
                    child: ListView.separated(
                      separatorBuilder: (_,__)=>SizedBox(width: CustomSizes.spaceBetweenItems.w,),
                      itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)=>const ProductCardHorizontal()),
                  )


                ],
              )
            ],
          ),
        ),
      ) ,

    );
  }
}
