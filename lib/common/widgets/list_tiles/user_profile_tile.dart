
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_Image.dart';
import '../shimmers/shimmer.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, this.onPressed,
  });

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return ListTile(
      leading:    Obx( (){
        final networkImage=controller.user.value.profilePicture;
        final image=networkImage.isEmpty ? CustomImageStrings.user:networkImage;

        return controller.imageUploading.value
            ? CustomShimmerEffect(width: 55.w, height: 55.w,radius: 55.r,)
            :CircularImage(image: image,width: 55.w,height: 55.h,isNetworkImage: networkImage.isNotEmpty,);

      }),
      title: Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: CustomColors.white),),
      subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: CustomColors.white),),
      trailing: IconButton(onPressed: onPressed,icon: const Icon(Iconsax.edit,color: CustomColors.white,),),
    );
  }
}