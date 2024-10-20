import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;


  ///Get Authentication User Data
  User? get authUser=>_auth.currentUser;
//called from main.dart on app launch
  @override
  void onReady() {
    //super.onReady();
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //function to show relevant screen
  screenRedirect() async {
    //get current logged in user details
    final user = _auth.currentUser;


    if (user != null) {
      //if user logged in
      if (user.emailVerified) {
        Get.offAllNamed(PagesNames.navigationMenu);
      } else {
        Get.offAllNamed(PagesNames.verifyEmailScreen,
            arguments: [_auth.currentUser?.email]);
      }
    } else {
      //local storage
      deviceStorage.writeIfNull("isFirstTime", true);
      //check if its the first time launching the app
      deviceStorage.read("isFirstTime") != true
          ? Get.offAllNamed(PagesNames
              .logInScreen) //Redirect to login screen if not the first time
          : Get.offAllNamed(PagesNames
              .onBoardingScreen); //Redirect to OnBoarding screen if its the first time
    }
  }

/*---------------------Email&password sign-in --------------------------------*/

  ///[EmailAuthentication] - Login
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[EmailAuthentication] - Register

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[EmailAuthentication] - Verification
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /// [ReAuthenticate] Re Authenticate User
  Future<void> reAuthenticateWithEmailAndPassword(String email,String password) async {
    try {
      //create a credential
      AuthCredential credential=EmailAuthProvider.credential(email: email, password: password);
      
      //ReAuthenticate
       await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  

  /// [EmailAuthentication] FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

/* ----------------------Federated identity & social sign-in ---------------------------*/

  /// [GoogleAuthentication] - GOOGLE

  Future<UserCredential?> signInWithGoogle() async {
    try {
// Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
// Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
      await userAccount?.authentication;
// Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
// Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

    /// [FacebookAuthentication] - FACEBOOK

/*----------------------------- ./end Federated identity & social sign-in -------------------------*/

    /// [LogoutUser] Valid for any authentication.
    Future<void> logout() async {
      try {
        await GoogleSignIn().signOut();
        await FirebaseAuth.instance.signOut();
        Get.offAllNamed(PagesNames.logInScreen);
      } on FirebaseAuthException catch (e) {
        throw CustomFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
        throw CustomFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw const CustomFormatException();
      } on PlatformException catch (e) {
        throw CustomPlatformException(e.code).message;
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }

    /// [DeleteUser] Remove user Auth and Firestore Account.
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  }

