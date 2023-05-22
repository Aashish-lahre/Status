import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:curved_container/curved_container.dart';
import 'package:rive/rive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:status/screen/authScreen.dart';
import 'package:status/screen/authentication/screen/signUp.dart';
import 'package:status/screen/authentication/widgets/fireAuth.dart';
import '../widgets/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  // final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Rive Animation
            Container(
              color: const Color.fromARGB(255, 134, 132, 123),
              width: double.infinity,
              height: maxHeight * 0.4,
              child: Row(
                children: [
                  Container(
                    color: Colors.amber,
                    width: maxWidth * 0.8,
                    height: maxHeight * 0.4,
                    child: Stack(
                      children: [
                        Positioned(
                          left: -70,
                          top: -80,
                          child: SizedBox(
                            width: maxWidth * 0.8,
                            height: maxHeight * 0.4,
                            child: const RiveAnimation.asset(
                              'assets/circleAnimationRive.riv',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue.shade200,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: maxWidth,
              // height: maxHeight * 0.55,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _emailTextController,
                      // focusNode: _focusEmail,
                      validator: (value) =>
                          Validator.validateEmail(email: value),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: _passwordTextController,
                      // focusNode: _focusPassword,
                      obscureText: true,
                      validator: (value) =>
                          Validator.validatePassword(password: value),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              User? user =
                                  await FireAuth.signInUsingEmailPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                              );
                              if (user != null) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => AuthScreen()));
                              }
                            }
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.grey[900]),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(SignUp.routeName);
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.grey[900]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
