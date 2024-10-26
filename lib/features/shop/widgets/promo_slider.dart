import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/widgets/customShapes/circular_container_shape_widget.dart';
import '../../../common/widgets/images/rounded_image.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class CustomPromoSlider extends StatelessWidget {
  const CustomPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(BannerController());
    return Obx(
        (){

          //Loader
          if (controller.isLoading.value) return const CustomShimmerEffect(width: double.infinity, height: 190);

          //No Data Found
          if (controller.banners.isEmpty) {
            return const Center(child:Text("No Data Found!"));

          }else
            {
              return Column(
                children: [
                  CarouselSlider(
                      options:CarouselOptions(viewportFraction: 1,onPageChanged: (index,_)=>controller.updatePageIndicator(index)),
                      items:  controller.banners.map((banner)=>RoundedImage(imgUrl: banner.imageUrl,isNetworkImage: true,onPressed: ()=>Get.toNamed(banner.targetScreen),)).toList()
                  ),
                  SizedBox(height: CustomSizes.spaceBetweenItems.h,),
                  Center(
                    child: Obx(
                          ()=> Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for(int i=0;i<controller.banners.length;i++)

                            CircularContainerShapeWidget(
                              width: 20.w,
                              height: 4.h,
                              margin: const EdgeInsets.only(right: CustomSizes.fontSizeSm),
                              backgroundColor:controller.carousalCurrentIndex.value==i ?  CustomColors.primary:CustomColors.grey,
                            )
                        ],
                      ),
                    ),
                  )

                ],
              );
            }
        },
    );
  }
}
