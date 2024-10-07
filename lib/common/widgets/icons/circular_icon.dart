import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/custom_helpers.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.width,
    this.height,
    this.size = CustomSizes.lg,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor, iconColor;
  final double? width, height, size;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = CustomHelpers.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),

        color: backgroundColor != null
            ? backgroundColor!
            : isDarkMode
                ? CustomColors.black.withOpacity(0.9)
                : CustomColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: size,
          color: iconColor,
        ),
      ),
    );
  }
}
