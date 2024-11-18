import 'package:flutter/material.dart';

import '../../constants/colors.dart';

abstract class CustomCheckboxTheme
{
  static CheckboxThemeData lightCheckboxThemeData=CheckboxThemeData(

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states)
    {
      return states.contains(WidgetState.selected) ?  CustomColors.white : CustomColors.black;
    }
    ),
    fillColor: WidgetStateProperty.resolveWith((states)
    {
      return states.contains(WidgetState.selected) ?  CustomColors.primary : Colors.transparent;
    }
    ),
  );
  static CheckboxThemeData darkCheckboxThemeData=CheckboxThemeData(

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states)
    {
      return states.contains(WidgetState.selected) ?  Colors.white : Colors.black;
    }
    ),
    fillColor: WidgetStateProperty.resolveWith((states)
    {
      return states.contains(WidgetState.selected) ?  CustomColors.primary : Colors.transparent;
    }
    ),
  );

}