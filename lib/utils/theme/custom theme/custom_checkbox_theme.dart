import 'package:flutter/material.dart';

import '../../constants/colors.dart';

abstract class CustomCheckboxTheme
{
  static CheckboxThemeData lightCheckboxThemeData=CheckboxThemeData(

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states)
    {
      return states.contains(MaterialState.selected) ?  CustomColors.white : CustomColors.black;
    }
    ),
    fillColor: MaterialStateProperty.resolveWith((states)
    {
      return states.contains(MaterialState.selected) ?  CustomColors.primary : Colors.transparent;
    }
    ),
  );
  static CheckboxThemeData darkCheckboxThemeData=CheckboxThemeData(

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states)
    {
      return states.contains(MaterialState.selected) ?  Colors.white : Colors.black;
    }
    ),
    fillColor: MaterialStateProperty.resolveWith((states)
    {
      return states.contains(MaterialState.selected) ?  CustomColors.primary : Colors.transparent;
    }
    ),
  );

}