import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/texts/section_heading.dart';

class CustomBillingAddressSection extends StatelessWidget {
  const CustomBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController=AddressController.instance;
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      CustomSectionHeading(headTitle: "Shipping Address",btnTitle: "Change",onPressed: ()=>addressController.selectNewAddressPopup(context),),

        addressController.selectedAddress.value.id.isNotEmpty?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(addressController.name.value.toString(),style: Theme.of(context).textTheme.bodyLarge,),
            SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),
            Row(
              children: [
                Icon(Icons.phone,color: CustomColors.grey,size: 16.sp,),
                SizedBox(width: CustomSizes.spaceBetweenItems.w,),
                Text(addressController.phoneNumber.value.toString(),style: Theme.of(context).textTheme.bodyMedium,)
              ],
            ),
            SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),
            Row(
              children: [
                Icon(Icons.location_history,color: CustomColors.grey,size: 16.sp,),
                SizedBox(width: CustomSizes.spaceBetweenItems.w,),
                Text(addressController.toString.toString(),softWrap:true,style: Theme.of(context).textTheme.bodyMedium,)
              ],
            ),
          ],
        ) :Text("Select Address",style: Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }
}
