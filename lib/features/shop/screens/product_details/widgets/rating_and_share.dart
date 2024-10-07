import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //rating
        Row(
          children: [
            Icon(Iconsax.star5,color: Colors.amber,size: 24.sp,),
            SizedBox(width: CustomSizes.spaceBetweenItems.w/2,),
            Text.rich(
                TextSpan(
                    children:
                    [
                      TextSpan(text: "5.0 ",style: Theme.of(context).textTheme.bodyLarge),
                      const TextSpan(text: "(199)"),


                    ]
                )
            )
          ],),
        //share button
        IconButton(onPressed: (){}, icon: Icon(Icons.share,size: CustomSizes.iconMd.sp,))

      ],
    );
  }
}
