import 'dart:math';

import 'package:flutter/material.dart';
import 'package:status/screen/profile/widgets/sliverTabs.dart';
import 'package:status/screen/profile/widgets/userData.dart';
import 'package:status/widget/post.dart';

import '../../provider/users.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static const routeName = '/profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top -
        AppBar().preferredSize.height;
    final double maxWidth = MediaQuery.of(context).size.width;

    final argument = ModalRoute.of(context)!.settings.arguments as Map;
    final user = argument['user'] as User;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  leadingWidth: double.infinity,
                  leading: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      child: Row(children: const [
                        Icon(Icons.arrow_back_ios_sharp),
                        Text(
                          'Back',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )
                      ]),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: maxHeight * 0.4,
                    child: const Placeholder(),
                  ),
                ),
                SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverTabs(Container(
                      color: Colors.cyan.shade100,
                      height: 50,
                      child: const TabBar(tabs: [
                        Text(
                          'Posts',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          'Replies',
                          style: TextStyle(color: Colors.black),
                        ),
                      ]),
                    ))),
              ];
            },
            body: TabBarView(children: [
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (ctx, index) {
                    return Text('Ashish lahre');
                  }),
              ListView.builder(
                  itemCount: 7,
                  itemBuilder: (ctsx, index) {
                    return Text('Lahre Ashish');
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
