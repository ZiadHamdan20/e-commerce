import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class CustomSignupTitle extends StatelessWidget {
  const CustomSignupTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(
      CustomTexts.signupTitle,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
