
import 'package:ecommerce_app/features/signup/widgets/custom_signup_form.dart';
import 'package:ecommerce_app/features/signup/widgets/custom_signup_title.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/widgets/signInLogin/custom_divider.dart';
import '../../../common/widgets/signInLogin/custom_social_buttons.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: CustomSizes.defaultSpace,
              left: CustomSizes.defaultSpace,
              right: CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              const CustomSignupTitle(),
              SizedBox(
                height: CustomSizes.spaceBetweenSections.h,
              ),

              //Form
              const CustomSignupForm(),
              CustomDivider(
                dividerText: CustomTexts.orSignUpWith.capitalize!,
              ),

              const CustomSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
