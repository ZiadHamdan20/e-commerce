
import 'package:flutter/material.dart';

class CustomSectionHeading extends StatelessWidget {
  const CustomSectionHeading({
    super.key,
    this.btnTitle="View all",
    required this.headTitle,
    this.onPressed,
    this.textColor,
    this.showActionButton=true,
  });

  final String btnTitle;
  final String headTitle;
  final void Function()? onPressed;
  final Color? textColor;
  final bool showActionButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Text(headTitle,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: textColor),maxLines: 1,overflow: TextOverflow.ellipsis,),
        if(showActionButton)  TextButton(onPressed:onPressed, child: Text(btnTitle))
      ],
    );
  }
}