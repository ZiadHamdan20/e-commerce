import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/imgTexts/vertical_img_txt.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return Padding(
      padding:
      const EdgeInsets.only(left: CustomSizes.defaultSpace),
      child: Column(
        children: [
          const SectionHeading(
            headTitle: CustomTexts.popularCategories,
            showActionBtn: false,
          ),
          SizedBox(
            height: CustomSizes.spaceBetweenItems.h,
          ),
          SizedBox(
            height: 90.h,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return VerticalImageText(
                    onTap: () {Navigator.of(context).pushNamed(PagesNames.subCategoriesScreen);},
                    image: CustomImageStrings.shoesIcon,
                    title: "Shoes",
                    textColor: null,
                    backgroundColor:isDarkMode? CustomColors.black:CustomColors.white,
                  );
                }),
          )
        ],
      ),
    );
  }
}
