import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appBar/custom_app_bar.dart';
import '../../../../authentication/controllers/update_name/update_name_controller.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(

        /// Custom Appbar
        appBar: CustomAppBar(
          showBackArrow: true,
          title: Text('Change Name',
              style: Theme.of(context).textTheme.headlineSmall),
        ), // TAppBar
        body: Padding(
            padding: const EdgeInsets.all(CustomSizes.defaultSpace),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              /// Headings
              Text(
                'Use real name for easy verification. This name will appear on several pages. ',
                style: Theme.of(context).textTheme.labelMedium,
              ), // Text
              SizedBox(height: CustomSizes.spaceBetweenSections.h),

              /// Text field and Button
              Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => CustomValidator.validateEmptyText(
                          'First name', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: CustomTexts.firstName,
                          prefixIcon: Icon(Iconsax.user)),
                    ), // TextFormField
                    SizedBox(height: CustomSizes.spaceBetweenInputFields.h),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          CustomValidator.validateEmptyText('Last name', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: CustomTexts.lastName,
                          prefixIcon: Icon(Iconsax.user)),
                    ), // TextFormField
                  ], // Column, Form
                ), // Form
              ),
              SizedBox(height: CustomSizes.spaceBetweenSections.h),

              ///Save Button
              SizedBox(
                width: double.infinity.w,
                child: ElevatedButton(
                    onPressed: () => controller.updateUserName(),
                    child: const Text("Save")),
              )
            ])));
  }
}
