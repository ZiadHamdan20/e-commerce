import 'package:flutter/material.dart';

class CustomProductTitleText extends StatelessWidget {
  const CustomProductTitleText({
    super.key,
    required this.title,
     this.maxLines=2,
    this.textAlign=TextAlign.left,
     this.smallSize=false,
  });

  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final bool smallSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
