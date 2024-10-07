import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });
  final String price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$$price",
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.copyWith(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.copyWith(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
