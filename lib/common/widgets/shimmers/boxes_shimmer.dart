import 'package:ecommerce_app/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/sizes.dart';

class CustomBoxesShimmer extends StatelessWidget {
  const CustomBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            Expanded(child: CustomShimmerEffect(width: 150.w, height: 110.h)),
            SizedBox(width: CustomSizes.spaceBetweenItems.w),
            Expanded(child: CustomShimmerEffect(width: 150.w, height: 110.h)),
            SizedBox(width: CustomSizes.spaceBetweenItems.w),
            Expanded(child: CustomShimmerEffect(width: 150.w, height: 110.h)),
          ],
        ),
      ],
    );
  }
}

