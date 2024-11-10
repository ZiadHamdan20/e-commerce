import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
    required this.labelText,
    required this.prefixIcon, this.suffixIcon});

  final String? labelText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {

    return  TextFormField(
      decoration: InputDecoration(prefixIcon:prefixIcon,labelText: labelText,suffixIcon:suffixIcon,labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15,fontWeight: FontWeight.w500)),
    );
  }
}
