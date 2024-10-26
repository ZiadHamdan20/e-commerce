// Controller to manage user-related functionality.
import 'package:ecommerce_app/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/routs/pages_names.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../personalization/controllers/user_controller.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // Init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  // Update user name
  Future<void> updateUserName() async {
    try {
      // Start Loading

      CustomFullScreenLoader.openLoadingDialog(
          'We are updating your information...',
          CustomImageStrings.docerAnimation);

      // Check Internet Connectivity

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        CustomFullScreenLoader.stopLoading();

        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        CustomFullScreenLoader.stopLoading();

        return;
      }

      // Update user's first & last name in the Firebase Firestore

      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };

      await userRepository.updateSingleField(name);

      // Update the Rx User value

      userController.user.value.firstName = firstName.text.trim();

      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      CustomFullScreenLoader.stopLoading();
      // Show Success Message
      CustomLoaders.successSnackBar(
          title: 'Congratulations!', message: 'Your Name has been updated.');

      //Move to previous screen
      Get.offNamed(PagesNames.profileScreen);

    }

    catch (e) {
      CustomFullScreenLoader.stopLoading();
      CustomLoaders.errorSnackBar(
          title: 'Oh Snap!!', message: e.toString());



    }
  }}