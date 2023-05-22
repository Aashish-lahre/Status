import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:status/screen/authentication/screen/logIn.dart';

import '../../authScreen.dart';
import '../widgets/fireAuth.dart';
import '../widgets/validators.dart';

class SignUp extends StatefulWidget {
  // const SignUp({super.key});
  static const routeName = '/signUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
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
                        // Positioned(
                        //   left: -70,
                        //   top: -80,
                        //   child: SizedBox(
                        //     width: maxWidth * 0.8,
                        //     height: maxHeight * 0.4,
                        //     child: const RiveAnimation.asset(
                        //       'assets/circleAnimationRive.riv',
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // )
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
                      controller: _nameTextController,
                      decoration: const InputDecoration(hintText: 'Name'),
                      // focusNode: _focusEmail,
                      validator: (value) =>
                          Validator.validateName(name: value!),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Email'),
                      controller: _emailTextController,
                      // focusNode: _focusEmail,
                      validator: (value) =>
                          Validator.validateEmail(email: value),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Password'),

                      controller: _passwordTextController,
                      // focusNode: _focusPassword,
                      obscureText: true,
                      validator: (value) =>
                          Validator.validatePassword(password: value),
                    ),
                    TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Confirm Password'),
                        controller: _confirmPasswordController,
                        // focusNode: _focusEmail,
                        validator: (value) {
                          if (_passwordTextController.text ==
                              _confirmPasswordController.text) {
                            Validator.validateEmail(email: value);
                          } else {
                            return 'Password do not Match';
                          }
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              User? user =
                                  await FireAuth.registerUsingEmailPassword(
                                name: _nameTextController.text,
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                              );
                              if (user != null) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AuthScreen()));
                              }
                            }
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.grey[900]),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginPage.routeName);
                          },
                          child: Text(
                            'Log in',
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
