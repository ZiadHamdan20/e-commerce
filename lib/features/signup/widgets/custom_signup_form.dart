import 'package:ecommerce_app/features/signup/widgets/custom_checkbox_and_privacy.dart';
import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';

class CustomSignupForm extends StatelessWidget {
  const CustomSignupForm({super.key});

  @override
  Widget build(BuildContext context) {

    return  Form(
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: CustomTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  )),
              SizedBox(
                width: CustomSizes.spaceBetweenItems.w,
              ),
              Expanded(
                  child: TextFormField(
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
            decoration: const InputDecoration(
                labelText: CustomTexts.userName,
                prefixIcon: Icon(Iconsax.user_add)),
          ),
          SizedBox(
            height: CustomSizes.spaceBetweenInputFields.h,
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: CustomTexts.email,
                prefixIcon: Icon(Icons.email_outlined)),
          ),
          SizedBox(
            height: CustomSizes.spaceBetweenInputFields.h,
          ),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
                labelText: CustomTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          SizedBox(
            height: CustomSizes.spaceBetweenInputFields.h,
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: CustomTexts.phoneNo,
                prefixIcon: Icon(Iconsax.call)),
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
                Navigator.of(context).pushNamed(PagesNames.verifyEmailScreen);
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
