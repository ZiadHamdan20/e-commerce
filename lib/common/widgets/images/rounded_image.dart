import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imgUrl,
    this.applyImgRadius=true,
    this.backgroundColor,
    this.fit,
    this.padding,
    this.isNetworkImage=false,
    this.onPressed,
    this.border,
    this.borderRadius=CustomSizes.md,
  });

  final double? width, height;
  final String imgUrl;
  final bool applyImgRadius;
  final Color? backgroundColor;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final void Function()? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,

        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius:  applyImgRadius?BorderRadius.circular(

              CustomSizes.md.r):BorderRadius.zero,
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius.r),
            child:  Image(
              image: isNetworkImage?NetworkImage(imgUrl):AssetImage(imgUrl) as ImageProvider,
              fit: fit,
            )),
      ),
    );
  }
}
