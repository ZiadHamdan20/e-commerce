import 'package:ecommerce_app/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../layouts/grid_layout.dart';

class CustomVerticalProductShimmer extends StatelessWidget {
  const CustomVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return CustomGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) =>  SizedBox(
        width: 180.w,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              CustomShimmerEffect(width: 180.w, height: 180.h),
              SizedBox(height: CustomSizes.spaceBetweenItems.h,),

              //Text
              CustomShimmerEffect(width: 160.w, height: 15.h),
              SizedBox(height: CustomSizes.spaceBetweenItems.h/2),
              CustomShimmerEffect(width: 110.w, height: 15.h),

            ]
        ),
      ),
    );
  }
}