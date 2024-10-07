import 'package:ecommerce_app/common/widgets/customShapes/rounded_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return  ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      separatorBuilder: (_,__)=>SizedBox(height: CustomSizes.spaceBetweenItems.h,),


      itemBuilder:(_,index)=> RoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(CustomSizes.md),
        backgroundColor: isDarkMode?CustomColors.dark:CustomColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            //first row
            Row(

              //1-Icon

              children: [
                const Icon(Iconsax.ship),
                SizedBox(width: CustomSizes.spaceBetweenItems.w/2,),

                //2-status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Processing",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: CustomColors.primary,),),
                      Text("07 Nov 2024",style: Theme.of(context).textTheme.headlineSmall,)
                    ],
                  ),
                ),

                //3-icon
                IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34,size: CustomSizes.iconSm,color: isDarkMode?CustomColors.light:CustomColors.darkerGrey,))

              ],
            ),

            SizedBox(height: CustomSizes.spaceBetweenItems.h,),
            //second row
            Row(
              children: [
                Expanded(
                  child: Row(

                    //1-Icon

                    children: [
                      const Icon(Iconsax.tag),
                      SizedBox(width: CustomSizes.spaceBetweenItems.w/2,),

                      //2-status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order",style: Theme.of(context).textTheme.labelMedium),
                            Text("[#2589f2]",style: Theme.of(context).textTheme.titleMedium,)
                          ],
                        ),
                      ),

                      Expanded(
                        child: Row(

                          //1-Icon

                          children: [
                            const Icon(Iconsax.calendar),
                            SizedBox(width: CustomSizes.spaceBetweenItems.w/2,),

                            //2-status and date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Shipping Order",style: Theme.of(context).textTheme.labelMedium),
                                  Text("03 Feb 2025",style: Theme.of(context).textTheme.titleMedium,)
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),



                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
