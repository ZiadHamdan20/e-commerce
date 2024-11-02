import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/brand_controller.dart';
import 'package:ecommerce_app/features/shop/widgets/brand_card.dart';
import 'package:ecommerce_app/routs/pages_names.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/shimmers/brand_shimmer.dart';
import '../../../../utils/constants/colors.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController=BrandController.instance;
    return  Scaffold(
      appBar: const CustomAppBar(title: Text("All Brands"),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Heading
              const CustomSectionHeading(headTitle: "Brands",showActionBtn: false,),
              SizedBox(height: CustomSizes.spaceBetweenItems.h,),


              /// -- Brands
              Obx(
                      (){
                    if(brandController.isLoading.value)return const CustomBrandsShimmer();

                    if (brandController.allBrands.isEmpty) {
                      return Center(
                        child: Text("No Data Found!",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: CustomColors.white),),
                      );
                    }
                    return  CustomGridLayout(
                        itemCount: brandController.allBrands.length,
                        mainAxisExtent: 80,
                        itemBuilder: (_,index){
                          final brand=brandController.allBrands[index];
                          return  CustomBrandCard(showBorder: true,brand:brand ,onTap: ()=>Get.toNamed(PagesNames.brandProducts,arguments: [brand]),);
                        });}

              )  ],
          ),
        ),
      ),

    );
  }
}
