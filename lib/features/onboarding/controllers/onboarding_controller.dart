import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routs/pages_names.dart';
class OnBoardingController extends GetxController
{
  static OnBoardingController get instance => Get.find();
  //vars
  final pageController=PageController();
  Rx<int> currentPageIndex=0.obs;

  get deviceStorage => null;


  //update curr index   when page scroll

void updatePageIndicator(index){
  currentPageIndex.value= index;
}

  //jump to spec dot selected page
void dotNavigationClick(index){
  currentPageIndex.value= index;
  pageController.jumpTo(index);


}

  //update current index and jump to page
void nextPage(BuildContext context){
  if (currentPageIndex.value==2) {
    final storage=GetStorage();
    if(kDebugMode)
    {
      print("================GET STORAGE==================");
      print(storage.read("isFirstTime"));
    }
    storage.write("isFirstTime",false);
    Navigator.of(context).pushReplacementNamed(PagesNames.logInScreen);
  }
  else
    {
      int page=currentPageIndex.value +1;
      pageController.jumpToPage(page);

    }
}

  //update current index and jump to the last page
void skipPage(){
  pageController.jumpToPage(2);
}
}