import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
             Navigator.of(context).pushNamed(PagesNames.addNewAddressScreen);},

        backgroundColor: CustomColors.primary,
        child: const Icon(Iconsax.add,color: CustomColors.white,),

      ),
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text("Addresses",style: Theme.of(context).textTheme.headlineSmall,),
      ),

      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              CustomSingleAddress(selectedAddress: false),
              CustomSingleAddress(selectedAddress: true),

            ],
          ),
        ),
      ),
    );
  }
}
