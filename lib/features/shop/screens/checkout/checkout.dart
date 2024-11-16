
import 'package:ecommerce_app/common/widgets/appbar/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/customShapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:ecommerce_app/utils/helpers/pricing_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../controllers/product/order_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController=CartController.instance;
    final subTotal=cartController.totalCartPrice.value;
    final orderController=Get.put(OrderController());
    final totalAmount=CustomPricingCalculator.calculateTotalPrice(subTotal, "US");


    final isDarkMode=CustomHelpers.isDarkMode(context);
    return   Scaffold(
      appBar: CustomAppBar(showBackArrow: true,title: Text("Order Review",style: Theme.of(context).textTheme.headlineSmall,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in cart
              const CustomCartItems(showAddRemoveButtons: false,),
              SizedBox(height: CustomSizes.spaceBetweenSections.h,),


              /// -- Coupon TextField
              const CustomCouponCode(),
              SizedBox(height: CustomSizes.spaceBetweenSections.h,),

              /// -- Billing section
              CustomRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(CustomSizes.md),
                backgroundColor: isDarkMode?CustomColors.black:CustomColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    const CustomBillingAmountSection(),
                    SizedBox(height: CustomSizes.spaceBetweenItems.h,),

                    /// Divider
                    const Divider(),
                    SizedBox(height: CustomSizes.spaceBetweenItems.h,),


                    /// Payment methods
                    const CustomBillingPaymentSection(),
                    SizedBox(height: CustomSizes.spaceBetweenItems.h,),

                    /// Address
                    const CustomBillingAddressSection(),
                    SizedBox(height: CustomSizes.spaceBetweenItems.h,),

                  ],
                ),
              )

            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: ElevatedButton(
            onPressed:subTotal>0?()=>orderController.processOrder(totalAmount)
    :()=>CustomLoaders.warningSnackBar(title: "Empty Cart",message: "Add items in the cart in order to proceed."),
        child:  Text("Checkout \$$totalAmount}")),
      ) ,
    );
  }
}

