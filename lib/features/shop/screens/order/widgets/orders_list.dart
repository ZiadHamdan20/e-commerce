import 'package:ecommerce_app/common/widgets/customShapes/rounded_container.dart';
import 'package:ecommerce_app/features/shop/controllers/product/order_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../navigation_menu.dart';

class CustomOrderListItems extends StatelessWidget {
  const CustomOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OrderController());
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return  FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {
        /// Nothing Found Widget
        final emptyWidget = CustomAnimationLoaderWidget(
            text: 'Whoops! No Orders Yet!',
            animation: CustomImageStrings.orderCompletedAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        /// Helper function: Handle Loader, No Record, OR ERROR Message
        final response = CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;

        /// Congratulations 😍 Record found.
        final orders=snapshot.data!;
        return Expanded(
          child: ListView.separated(
            itemCount:orders.length ,
            shrinkWrap: true,
            separatorBuilder: (_,index)=>SizedBox(height: CustomSizes.spaceBetweenItems.h,),
            itemBuilder:(_,index){
              final order=orders[index];
              return CustomRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(CustomSizes.md),
                backgroundColor: isDarkMode ? CustomColors.dark:CustomColors.light,
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    ///-- Top Row
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
                              Text(order.orderStatusText,style: Theme.of(context).textTheme.bodyLarge!.apply(fontSizeDelta: 1,color: CustomColors.primary,),overflow: TextOverflow.ellipsis,),
                              Text(order.formattedOrderDate,style: Theme.of(context).textTheme.headlineSmall,)
                            ],
                          ),
                        ),

                        //3-icon
                        IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34,size: CustomSizes.iconSm,color: isDarkMode?CustomColors.light:CustomColors.darkerGrey,))

                      ],
                    ),

                    SizedBox(height: CustomSizes.spaceBetweenItems.h,),
                    /// -- Bottom Row
                    Row(
                      children: [
                        Expanded(
                          child: Row(

                            /// 1-Icon
                            children: [
                              const Icon(Iconsax.tag),
                              SizedBox(width: CustomSizes.spaceBetweenItems.w/2,),

                              /// 2-Status and date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Order",style: Theme.of(context).textTheme.labelMedium),
                                    Text(order.id,style: Theme.of(context).textTheme.titleMedium,)
                                  ],
                                ),
                              ),

                              /// Delivery Date
                              Expanded(
                                child: Row(

                                  /// 1-Icon
                                  children: [
                                    const Icon(Iconsax.calendar),
                                    SizedBox(width: CustomSizes.spaceBetweenItems.w/2,),

                                    /// 2-Status and date
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Shipping Date",style: Theme.of(context).textTheme.labelMedium),
                                          Text(order.formattedDeliveryDate,style: Theme.of(context).textTheme.titleMedium,overflow: TextOverflow.ellipsis,)
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
              );
            }

          ),
        );
      }
    );
  }
}
