import 'package:ecommerce_app/bindings/general_bindings.dart';
import 'package:ecommerce_app/routs/routes.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/theme/custom_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async{

  //widget biding
  final WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();

  //init Get local storage
  await GetStorage.init();
 // await hideStatusBar();


  //await splash Screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);




  //init Firebase and auth repo
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value)=>Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(designSize: const Size(392.7, 781.1),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,

          themeMode: ThemeMode.system,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          initialBinding: GeneralBindings(),
         // getPages: AppRoutes.pages,
          //show circular indicator meanwhile auth repo is deciding which screen to show
          home: const Scaffold(backgroundColor: CustomColors.primary,
              body: Center(child: CircularProgressIndicator(color: CustomColors.white,),),),
          // home: const OnBoardingScreen(),

          onGenerateRoute: (settings) => onGenerateRoute(settings),
        );}
    );

  }
}