import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:status/screen/authentication/screen/logInSignUpPage.dart';
import 'package:status/screen/homeScreen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            // bring the home screen
            print('snapshot has data : ${snapshot.hasData}');
            return HomeScreen();
          } else {
            // bring the login/register screen
            return LogInSignUpPage();
          }
        });
  }
}
