import 'dart:async';

import 'package:ecommerce_app/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../routs/pages_names.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

/// Send Email Verification link
  sendEmailVerification()async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      CustomLoaders.successSnackBar(title: "Email sent",message:"Please check your inbox and verify your email.");

    }catch(e){
      CustomLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());

    }
  }
/// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer)async{
      await FirebaseAuth.instance.currentUser?.reload();
      final user=FirebaseAuth.instance.currentUser;
      if(user?.emailVerified??false)
        {
          timer.cancel();
          Get.offNamed(
              PagesNames.successScreen,
              arguments: [
            CustomTexts.yourAccountCreatedTitle,
            CustomTexts.yourAccountCreatedSubTitle,
            CustomImageStrings.successfullyRegisteredAnimation,
            ()=>AuthenticationRepository.instance.screenRedirect()
                         ]
          );
        }

    });


  }
/// Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null && currentUser.emailVerified) {
      Get.offNamed(
          PagesNames.successScreen,
          arguments: [
            CustomTexts.yourAccountCreatedTitle,
            CustomTexts.yourAccountCreatedSubTitle,
            CustomImageStrings.successfullyRegisteredAnimation,
                ()=>AuthenticationRepository.instance.screenRedirect()
          ]
      );
    }
  }}
