import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/routs/pages_names.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/helpers/cloud_helper_functions.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(PagesNames.addNewAddressScreen);
        },
        backgroundColor: CustomColors.primary,
        child: const Icon(
          Iconsax.add,
          color: CustomColors.white,
        ),
      ),
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          "Addresses",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(CustomSizes.defaultSpace),
            child: Obx(
                ()=> FutureBuilder(
                // Use key to trigger refresh
                key: Key(controller.refreshData.value.toString()),
                  future: controller.getAllUserAddresses(),
                  builder: (context, snapshot) {

                    // Helper Function: Handle Loader, No Record, OR ERROR Message
                    final response = CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                    if (response != null) return response;
                    final addresses = snapshot.data!;
                    print("Number of addresses to display: ${addresses.length}");


                    return SizedBox(
                      height: MediaQuery.of(context).size.height.h -150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: addresses.length,
                        itemBuilder: (_, index)
                        {
                          print("Displaying address: ${addresses[index].id}");
                          return CustomSingleAddress(address: addresses[index],onTap: ()=>controller.selectAddress(addresses[index]));

                        }

                      ),
                    );
                  }),
            )),
      ),
    );
  }
}
