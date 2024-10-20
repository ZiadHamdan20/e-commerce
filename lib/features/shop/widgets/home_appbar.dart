
import 'package:ecommerce_app/common/widgets/appbar/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/effects/shimmer.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/widgets/productCart/cart_counter_icon.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UserController());
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CustomTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: CustomColors.grey),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return CustomShimmerEffect(width: 80.w, height: 15.h);
              } else {
                return Text(controller.user.value.fullName, style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: CustomColors.white),);
              }
            }),
        ],
      ),
      actions:  [
        CartCounterWidget(iconColor: CustomColors.white, onPressed: () {  },)
      ],
    );
  }
}
