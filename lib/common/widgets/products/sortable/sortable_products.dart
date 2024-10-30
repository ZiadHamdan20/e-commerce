
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../../productCart/product_card_vertical.dart';

class CustomSortableProducts extends StatelessWidget {
  const CustomSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //DropDown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value){},
          items: ["Name","Higher Price","Lower Price","sale","Newest","Popularity"].map((option)=>DropdownMenuItem(value: option,child: Text(option),)).toList(),

        ),
        SizedBox(height:CustomSizes.spaceBetweenSections.h ,),

        //Products
        CustomGridLayout(
            itemCount: 6,
            itemBuilder: (_,index){return  CustomProductCardVertical(product:ProductModel.empty() ,);}),


      ],
    );
  }
}
