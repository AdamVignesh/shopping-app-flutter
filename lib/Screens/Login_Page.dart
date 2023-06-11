import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


import './Cart_Page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginState = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  signInWithGoogle();
                },
                child: Text('Sign in with Google'),
              ),

            ],
          ),
        )

    );
  }
  void navigateToHomePage() {
    Navigator.pushNamed(context, "/Home");
  }
  // Future<UserCredential> signInWithGoogle() async {
  signInWithGoogle() async {
    print("Im here da");
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    bool isUserSignedIn = await GoogleSignIn().isSignedIn();
    if (isUserSignedIn) {
      setState(() {
        loginState = true;
      });
    }
    if(loginState)
      {
        navigateToHomePage();
      }
    else {
      print('User is not signed in with Google');
    }
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}