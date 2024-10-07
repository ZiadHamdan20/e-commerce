import 'package:ecommerce_app/common/widgets/appBar/custom_app_bar.dart';
import 'package:ecommerce_app/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:ecommerce_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //Appbar
      appBar: const CustomAppBar(title: Text("Reviews & Ratings",),showBackArrow: true,),

      //body
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Ratings and reviews are verified and are from people who use the same type of device that u use"),
            SizedBox(height: CustomSizes.spaceBetweenItems.h,),

            //overall product ratings
            const OverallProductRating(),

            const CustomRatingBarIndicator(rating: 3.8,),
            Text("12,611",style: Theme.of(context).textTheme.bodySmall,),
            SizedBox(height: CustomSizes.spaceBetweenSections.h,),


            //user reviews list
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
          ],
        ),),
      ),
    );
  }
}
