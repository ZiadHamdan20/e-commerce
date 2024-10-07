import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/widgets/customShapes/circular_container_shape_widget.dart';
import '../../../common/widgets/images/rounded_image.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../controllers/home_controller.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key, required this.banners,
  });
  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final carouselSliderController=Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options:CarouselOptions(viewportFraction: 1,onPageChanged: (index,_)=>carouselSliderController.updatePageIndicator(index)),
          items:  banners.map((url)=>RoundedImage(imgUrl: url)).toList()
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h,),
        Obx(
    ()=> Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0;i<banners.length;i++)

                CircularContainerShapeWidget(
                  width: 20.w,
                  height: 4.h,
                  margin: const EdgeInsets.only(right: CustomSizes.fontSizeSm),
                  backgroundColor:carouselSliderController.carousalCurrentIndex.value==i ?  CustomColors.primary:CustomColors.grey,
                )
            ],
          ),
        )

      ],
    );
  }
}
