import 'package:ecommerce_app/common/widgets/appbar/custom_curved_edges_widget.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../customShapes/circular_container_shape_widget.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return  CustomCurvedEdgesWidget(
        child:    Container(
          color: CustomColors.primary,
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: [
              Positioned(
                  top: -210,
                  right: -250,
                  child: CircularContainerShapeWidget(
                    backgroundColor: CustomColors.textWhite.withOpacity(0.1),
                  )),
              Positioned(
                  top: 30,
                  right: -300,
                  child: CircularContainerShapeWidget(
                    backgroundColor: CustomColors.textWhite.withOpacity(0.1),
                  )),

              child
            ],
          ),
        )
    );
  }
}
