import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.dividerText});
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final isDarkMode=CustomHelpers.isDarkMode(context);

    return      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: isDarkMode ?CustomColors.darkGrey :CustomColors.grey ,thickness: 0.5.sp, indent: 60.w,endIndent: 5.w,)),
        Text(dividerText.capitalize!,style: Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(color: isDarkMode ?CustomColors.darkGrey :CustomColors.grey ,thickness: 0.5.sp, indent: 5.w,endIndent: 60.w,)),
      ],
    );
  }
}
