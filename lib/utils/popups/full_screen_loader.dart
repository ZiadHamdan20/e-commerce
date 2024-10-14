
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/animation_loader.dart';

/// A utility class for managing a full-screen loading dialog.
class CustomFullScreenLoader {
  /// Open a full-screen Loading dialog with a given text and animation.
  /// This method doesn't return anything.
  /// Parameters:
  /// - text: The text to be displayed in the Loading dialog.
  /// - animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      // Use Get. overlayContext for overlay dialogs
      barrierDismissible: false,
      // The dialog can't be dismissed by tapping outside it
      builder: (_) =>
          PopScope(
            canPop: false, // Disable popping with the back button
            child: Container(
              color: CustomHelpers.isDarkMode(Get.context!)
                  ? CustomColors.dark
                  : CustomColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                  children: [
                    const SizedBox(height: 250), // Adjust the spacing as needed
                    CustomAnimationLoaderWidget(text: text, animation: animation),
                  ]), // Column
            ), // Container
          ), // PopScope
    );
  }
  /// Stop the currently open Loading dialog.
  /// This method doesn't return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); // Close the dialog using the Navigator
  }}