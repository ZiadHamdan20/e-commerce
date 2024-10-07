import 'package:ecommerce_app/features/personalization/screens/settings/settings.dart';
import 'package:get/get.dart';

import '../screens/home/home_screen.dart';
import '../screens/store/store.dart';
import '../screens/wishlist/wishlist.dart';

class NavigationMenuController extends GetxController
{
final Rx<int>selectedIndex=0.obs;
final  screens=[
  const HomeScreen(),
  const StoreScreen(),
  const WishlistScreen(),
  const SettingsScreen(),


];
}