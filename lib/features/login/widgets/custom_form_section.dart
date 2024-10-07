import 'package:ecommerce_app/features/login/widgets/custom_text_field.dart';
import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';

class CustomFormSection extends StatelessWidget {
  const CustomFormSection({super.key});

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: CustomSizes.spaceBetweenSections.h),
      child: Form(
          child: Column(
        children: [
          const CustomTextFormField(labelText: CustomTexts.email, prefixIcon: Icon(Icons.email_outlined)),

          SizedBox(height: CustomSizes.spaceBetweenInputFields.h,),

          const CustomTextFormField(labelText: CustomTexts.password, prefixIcon: Icon(Iconsax.password_check),suffixIcon: Icon(Iconsax.eye_slash),),

          const SizedBox(height: CustomSizes.spaceBetweenInputFields /2,)

          ,Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //remember me
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value){}),
                  const Text(CustomTexts.rememberMe)
                ],
              ),



              //forget password
              TextButton(onPressed: (){
                Navigator.of(context).pushNamed(PagesNames.forgetPasswordScreen);

              }, child:const Text( CustomTexts.forgetPassword)),

            ],
          ),
          SizedBox(height: CustomSizes.spaceBetweenSections.h / 2,),



          //signin btn
          SizedBox(width:MediaQuery.of(context).size.width,
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed(PagesNames.navigationMenu);
              }, child: const Text(CustomTexts.signIn)))
          ,SizedBox(height: CustomSizes.spaceBetweenItems.h,),

          //create account btn
          SizedBox(width:MediaQuery.of(context).size.width,
              child: OutlinedButton(onPressed: (){
                Navigator.of(context).pushNamed(PagesNames.signupScreen);
              }, child: const Text(CustomTexts.createAccount))),

         ],


      ),

      ),








    );
  }
}
