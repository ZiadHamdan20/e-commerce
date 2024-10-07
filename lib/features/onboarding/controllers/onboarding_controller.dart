import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/constants/pages_names.dart';
class OnBoardingController extends GetxController
{
  static OnBoardingController get instance => Get.find();
  //vars
  final pageController=PageController();
  Rx<int> currentPageIndex=0.obs;


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