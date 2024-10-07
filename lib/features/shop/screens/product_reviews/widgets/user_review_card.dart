
import 'package:ecommerce_app/common/widgets/customShapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/products/ratings/rating_indicator.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(CustomImageStrings.userProfileImage1),),
                SizedBox(width: CustomSizes.spaceBetweenItems.w,),
                Text("Jane Doe",style: Theme.of(context).textTheme.titleLarge,),

              ],
            ),
            IconButton(onPressed: (){},icon: const Icon(Icons.more_vert),)

          ],
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h,),

        //Review
        Row(
          children: [
            const CustomRatingBarIndicator(rating: 4),
            SizedBox(width: CustomSizes.spaceBetweenItems.w,),
            const Text("01 Aug, 2024")
          ],
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h,),

        ReadMoreText("The user interface of the app is quit intuitive. I was able to navigate and make purchases seamlessly . Great job! ",
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimExpandedText: "Show less",
        trimCollapsedText: "Show more",
          moreStyle: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: CustomColors.primary),
          lessStyle: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: CustomColors.primary),

        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h,),
        //Company review
        RoundedContainer(
          backgroundColor: isDarkMode? CustomColors.darkerGrey:CustomColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(CustomSizes.md,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ziad Store",style: Theme.of(context).textTheme.titleMedium,),
                    Text("01 Aug, 2024",style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                const SizedBox(height: CustomSizes.spaceBetweenItems,),
                ReadMoreText("The user interface of the app is quit intuitive. I was able to navigate and make purchases seamlessly . Great job! ",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: "Show less",
                  trimCollapsedText: "Show more",
                  moreStyle: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: CustomColors.primary),
                  lessStyle: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: CustomColors.primary),

                ),

              ],
            ),
          ),

        ),
        const SizedBox(height: CustomSizes.spaceBetweenSections,)

      ],

    );
  }
}
