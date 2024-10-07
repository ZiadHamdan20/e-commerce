import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class CustomStyle
{
  static const EdgeInsetsGeometry paddingWithAppBarHeight=EdgeInsets.only(
    top: CustomSizes.appBarHeight,
    bottom: CustomSizes.defaultSpace,
    right: CustomSizes.defaultSpace,
    left: CustomSizes.defaultSpace,
  );
}