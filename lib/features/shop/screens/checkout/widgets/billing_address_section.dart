import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/texts/section_heading.dart';

class CustomBillingAddressSection extends StatelessWidget {
  const CustomBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      CustomSectionHeading(headTitle: "Shipping Address",btnTitle: "Change",onPressed: (){},),

        Text("Ziad Hamdan",style: Theme.of(context).textTheme.bodyLarge,),

        SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),
        Row(
          children: [
            Icon(Icons.phone,color: CustomColors.grey,size: 16.sp,),
            SizedBox(width: CustomSizes.spaceBetweenItems.w,),
            Text("+963-922-369",style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),



        Row(
          children: [
            Icon(Icons.location_history,color: CustomColors.grey,size: 16.sp,),
            SizedBox(width: CustomSizes.spaceBetweenItems.w,),
            Text("Syria,Latakia,Al-Ziraa Street",softWrap:true,style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),


      ],
    );
  }
}
