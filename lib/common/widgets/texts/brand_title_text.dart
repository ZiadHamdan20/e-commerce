import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    this.color,
    required this.title,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: brandTextSize == TextSizes.small
            ? Theme.of(context).textTheme.labelMedium!.copyWith(color: color)
            : brandTextSize == TextSizes.medium
                ? Theme.of(context).textTheme.bodyLarge!.copyWith(color: color)
                : brandTextSize == TextSizes.large
                    ? Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: color,fontWeight: FontWeight.w600)
                    : Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: color));
  }
}
