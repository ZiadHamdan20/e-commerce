
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_Image.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, this.onTap,
  });

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const CircularImage(
        image: CustomImageStrings.user,
        width:50 ,
        height: 50,
        padding: 0,
      ),
      title: Text("Ziad Hamdan",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: CustomColors.white),),
      subtitle: Text("Ziadhamdan99.it@gmail.com",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: CustomColors.white),),
      trailing: IconButton(onPressed: (){},icon: const Icon(Iconsax.edit,color: CustomColors.white,),),
    );
  }
}