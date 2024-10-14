
import 'package:ecommerce_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce_app/features/signup/widgets/custom_checkbox_and_privacy.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';

class CustomSignupForm extends StatelessWidget {
  const CustomSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
final controller=Get.put(SignUpController());
    return  Form(
      key:controller.signupFormKey ,
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                    validator: (value)=>CustomValidator.validateEmptyText("First name", value),
                    controller: controller.firstName,
                    decoration: const InputDecoration(
                        labelText: CustomTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  )),
              SizedBox(
                width: CustomSizes.spaceBetweenItems.w,
              ),
              Expanded(
                  child: TextFormField(
                    validator: (value)=>CustomValidator.validateEmptyText("Last name", value),
                    controller: controller.lastName,
                    decoration: const InputDecoration(
                        labelText: CustomTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  )),
            ],
          ),
          SizedBox(
            height: CustomSizes.spaceBetweenInputFields.h,
          ),
          TextFormField(
            validator: (value)=>CustomValidator.validateEmptyText("Username", value),
            controller: controller.username,
            decoration: const InputDecoration(
                labelText: CustomTexts.userName,
                prefixIcon: Icon(Iconsax.user_add)),
          ),
          SizedBox(
            height: CustomSizes.spaceBetweenInputFields.h,
          ),
          TextFormField(
            validator: (value)=>CustomValidator.validateEmail( value),
            controller: controller.email,
            decoration: const InputDecoration(
                labelText: CustomTexts.email,
                prefixIcon: Icon(Icons.email_outlined)),
          ),
          SizedBox(
            height: CustomSizes.spaceBetweenInputFields.h,
          ),

          TextFormField(
            validator: (value)=>CustomValidator.validatePhoneNumber( value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
                labelText: CustomTexts.phoneNo,
                prefixIcon: Icon(Iconsax.call)),
          ),

          SizedBox(
            height: CustomSizes.spaceBetweenInputFields.h,
          ),
          Obx(
    ()=> TextFormField(
              validator: (value)=>CustomValidator.validatePassword( value),
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              keyboardType: TextInputType.visiblePassword,
              decoration:  InputDecoration(
                  labelText: CustomTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(onPressed: (){
                     controller.hidePassword.value= !controller.hidePassword.value;}, icon:  Icon(controller.hidePassword.value?  Iconsax.eye_slash: Iconsax.eye))),
            ),
          ),

          SizedBox(
            height: CustomSizes.spaceBetweenSections.h,
          ),
          const CustomCheckboxAndPrivacy(),
          SizedBox(
            height: CustomSizes.spaceBetweenSections.h,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                controller.signup();
              },
              child: const Text(CustomTexts.createAccount),
            ),
          ),
          SizedBox(
            height: CustomSizes.spaceBetweenSections.h,
          ),

        ])
    );
  }
}
