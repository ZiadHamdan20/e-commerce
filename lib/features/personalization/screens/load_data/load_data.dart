import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appBar/custom_app_bar.dart';
import '../../../../common/widgets/list_tiles/upload_data_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header

            CustomAppBar(
              title: Text(CustomTexts.uploadData,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:CustomColors.black ),),
              showBackArrow: true,),

            Padding(
              padding: const EdgeInsets.all(CustomSizes.defaultSpace),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const CustomSectionHeading(headTitle: CustomTexts.mainRecord,showActionButton: false,),
                  SizedBox(height: CustomSizes.spaceBetweenItems.h,),

                  CustomUploadDataListTile(
                    leadingIcon: Iconsax.category,
                    trailing: Icons.upload,
                    onPressed: (){}, title: 'Upload Categories',
                  ),

                  CustomUploadDataListTile(
                    leadingIcon: Iconsax.house,
                    trailing: Icons.upload,
                    onPressed: (){}, title: 'Upload Brands',
                  ),

                  CustomUploadDataListTile(
                    leadingIcon: Iconsax.shopping_cart,
                    trailing: Icons.upload,
                    onPressed: (){}, title: 'Upload Brands',
                  ),

                  CustomUploadDataListTile(
                    leadingIcon: Iconsax.tag,
                    trailing: Icons.upload,
                    onPressed: (){}, title: 'Upload Brands',
                  ),



                  //Relationships
                  SizedBox(height: CustomSizes.spaceBetweenSections.h,),
                  const CustomSectionHeading(headTitle: "Relationships",showActionButton: false,),
                  Text("Make sure you have already uploaded all the content above.",style: Theme.of(context).textTheme.labelMedium!.copyWith(color: CustomColors.darkerGrey),),
                  SizedBox(height: CustomSizes.spaceBetweenItems.h,),


                  CustomUploadDataListTile(
                    leadingIcon: Iconsax.link,
                    trailing: Icons.upload,
                    title: 'Upload Brands & Categories Relational Data', onPressed: () {  },
                  ),
                  CustomUploadDataListTile(
                    leadingIcon: Iconsax.link,
                    trailing: Icons.upload,
                    title: 'Upload Product & Categories Relational Data', onPressed: () {  },
                  ),



                ],
              ),
            ),

            //list of settings
          ],
        ),
      ),
    );
  }
}
