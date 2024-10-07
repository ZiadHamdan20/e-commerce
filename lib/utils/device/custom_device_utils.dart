import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class CustomDeviceUtils
{
  static void hideKeyBoard(BuildContext context)
  {
    FocusScope.of(context).requestFocus(FocusNode());

  }

  static void setFullScreen(bool enable)
  {
    SystemChrome.setEnabledSystemUIMode(enable?SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);

  }

  static double getScreenWidth(BuildContext context)
  {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context)
  {
    return MediaQuery.of(context).size.height;
  }

  static double getAppBarHeight()
  {
    return kToolbarHeight;
  }

  static double getBottomNavigationBarHeight()
  {
    return kBottomNavigationBarHeight;
  }
  static void launcherUrl(String url )async
  {
    if (await canLaunchUrlString(url)) {
      await  launchUrlString(url);
      
    }  else
      {
        throw "Could not launch $url";
      }
  }
}