
import 'package:ecommerce_app/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/pages_names.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../personalization/models/user_model.dart';

class SignUpController extends GetxController
{
  static SignUpController get instance =>Get.find();

  //variables
  final hidePassword =true.obs;
  final privacyPolicy =true.obs;
  final email=TextEditingController();
  final firstName=TextEditingController();
  final lastName=TextEditingController();
  final username=TextEditingController();
  final password=TextEditingController();
  final phoneNumber=TextEditingController();

  GlobalKey<FormState>signupFormKey=GlobalKey<FormState>();

//signup
Future<void>signup()async {
  try {
    //start loading
    CustomFullScreenLoader.openLoadingDialog(
        "We are processing your information...",
        CustomImageStrings.docerAnimation);

    //check internet connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      //remove loader
      CustomFullScreenLoader.stopLoading();
      return;
    }

    //form validation
    if (!signupFormKey.currentState!.validate()) {
      //remove loader
      CustomFullScreenLoader.stopLoading();

      return;
    }

    //privacy policy check
    if (!privacyPolicy.value) {
      CustomLoaders.warningSnackBar(title: "Accept Privacy Policy",
          message: "In order to create account, you must have to read and accept the Privacy Policy & Terms of Use");

      return;
    }


    //Register user in firebase authentication & Save user data in the firebase
    final userCredential = await AuthenticationRepository.instance
        .registerWithEmailAndPassword(email.text.trim(),password.text.trim());

    //Save authentication user data in the firebase FireStore

    final newUser = UserModel(
      id: userCredential.user!.uid,
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      username: username.text.trim(),
      email: email.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
      profilePicture: '',
    );

    final userRepository = Get.put(UserRepository());
    await userRepository.saveUserRecord(newUser);

    //remove loader
    CustomFullScreenLoader.stopLoading();


    //show  success message
    CustomLoaders.successSnackBar(
        title: "Congratulations",
        message: "Your account has been created! Verify email to continue.");
    //move to verify email screen
    Get.toNamed( PagesNames.verifyEmailScreen,arguments:[email.text.trim()] );
  }


  catch(e){
    //remove loader
    CustomFullScreenLoader.stopLoading();

    //show some Generic Error to user
    CustomLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
  }
}}
