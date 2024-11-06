import 'package:ecommerce_app/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/sizes.dart';

class CustomHorizontalProductShimmer extends StatelessWidget {
  const CustomHorizontalProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: CustomSizes.spaceBetweenItems),
        height: 120.h,
        child: ListView.separated(
            itemCount: itemCount,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                const SizedBox(width: CustomSizes.spaceBetweenItems),
            itemBuilder: (_, __) =>
                Row(mainAxisSize: MainAxisSize.min, children: [
                  /// Image
                  CustomShimmerEffect(width: 120.w, height: 120.h),
                  SizedBox(width: CustomSizes.spaceBetweenItems.w),

                  /// Text
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: CustomSizes.spaceBetweenItems.h / 2),
                        CustomShimmerEffect(width: 160.w, height: 15.h),
                        SizedBox(height: CustomSizes.spaceBetweenItems.h / 2),
                        CustomShimmerEffect(width: 110.w, height: 15.h),
                        SizedBox(height: CustomSizes.spaceBetweenItems.h / 2),
                        CustomShimmerEffect(width: 80.w, height: 15.h),
                        const Spacer(),
                      ])
                ])));
  }
}
