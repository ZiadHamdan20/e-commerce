import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/features/personalization/models/address_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/customShapes/rounded_container.dart';

class CustomSingleAddress extends StatelessWidget {
  const CustomSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

final AddressModel address;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {

    final controller=AddressController.instance;
    final isDarkMode = CustomHelpers.isDarkMode(context);

    return Obx(() {
      final selectedAddressId=controller.selectedAddress.value.id;
      final selectedAddress=selectedAddressId==address.id;
          return InkWell(
            onTap: onTap,
            child: CustomRoundedContainer(
              padding: const EdgeInsets.all(CustomSizes.defaultSpace),
              width: double.infinity,
              showBorder: true,
              backgroundColor: selectedAddress
                  ? CustomColors.primary.withOpacity(0.5)
                  : Colors.transparent,
              borderColor: selectedAddress
                  ? Colors.transparent
                  : isDarkMode
                      ? CustomColors.darkerGrey
                      : CustomColors.grey,
              margin: EdgeInsets.only(bottom: CustomSizes.spaceBetweenItems.h),
              child: Stack(
                children: [
                  Positioned(
                    right: 5,
                    top: 0,
                    child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                        color: selectedAddress
                            ? isDarkMode
                                ? CustomColors.light
                                : CustomColors.dark
                            : null),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: CustomSizes.sm.h / 2,
                      ),
                       Text(
                        address.formattedPhoneNo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: CustomSizes.sm.h / 2,
                      ),
                       Text(
                        address.toString(),
                        softWrap: true,
                      ),
                      SizedBox(
                        height: CustomSizes.sm.h / 2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
