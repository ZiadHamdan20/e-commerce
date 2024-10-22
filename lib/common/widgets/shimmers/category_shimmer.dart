import 'package:ecommerce_app/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryShimmer extends StatelessWidget {
  const CustomCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) =>  const SizedBox(width: CustomSizes.spaceBetweenItems),
          itemBuilder: (_, __) {
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            ///Image
      CustomShimmerEffect(width: 55.w, height: 55.h, radius: 55.r),
      const SizedBox(height: CustomSizes.spaceBetweenSections/2),

          ///Text
            CustomShimmerEffect(width: 55.w, height: 8.h,),

      ],
      );
            return null;
  },)
    );
  }
}