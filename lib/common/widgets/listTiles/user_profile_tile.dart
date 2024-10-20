
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_Image.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, this.onPressed,
  });

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return ListTile(
      leading: const CircularImage(
        image: CustomImageStrings.user,
        width:50 ,
        height: 50,
        padding: 0,
      ),
      title: Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: CustomColors.white),),
      subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: CustomColors.white),),
      trailing: IconButton(onPressed: onPressed,icon: const Icon(Iconsax.edit,color: CustomColors.white,),),
    );
  }
}