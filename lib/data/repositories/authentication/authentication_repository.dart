import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/bottom_navigation.dart';
import 'package:t_store/features/authentication/screens/login/login_page.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/verfiy_email.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final auth = FirebaseAuth.instance;

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    //redirect to appropriate screen
    screenRedirect();
  }

//function to show relevant screen
  screenRedirect() async {
    final user = auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(const BottomNavigation());
      } else {
        Get.offAll(VerifyEmailPage(email: auth.currentUser?.email));
      }
    } else {
      //local storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      //check if it is first time launch app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(const LoginPage())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  //EmailAuth for SignIn
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw IFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw IFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const IFormatException();
    } on PlatformException catch (e) {
      throw IPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  //EmailAuth for Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw IFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw IFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const IFormatException();
    } on PlatformException catch (e) {
      throw IPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

//Emailvarification for Register
  Future<void> sendEmailVerification() async {
    try {
      await auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw IFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw IFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const IFormatException();
    } on PlatformException catch (e) {
      throw IPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  //EmailAuthentication for forgot password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw IFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw IFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const IFormatException();
    } on PlatformException catch (e) {
      throw IPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  //signin using google
  Future<UserCredential?> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount =
          await GoogleSignIn().signIn(); //get user account
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication; //get user auth
      //create new credencial
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      //once signin,return the userCrdential
      return await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw IFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw IFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const IFormatException();
    } on PlatformException catch (e) {
      throw IPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('something went wrong $e');
      return null;
    }
  }

  //logoutUser=> valid for any authenticaion
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw IFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw IFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const IFormatException();
    } on PlatformException catch (e) {
      throw IPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
