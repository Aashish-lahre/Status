import 'package:flutter/material.dart';
import 'package:status/screen/profile/profile.dart';

import '../provider/users.dart';
// import 'package:provider/provider.dart';
// import 'package:status/provider/users.dart';

class UserProfileMinimised extends StatelessWidget {
  // const UserProfileMinimised({super.key});
  final User user;
  UserProfileMinimised(this.user);

  @override
  Widget build(BuildContext context) {
    // final users = Provider.of<UserProvider>(context).myRecommends;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(Profile.routeName, arguments: {'user': user}),
        child: Container(
          width: double.infinity,
          // height: ,
          decoration: BoxDecoration(color: Colors.amber.shade200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircleAvatar(),
              Text(
                user.name,
                style: TextStyle(fontSize: 18),
              ),
              Row(children: const [
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(radius: 10),
                ),
                CircleAvatar(
                  radius: 10,
                )
              ]),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
