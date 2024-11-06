
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/features/shop/controllers/product/image_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appBar/custom_app_bar.dart';
import '../../../../../common/widgets/appBar/custom_curved_edges_widget.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../common/widgets/products/favourite_icon/favourite_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class CustomProductImageSlider extends StatelessWidget {
  const CustomProductImageSlider({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDarkMode=CustomHelpers.isDarkMode(context);

    final controller=Get.put(ImagesController());
    final images=controller.getAllProductImages(product);
    return CustomCurvedEdgesWidget(
      child: Container(
        color: isDarkMode? CustomColors.darkerGrey:CustomColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height:400.h,
              child:  Padding(
                padding: const EdgeInsets.all(CustomSizes.productImageRadius*2),
                child: Center(child: Obx((){
                  final image=controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: ()=>controller.showEnlargedImage(image),
                      child: CachedNetworkImage(imageUrl: image,progressIndicatorBuilder: (_,__,downloadProgress)=>CircularProgressIndicator(value: downloadProgress.progress,color: CustomColors.primary,),));
                }
            )),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0.w,
              bottom: 30.h,
              left: CustomSizes.defaultSpace.w,
              child: SizedBox(
                height: 80.h,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) {  return SizedBox(width: CustomSizes.spaceBetweenItems.w,);},
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_,index)=>Obx((){
                    final imageSelected=controller.selectedProductImage.value==images[index];
                    return
                      CustomRoundedImage(
                          width: 80.w,
                          isNetworkImage: true,
                          onPressed: ()=>controller.selectedProductImage.value=images[index],
                          backgroundColor: isDarkMode?CustomColors.dark:CustomColors.white,
                          border:Border.all(color: imageSelected?CustomColors.primary:Colors.transparent),
                          padding: const EdgeInsets.all(CustomSizes.sm),
                          imgUrl: images[index]);
                  })

                ),
              ),
            ),

            //appbar icons
             CustomAppBar(showBackArrow: true,
              actions: [CustomFavouriteIcon(productId: product.id,)],)
          ],
        ),
      ),
    );
  }
}
