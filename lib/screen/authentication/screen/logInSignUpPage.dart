import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:status/screen/authentication/screen/logIn.dart';
import 'package:status/screen/authentication/screen/signUp.dart';

class LogInSignUpPage extends StatelessWidget {
  const LogInSignUpPage({super.key});
  static const routeName = '/log_sign_page';

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: maxHeight * 0.45,
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: maxHeight * 0.55,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 175, 55, 55),
                    borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(maxWidth, 150.0)),
                  ),
                ),
                Container(
                  height: maxHeight * 0.4,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 187, 187, 82),
                    borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(maxWidth, 150.0)),
                  ),
                ),
                Container(
                  height: maxHeight * 0.3,
                  width: double.infinity,
                  // alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 8, 2, 49),
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(maxWidth, 150.0),
                    ),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: InkWell(
                          onTap: () => Navigator.of(context)
                              .pushReplacementNamed(LoginPage.routeName),
                          child: Container(
                            alignment: Alignment.center,
                            width: maxWidth * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(SignUp.routeName),
                        child: Container(
                          width: maxWidth * 0.4,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: Color.fromARGB(255, 13, 56, 91),.
                            border: Border.all(
                                color: Colors.blue.shade900, width: 4),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
