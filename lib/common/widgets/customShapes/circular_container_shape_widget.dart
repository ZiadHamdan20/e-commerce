import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularContainerShapeWidget extends StatelessWidget {
  const CircularContainerShapeWidget(
      {super.key,
      this.width = 400,
      this.height = 400,
      this.radius = 400,
      this.padding=0,
      this.child,
      this.backgroundColor = CustomColors.textWhite,
      this.margin });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width!.w,
      height: height!.h,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(400.r)),
      child: child,
    );
  }
}
