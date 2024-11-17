import 'package:ecommerce_app/common/widgets/customShapes/circular_container_shape_widget.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/colors.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor=CustomHelpers.getColor(text) !=null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox(): Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? CustomColors.white : null),
        avatar: isColor  ? CircularContainerShapeWidget(width: 50.w,height: 50.h,backgroundColor: CustomHelpers.getColor(text)!,):null,
        labelPadding:isColor  ? const EdgeInsets.all(0):null,
       // selectedColor: Colors.green,


        //make icon in the center
        shape: isColor? const CircleBorder(): null,
        padding: isColor? const EdgeInsets.all(0): null,
        backgroundColor: isColor ? CustomHelpers.getColor(text)!:null,
      ),
    );
  }
}
