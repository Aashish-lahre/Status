import 'dart:math';

import 'package:flutter/material.dart';
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
      child: Scaffold(),
    );
  }
}
