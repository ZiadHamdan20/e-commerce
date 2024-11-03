import 'package:ecommerce_app/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/sizes.dart';

class CustomListTileShimmer extends StatelessWidget {
  const CustomListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            CustomShimmerEffect(width: 50.w, height: 50.h, radius: 50.r),
            SizedBox(width: CustomSizes.spaceBetweenItems.w),
            Column(
              children: [
                CustomShimmerEffect(width: 100.w, height: 15.h),
                SizedBox(height: (CustomSizes.spaceBetweenItems.h / 2)),
                CustomShimmerEffect(width: 80.w, height: 12.h),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

