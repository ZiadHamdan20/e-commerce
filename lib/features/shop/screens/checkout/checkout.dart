
import 'package:ecommerce_app/common/widgets/appbar/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/customShapes/rounded_container.dart';
import 'package:ecommerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../routs/pages_names.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return   Scaffold(
      appBar: CustomAppBar(showBackArrow: true,title: Text("Order Review",style: Theme.of(context).textTheme.headlineSmall,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              //items in cart
              const CustomCartItems(showAddRemoveButtons: false,),
              SizedBox(height: CustomSizes.spaceBetweenSections.h,),


              //coupon TextField
              const CustomCouponCode(),
              SizedBox(height: CustomSizes.spaceBetweenSections.h,),

              //Billing section
              CustomRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(CustomSizes.md),
                backgroundColor: isDarkMode?CustomColors.black:CustomColors.white,
                child: Column(
                  children: [
                    //pricing
                    const CustomBillingAmountSection(),
                    SizedBox(height: CustomSizes.spaceBetweenItems.h,),

                    //Divider
                    const Divider(),
                    SizedBox(height: CustomSizes.spaceBetweenItems.h,),


                    //payment methods
                    const CustomBillingPaymentSection(),
                    SizedBox(height: CustomSizes.spaceBetweenItems.h,),
                    // address

                    const CustomBillingAddressSection(),
                    SizedBox(height: CustomSizes.spaceBetweenItems.h,),

                  ],
                ),
              )

            ],
          ),
        ),
      ),

      //
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: (){
          Navigator.of(context).pushNamed(PagesNames.successScreen,arguments:
            ["Payment Success!","Your item will be shipped soon!",CustomImageStrings.successfulPaymentIcon,(){Navigator.of(context).pushNamed(PagesNames.navigationMenu);},]

          );
        },child: const Text("Payment")),
      ) ,
    );
  }
}

