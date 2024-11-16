import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class CustomUploadDataListTile extends StatelessWidget {
  const CustomUploadDataListTile({super.key, required this.leadingIcon, required this.trailing,
    required this.onPressed, required this.title, });

  final IconData leadingIcon;
  final IconData trailing;
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Icon(leadingIcon,size: 28.sp,color: CustomColors.primary,),
      title: Text(title,style: Theme.of(context).textTheme.titleMedium,),
      trailing: IconButton(onPressed: onPressed,icon: const Icon(Iconsax.arrow_circle_up,color: CustomColors.primary,),),



    );
  }
}
