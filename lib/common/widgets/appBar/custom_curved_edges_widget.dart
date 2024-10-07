import 'package:flutter/material.dart';

import '../customShapes/curved_shape.dart';


class CustomCurvedEdgesWidget extends StatelessWidget {
  const CustomCurvedEdgesWidget({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return    ClipPath(
      clipper: CustomCurvedShape(),
      child: child,
    );
  }
}
