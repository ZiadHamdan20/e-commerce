import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/widgets/brand_card.dart';
import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(title: Text("All Brands"),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              //Heading
              const SectionHeading(headTitle: "Brands",showActionBtn: false,),
              SizedBox(height: CustomSizes.spaceBetweenItems.h,),


              //Brands
              CustomGridLayout(
                mainAxisExtent: 80.h,
                  itemCount: 10,
                  itemBuilder: (context,index)=>BrandCard(showBorder: true,onTap: ()=>Navigator.of(context).pushNamed(PagesNames.brandProducts),)),
            ],
          ),
        ),
      ),

    );
  }
}
