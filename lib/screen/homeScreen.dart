import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:custom_floating_action_button/custom_floating_action_button.dart';
import 'package:provider/provider.dart';
import 'package:status/provider/users.dart';
import 'package:status/screen/authentication/screen/logInSignUpPage.dart';
import 'package:status/screen/explore.dart';
import 'package:status/widget/CustomTextField.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double appbarHeight = AppBar().preferredSize.height;

  Widget _mainTextBullets(String text) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF474E68),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // padding from top(status bar) - appbar height
    final double maxHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appbarHeight;

    final double maxWidth = MediaQuery.of(context).size.width;

    // final updateDatabase = Provider.of<UserProvider>(context).updateDatabase;
    // updateDatabase();

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: CustomFloatingActionButton(
          body: Scaffold(
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () =>
            //       Navigator.of(context).pushNamed(LogInSignUpPage.routeName),
            //   child: const Icon(Icons.add),
            // ),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Status'),
              actions: [
                IconButton(
                    onPressed: () => FirebaseAuth.instance.signOut(),
                    icon: const Icon(Icons.login))
              ],
            ),
            body: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF404258),
                  ),
                  width: double.infinity,
                  height: maxHeight * 0.07,
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    isScrollable: true,
                    indicator: const BoxDecoration(),
                    indicatorColor: Colors.blue,

                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.amber,
                    unselectedLabelColor: Colors.white,
                    // unselectedLabelStyle: TextStyle(),

                    // indicatorColor: Colors.transparent,
                    tabs: [
                      _mainTextBullets('Explore'),
                      _mainTextBullets('Friends'),
                      // _mainTextBullets('auth'),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(color: Color(0xff474E68)),
                  height: maxHeight * 0.93,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Explore(appbarHeight),
                      const Text('Friends'),
                    ],
                  ),
                )
              ],
            ),
          ),
          openFloatingActionButton: const Icon(Icons.add),
          closeFloatingActionButton: const Icon(Icons.close),
          spaceFromBottom: maxHeight * 0.04,
          type: CustomFloatingActionButtonType.verticalUp,
          options: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (ctx) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: CustomTextField(),
                        );
                      });
                },
                child: const CircleAvatar(child: Icon(Icons.textsms))),
            const CircleAvatar(child: Icon(Icons.image)),
            const CircleAvatar(child: Icon(Icons.gif)),
          ],
        ),
        // options: [],
      ),
    );
  }
}
