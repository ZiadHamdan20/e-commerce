import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../controllers/all_products_controller.dart';
import '../../models/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key,
    required this.title,
    this.query,
    this.futureMethod});


  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    //Initialize controller for managing product fetching
    final controller=Get.put(AllProductsController());
    return  Scaffold(
      appBar: CustomAppBar(title: Text(title),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              // Check the state of the FutureBuilder snapshot
              const loader = CustomVerticalProductShimmer();
              final widget=CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

              //return appropriate widget based on snapshot state
              if (widget !=null) return widget;
              // Products found!
              final products = snapshot.data!;
              return CustomSortableProducts(products:products,);
            }
          ),
        ),
      ),

    );
  }
}
