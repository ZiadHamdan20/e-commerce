import 'package:ecommerce_app/features/login/widgets/custom_form_section.dart';
import 'package:ecommerce_app/features/login/widgets/custom_title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/style/CustomStyle.dart';
import '../../../common/widgets/signinLogin/custom_divider.dart';
import '../../../common/widgets/signinLogin/custom_social_btns.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const CustomTitleSection(),
              const CustomFormSection(),
              const CustomDivider(dividerText: CustomTexts.orSignInWith,),
              SizedBox(height: CustomSizes.spaceBetweenSections.h/2,),
              const CustomSocialBtns()



            ],
          ),
        ),
      ),
    );
  }
}
