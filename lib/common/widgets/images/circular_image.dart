import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../shimmers/shimmer.dart';





class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = CustomSizes.sm,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.fit = BoxFit.cover,
  });

  final double width, height, padding;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = CustomHelpers.isDarkMode(context);
    return Container(
      width: width.w,
      height: height.h,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (isDarkMode ? CustomColors.black : CustomColors.white),
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.r),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
            imageUrl: image,
            fit: fit,
            color: overlayColor,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CustomShimmerEffect(width: 55.w, height: 55.h),
            errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
          )
              : Image(
            image:  AssetImage(image),
            color: overlayColor,
            fit: fit,
          ),
        ),
      ),
    );
  }
}























// class CircularImage extends StatelessWidget {
//   const CircularImage({
//     super.key,
//     this.width = 56,
//     this.height = 56,
//     this.padding = CustomSizes.sm,
//     required this.image,
//     this.isNetworkImage = false,
//     this.overlayColor,
//     this.backgroundColor,
//     this.fit = BoxFit.cover,
//   });
//   final double width, height, padding;
//   final String image;
//   final bool isNetworkImage;
//   final Color? overlayColor, backgroundColor;
//   final BoxFit? fit;
//
//   @override
//   Widget build(BuildContext context) {
//     final bool isDarkMode = CustomHelpers.isDarkMode(context);
//     return Container(
//         width: width.w,
//         height: height.h,
//         padding: EdgeInsets.all(padding),
//         decoration: BoxDecoration(
//           color: backgroundColor ?? (isDarkMode ? CustomColors.black : CustomColors.white),
//           borderRadius: BorderRadius.circular(100.r),
//         ),
//         child:ClipRRect(
//           borderRadius: BorderRadius.circular(100.r),
//           child: Center(
//             child: isNetworkImage
//             ?CachedNetworkImage(
//               imageUrl: image,
//               fit: fit,
//               color: overlayColor,
//               progressIndicatorBuilder: (context ,url ,downloadProgress) =>
//                   CustomShimmerEffect(width: 55.w, height: 55.h),
//               errorWidget: (context ,url ,error)=>Icon(Icons.error,color: Colors.red,),
//             )
//             :
//             Image(
//               image: AssetImage(CustomImageStrings.user),
//               color:overlayColor,
//               fit: fit,
//             ),
//           ),
//         ));
//   }
// }
