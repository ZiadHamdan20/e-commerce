import 'package:ecommerce_app/common/widgets/customShapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/product/checkout_controller.dart';

class CustomBillingPaymentSection extends StatelessWidget {
  const CustomBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(CheckoutController());
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return  Column(
      children: [
        CustomSectionHeading(headTitle: "Payment Method",
          btnTitle: "Change",
          onPressed: ()=>controller.selectPaymentMethod(context)),
        SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

        Obx(()=>
           Row(
            children: [
              CustomRoundedContainer(
                width: 60.w,
                height: 35.h,
                backgroundColor: isDarkMode?CustomColors.light:CustomColors.white,
                padding: const EdgeInsets.all(CustomSizes.sm),
                child:  Image(image: AssetImage(controller.selectedPaymentMethod.value.image,),fit: BoxFit.contain,),
          
              ),
              SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),
          
              Text(controller.selectedPaymentMethod.value.name,style: Theme.of(context).textTheme.bodyLarge,)
          
          
            ],
          ),
        )


      ],
    );
  }
}
