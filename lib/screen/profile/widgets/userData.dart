import 'package:flutter/material.dart';

import '../../../provider/users.dart';

class UserData extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final User user;
  UserData(
      {required this.maxWidth, required this.maxHeight, required this.user});

  @override
  Widget build(BuildContext context) {
    String relationshipStatus(RelationshipStatus userStatus) {
      RelationshipStatus status = userStatus;
      switch (status) {
        case RelationshipStatus.single:
          return 'Single';
        case RelationshipStatus.taken:
          return 'Taken';
        default:
          return 'UnKonwn';
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 151, 169, 167).withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      width: maxWidth * 0.9,
      height: maxHeight * 0.37,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(),
          Text(user.name),
          Text(relationshipStatus(user.relationshipStatus)),
          Text(user.bio),
          Text(user.location),
        ],
      ),
    );
  }
}
