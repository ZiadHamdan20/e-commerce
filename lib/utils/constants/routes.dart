
import 'package:ecommerce_app/features/login/screens/login_screen.dart';
import 'package:ecommerce_app/features/personalization/screens/address/add_new_address.dart';
import 'package:ecommerce_app/features/personalization/screens/address/address.dart';
import 'package:ecommerce_app/features/shop/screens/brand/all_brands.dart';
import 'package:ecommerce_app/features/shop/screens/home/home_screen.dart';
import 'package:ecommerce_app/features/shop/screens/store/store.dart';
import 'package:ecommerce_app/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:ecommerce_app/features/signup/screens/signup_screen.dart';
import 'package:ecommerce_app/features/signup/screens/verify_email_screen.dart';
import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:page_transition/page_transition.dart';

import '../../common/widgets/products/sortable/sortable_products.dart';
import '../../common/widgets/successScreen/success_screen.dart';
import '../../features/password_config/screens/forget_password_screen.dart';
import '../../features/onboarding/screens/onboardingScreen.dart';
import '../../features/password_config/screens/reset_password_screen.dart';
import '../../features/personalization/screens/profile/profile.dart';
import '../../features/personalization/screens/settings/settings.dart';
import '../../features/shop/screens/all_products/all_products.dart';
import '../../features/shop/screens/all_products/brand_products.dart';
import '../../features/shop/screens/cart/cart.dart';
import '../../features/shop/screens/checkout/checkout.dart';
import '../../features/shop/screens/navigation_menu.dart';
import '../../features/shop/screens/order/order_screen.dart';
import '../../features/shop/screens/product_details/product_details.dart';
import '../../features/shop/screens/product_reviews/product_reviews.dart';

onGenerateRoute(settings) {
  final args=settings.arguments ==null ? [] : settings.arguments as List<dynamic>;
  switch (settings.name) {
    case PagesNames.onBoardingScreen:
      return
        PageTransition(
            child: const OnBoardingScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.logInScreen:
      return
        PageTransition(
            child: const LogInScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500 ),
            settings: settings

        );


    case PagesNames.signupScreen:
      return
        PageTransition(
            child: const SignupScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.verifyEmailScreen:
      return
        PageTransition(
            child:  VerifyEmailScreen(email: args[0],),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.successScreen:
      return
        PageTransition(
            child:  SuccessScreen(
              title: args[0],
              subTitle: args[1],
              image: args[2],
              onPressed: args[3],),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );


    case PagesNames.forgetPasswordScreen:
      return
        PageTransition(
            child:  const ForgetPasswordScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.resetPasswordScreen:
      return
        PageTransition(
            child:  const ResetPasswordScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.navigationMenu:
      return
        PageTransition(
            child:  const NavigationMenu(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.storeScreen:
      return
        PageTransition(
            child:  const StoreScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.homeScreen:
      return
        PageTransition(
            child:  const HomeScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.settingsScreen:
      return
        PageTransition(
            child:  const SettingsScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.profileScreen:
      return
        PageTransition(
            child:  const ProfileScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.productDetails:
      return
        PageTransition(
            child:  const ProductDetails(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.productReviewsScreen:
      return
        PageTransition(
            child:  const ProductReviewsScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.addNewAddressScreen:
      return
        PageTransition(
            child:  const AddNewAddressScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.userAddressScreen:
      return
        PageTransition(
            child:  const UserAddressScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.cartScreen:
      return
        PageTransition(
            child:  const CartScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.checkoutScreen:
      return
        PageTransition(
            child:  const CheckoutScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );


    case PagesNames.orderScreen:
      return
        PageTransition(
            child:  const OrderScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.subCategoriesScreen:
      return
        PageTransition(
            child:  const SubCategoriesScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.allProductsScreen:
      return
        PageTransition(
            child:  const AllProductsScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );

    case PagesNames.allBrandsScreen:
      return
        PageTransition(
            child:  const AllBrandsScreen(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );
    case PagesNames.customSortableProducts:
      return
        PageTransition(
            child:  const CustomSortableProducts(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );
    case PagesNames.brandProducts:
      return
        PageTransition(
            child:  const BrandProducts(),
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds:500),
            settings: settings

        );
  }
}




