import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/customShapes/rounded_container.dart';
import '../../../common/widgets/images/circular_Image.dart';
import '../../../common/widgets/texts/brand_title_with verification_icon.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;



  @override
  Widget build(BuildContext context) {
    final bool isDarkMode=CustomHelpers.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: const EdgeInsets.all(CustomSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child:
        Row(


          children: [
            //icon
            Flexible(
              child: CircularImage(
                image: CustomImageStrings.clothesIcon,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: isDarkMode?CustomColors.white:CustomColors.black,
              ),
            ),

            SizedBox(width: CustomSizes.spaceBetweenItems.w/2,),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BrandTitleTextWithVerifiedIcon(title: "Nike",brandTextSize: TextSizes.large,),
                  Text("260 products",overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.labelMedium,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
