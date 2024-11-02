
import 'package:ecommerce_app/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../layouts/grid_layout.dart';

class CustomBrandsShimmer extends StatelessWidget {
  const CustomBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
  return CustomGridLayout(
  mainAxisExtent: 80,
  itemCount: itemCount,
  itemBuilder: (_, __) =>  CustomShimmerEffect(width: 300.w, height: 80.h),
  ); // TGridLayout
  }
}
