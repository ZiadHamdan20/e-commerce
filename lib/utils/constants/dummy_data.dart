import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/routs/pages_names.dart';

import '../../features/shop/models/banner_model.dart';

class CustomDummyData {
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: CustomImageStrings.banner2, targetScreen: PagesNames.orderScreen, active: false),
    BannerModel(
        imageUrl: CustomImageStrings.banner3, targetScreen: PagesNames.cartScreen, active: true),
    // BannerModel(
    //     imageUrl: CustomImageStrings.banner3,
    //     targetScreen: PagesNames.favourates,
    //     active: true),


    // BannerModel(
    //     imageUrl: CustomImageStrings.banner6, targetScreen: PagesNames.searchScreen, active: true),
    //
    //
    BannerModel(
        imageUrl: CustomImageStrings.banner7, targetScreen: PagesNames.settingsScreen, active: true),
    BannerModel(
        imageUrl: CustomImageStrings.banner8,
        targetScreen: PagesNames.userAddressScreen,
        active: true),

  ];
}
