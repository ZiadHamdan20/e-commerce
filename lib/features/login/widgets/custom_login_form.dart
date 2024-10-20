import 'package:ecommerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(LoginController());

    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: CustomSizes.spaceBetweenSections.h),
      child: Form(
        key: controller.loginFormKey,
          child: Column(
        children: [
          //Email
          TextFormField(
            controller: controller.email,
            validator: (value)=>CustomValidator.validateEmail(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText:CustomTexts.email ),),

          SizedBox(height: CustomSizes.spaceBetweenInputFields.h,),

          //Password
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

          const SizedBox(height: CustomSizes.spaceBetweenInputFields /2,)

          ,Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //remember me
              Obx(
                  ()=> Row(
                  children: [
                    Checkbox(value: controller.rememberMe.value, onChanged: (value)=>controller.rememberMe.value=!controller.rememberMe.value),
                    const Text(CustomTexts.rememberMe)
                  ],
                ),
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
              child: ElevatedButton(onPressed: ()=>controller.emailAndPasswordSignIn(), child: const Text(CustomTexts.signIn)))
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
