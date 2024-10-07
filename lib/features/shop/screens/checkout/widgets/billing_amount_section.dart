import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBillingAmountSection extends StatelessWidget {
  const CustomBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      //subtitle
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$250.0",style: Theme.of(context).textTheme.bodyMedium,),

          ],
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

        //shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$6.0",style: Theme.of(context).textTheme.labelLarge,),

          ],
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

        //tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Rax Fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$6.0",style: Theme.of(context).textTheme.labelLarge,),

          ],
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

        //order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$262.0",style: Theme.of(context).textTheme.titleMedium,),


          ],
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),



      ],
    );
  }
}
