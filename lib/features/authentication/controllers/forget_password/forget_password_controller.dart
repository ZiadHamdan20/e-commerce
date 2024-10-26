import 'package:ecommerce_app/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/routs/pages_names.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/helpers/network_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password EMail
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      CustomFullScreenLoader.openLoadingDialog(
          'Processing your request ... ', CustomImageStrings.docerAnimation);
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        CustomFullScreenLoader.stopLoading();
        return;
       }
      // Send EMail to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(
          email.text.trim());
      // Remove Loader
      CustomFullScreenLoader.stopLoading();
      // Show Success Screen
      CustomLoaders.successSnackBar(title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);
      // Redirect
      Get.toNamed( PagesNames.resetPasswordScreen,arguments: [email.text.trim()]);
    }
    catch (e) {
      //remove loader
      CustomFullScreenLoader.stopLoading();
      CustomLoaders.errorSnackBar(title: "Oh Snap",message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async{
    try {
      // Start Loading
      CustomFullScreenLoader.openLoadingDialog(
          'Processing your request ... ', CustomImageStrings.docerAnimation);
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.stopLoading();
        return;
      }

      // Send EMail to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      // Remove Loader
      CustomFullScreenLoader.stopLoading();
      // Show Success Screen
      CustomLoaders.successSnackBar(title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);
    }
    catch (e) {
      //remove loader
      CustomFullScreenLoader.stopLoading();
      CustomLoaders.errorSnackBar(title: "Oh Snap",message: e.toString());
    }
  }
}
