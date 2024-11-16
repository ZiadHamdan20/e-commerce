import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/pricing_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBillingAmountSection extends StatelessWidget {
  const CustomBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {

    final cartController=CartController.instance;
    final subTotal=cartController.totalCartPrice.value;

    return  Column(
      /// Subtitle
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$$subTotal",style: Theme.of(context).textTheme.bodyMedium,),

          ],
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

        /// Shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$${CustomPricingCalculator.calculateShippingCost(subTotal, "US")}",style: Theme.of(context).textTheme.labelLarge,),

          ],
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

        //tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$${CustomPricingCalculator.calculateTax(subTotal, "US")}",style: Theme.of(context).textTheme.labelLarge,),

          ],
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

        //order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$${CustomPricingCalculator.calculateTotalPrice(subTotal, "US")}",style: Theme.of(context).textTheme.titleMedium,),


          ],
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),



      ],
    );
  }
}
