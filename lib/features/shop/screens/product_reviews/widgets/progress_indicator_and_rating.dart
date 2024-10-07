

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/custom_device_utils.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex:1,
                child: Text(text,style: Theme.of(context).textTheme.bodyMedium,)),
            Expanded(
              flex: 11,
              child: SizedBox(
                width: CustomDeviceUtils.getScreenWidth(context).w*0.8,
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 11.h,
                  backgroundColor: Colors.grey,
                  valueColor: const AlwaysStoppedAnimation(CustomColors.primary),
                  borderRadius: BorderRadius.circular(7.r),
                ),
              ),
            )


          ],
        )
      ],
    );
  }
}
