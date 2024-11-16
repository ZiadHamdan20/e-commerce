import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/features/shop/screens/order/widgets/orders_list.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      /// Appbar
      appBar: CustomAppBar(title: Text("My Orders",style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,),

      body: const Padding(
        padding: EdgeInsets.all(CustomSizes.defaultSpace),

        /// Orders,
        child: CustomOrderListItems(),
      ),
    );
  }
}
