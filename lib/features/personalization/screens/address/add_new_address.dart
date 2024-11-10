import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Add New Address"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => CustomValidator.validateEmptyText("Name", value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: "Name"),
                ),
                const SizedBox(
                  height: CustomSizes.spaceBetweenInputFields,
                ),

                TextFormField(
                  controller: controller.phoneNumber,
                  validator: CustomValidator.validatePhoneNumber,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: "Phone Number"),
                ),
                const SizedBox(
                  height: CustomSizes.spaceBetweenInputFields,
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) =>
                            CustomValidator.validateEmptyText("Street", value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),
                            labelText: "Street"),
                      ),
                    ),
                    SizedBox(
                      width: CustomSizes.spaceBetweenInputFields.w,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) => CustomValidator.validateEmptyText(
                            "Postal Code", value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: "Postal Code",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: CustomSizes.spaceBetweenInputFields.h,
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) =>
                            CustomValidator.validateEmptyText("City", value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building),
                            labelText: "City"),
                      ),
                    ),
                    SizedBox(
                      width: CustomSizes.spaceBetweenInputFields.w,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) =>
                            CustomValidator.validateEmptyText("State", value),
                        expands: false,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: "State"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: CustomSizes.spaceBetweenInputFields.h,
                ),

                TextFormField(
                  controller: controller.country,
                  validator: (value) =>
                      CustomValidator.validateEmptyText("Country", value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: "Country"),
                ),

                //this is how he did it in the video did not use the custom text field
                //TextFormField(decoration: InputDecoration(labelText: "Country ", prefixIcon: Icon(Iconsax.global),),),

                SizedBox(
                  height: CustomSizes.defaultSpace.h,
                ),
                SizedBox(
                  width: double.infinity.w,
                  child: ElevatedButton(
                    onPressed: () {controller.addNewAddresses();},
                    child: const Text("Save"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
