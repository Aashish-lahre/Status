import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:curved_container/curved_container.dart';
import 'package:rive/rive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 134, 132, 123),
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
          Expanded(
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  width: maxWidth,
                  height: maxHeight * 0.55,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.shade100,
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
