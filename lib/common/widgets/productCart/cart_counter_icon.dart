
import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class CartCounterWidget extends StatelessWidget {
  const CartCounterWidget({
    super.key,
     this.iconColor,
    required this.onPressed,
    this.counterBgColor,
    this.counterTextColor,
  });
  final Color? iconColor,counterBgColor,counterTextColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: (){Navigator.of(context).pushNamed(PagesNames.cartScreen);},
            icon:  Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            height: 20.h,
            width: 20.w,
            decoration: BoxDecoration(
                color: counterBgColor??(isDarkMode?CustomColors.black:CustomColors.white),
                borderRadius: BorderRadius.circular(18)),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: counterBgColor??(isDarkMode?CustomColors.white:CustomColors.black), fontSize: 12.sp),
              ),
            ),
          ),
        )
      ],
    );
  }
}
