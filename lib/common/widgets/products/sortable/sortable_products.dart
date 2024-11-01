
import 'package:ecommerce_app/features/shop/controllers/all_products_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../../productCart/product_card_vertical.dart';

class CustomSortableProducts extends StatelessWidget {
  const CustomSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel>products;


  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product sorting
    final controller=Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// DropDown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value){
            // SOrt products based on the selected option
            controller.sortProducts(value!);
          },
          items: ["Name","Higher Price","Lower Price","sale","Newest","Popularity"].map((option)=>DropdownMenuItem(value: option,child: Text(option),)).toList(),

        ),
        SizedBox(height:CustomSizes.spaceBetweenSections.h ,),

        /// Products
        Obx(
          ()=> CustomGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_,index){return  CustomProductCardVertical(product:controller.products[index] ,);}),
        ),


      ],
    );
  }
}
