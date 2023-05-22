import 'package:firebase_auth/firebase_auth.dart' as auth;
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:status/provider/users.dart';
import 'package:status/screen/authScreen.dart';
import 'package:status/screen/authentication/screen/logIn.dart';
import 'package:status/screen/authentication/screen/logInSignUpPage.dart';
import 'package:status/screen/authentication/screen/signUp.dart';
import 'package:status/screen/homeScreen.dart';
import 'package:status/screen/profile/profile.dart';
import 'package:status/screen/searchScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import './screen/authentication/screen/logInSignUpPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Status',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
      // child: const HomeScreen(),

      routes: {
        SearchScreen.routeName: (context) => SearchScreen(),
        LogInSignUpPage.routeName: (context) => LogInSignUpPage(),
        LoginPage.routeName: (context) => LoginPage(),
        SignUp.routeName: (context) => SignUp(),
        Profile.routeName: (context) => Profile(),
      },
    );
  }
}
