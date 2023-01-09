import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/ApiResponse.dart';
import 'package:shop_app/services/user_service.dart';

import '../home/home_screen.dart';
import '../profile/user_info_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../splash/splash_screen.dart';
import '../../../models/User.dart' as usr;



class Authentication {

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<FirebaseApp> initializeFirebase({
    required BuildContext context,
  }) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    // User? user = FirebaseAuth.instance.currentUser;
    _loadUserInfo(context);

    // if (user != null) {
    //   Navigator.pushNamed(context,HomeScreen.routeName);
    // }

    return firebaseApp;
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
        await auth.signInWithPopup(authProvider);

        user = userCredential.user;

        List<String>? username = user?.displayName?.split(' ');
        ApiResponse response = await userGoogleSign(user?.email, username?[0], username?[1] );
        _saveUser(response.data as usr.User);
        if(response.error == null){
          Navigator.pushNamed(context,HomeScreen.routeName);
        }
        
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
          await auth.signInWithCredential(credential);

          user = userCredential.user;

          List<String>? username = user?.displayName?.split(' ');
          ApiResponse response = await userGoogleSign(user?.email, username?[0], username?[1] );
          _saveUser(response.data as usr.User);
          if(response.error == null){
            Navigator.pushNamed(context,HomeScreen.routeName);
          }


        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              Authentication.customSnackBar(
                content:
                'The account already exists with a different credential',
              ),
            );
          } else if (e.code == 'invalid-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              Authentication.customSnackBar(
                content:
                'Error occurred while accessing credentials. Try again.',
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'Error occurred using Google Sign In. Try again.',
            ),
          );
        }
      }
    }

    return user;
  }

  static getUser() {
    if (FirebaseAuth.instance.currentUser != null) {
      return FirebaseAuth.instance.currentUser;
    }
  }


  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }
}

void _loadUserInfo(BuildContext contxt) async {
  String token = await getToken();
  if (token != '') {
    ApiResponse response = await getUserInfo();
    if (response.error == null ){
      Navigator.pushNamed(contxt,HomeScreen.routeName);
    }
  }
}


void _saveUser (usr.User user) async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString('token', user.token ?? '');
  await pref.setInt('userId', user.id ?? 0 );
}