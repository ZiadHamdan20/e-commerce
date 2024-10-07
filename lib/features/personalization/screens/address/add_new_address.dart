import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/features/login/widgets/custom_text_field.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(title: Text("Add New Address"),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(CustomSizes.defaultSpace),child:
          Form(
            child: Column(
              children: [
                const CustomTextFormField(labelText: "Name", prefixIcon: Icon(Iconsax.user)),
                const SizedBox(height: CustomSizes.spaceBetweenInputFields,),
                const CustomTextFormField(labelText: "Phone Number", prefixIcon: Icon(Iconsax.mobile)),
                SizedBox(height: CustomSizes.spaceBetweenInputFields.h,),
                Row(
                  children: [
                    const Expanded(child: CustomTextFormField(labelText: "Street", prefixIcon: Icon(Iconsax.building_31))),
                    SizedBox(width: CustomSizes.spaceBetweenInputFields.w,),

                    const Expanded(child: CustomTextFormField(labelText: "Portal Code", prefixIcon: Icon(Iconsax.code))),


                  ],
                ),
                SizedBox(height: CustomSizes.spaceBetweenInputFields.h,),

                Row(
                  children: [
                    const Expanded(child: CustomTextFormField(labelText: "City", prefixIcon: Icon(Iconsax.building))),
                    SizedBox(width: CustomSizes.spaceBetweenInputFields.w,),

                    const Expanded(child: CustomTextFormField(labelText: "State", prefixIcon: Icon(Iconsax.activity))),


                  ],
                ),
                SizedBox(height: CustomSizes.spaceBetweenInputFields.h,),

                const CustomTextFormField(labelText: "Country", prefixIcon: Icon(Iconsax.global)),


                //this is how he did it in the video did not use the custom text field
                //TextFormField(decoration: InputDecoration(labelText: "Country ", prefixIcon: Icon(Iconsax.global),),),

                SizedBox(height: CustomSizes.defaultSpace.h,),
                SizedBox(width: double.infinity.w,child: ElevatedButton(onPressed: (){},child: const Text("Save"),),)

              ],
            ),
          ),),
      ),
    );
  }
}
