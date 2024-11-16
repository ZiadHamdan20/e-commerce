import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/list_tiles/payment_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/payment_method_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: 'Paypal', image: CustomImageStrings.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(CustomSizes.lg),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const CustomSectionHeading(headTitle: 'Select Payment Method', showActionButton: false),
                      const SizedBox(height: CustomSizes.spaceBetweenSections),
                      CustomPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal', image: CustomImageStrings.paypal)),
                      SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

                      CustomPaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', image: CustomImageStrings.googlePay)),
                      SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

                      CustomPaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', image: CustomImageStrings.applePay)),
                      SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

                      CustomPaymentTile(paymentMethod: PaymentMethodModel(name: 'VISA', image: CustomImageStrings.visa)),
                      SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

                      CustomPaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card', image: CustomImageStrings.masterCard)),
                      SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

                      CustomPaymentTile(paymentMethod: PaymentMethodModel(name: 'PayTm', image: CustomImageStrings.paytm)),
                      SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

                      CustomPaymentTile(paymentMethod: PaymentMethodModel(name: 'PayStack', image: CustomImageStrings.payStack)),
                      SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

                      CustomPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: CustomImageStrings.creditCard)),
                      SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),



                    ]
                )
            )
        )
    );
  }
}

