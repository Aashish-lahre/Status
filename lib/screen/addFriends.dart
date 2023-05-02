import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:status/provider/users.dart';
import 'package:status/screen/searchScreen.dart';

import '../widget/post.dart';
import '../widget/searchFriends.dart';

class AddFriends extends StatefulWidget {
  // const AddFriends({super.key});
  final double appBarHeight;
  AddFriends(this.appBarHeight);

  @override
  State<AddFriends> createState() => _AddFriendsState();
}

class _AddFriendsState extends State<AddFriends> {
  final fb = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        widget.appBarHeight;
    double maxWidth = MediaQuery.of(context).size.width;

    maxHeight = maxHeight - maxHeight * 0.1;
    final ref = fb.ref();

    final Map<String, Map<String, dynamic>> users = {
      "user_12": {
        'id': 1,
        'name': 'Ashish lahre',
        'following': [2, 3, 4],
        'followers': [5, 6, 7],
        'age': 19,
        'relationshipStatus': 'RelationshipStatus.single',
      },

      //   'user_1': User(
      //     id: 1,
      //     name: 'Ashish lahre',
      //     followings: [2, 3, 4],
      //     followers: [5, 6, 7],
      //     age: 19,
      //     relationshipStatus: RelationshipStatus.single,
      //     profilePicture: Image.asset(''),
      //     bio: 'I am a developer',
      //     contact: 1234567890,
      //     location: 'Bhilai',
      //     posts: [],
      //   )
      // },
      // {
      //   'user_2': User(
      //     id: 2,
      //     name: 'Alexender gates',
      //     followings: [2, 3, 4],
      //     followers: [5, 6, 7],
      //     age: 19,
      //     relationshipStatus: RelationshipStatus.single,
      //     profilePicture: Image.asset(''),
      //     bio: 'I am a foreiner',
      //     contact: 1234567890,
      //     location: 'USA',
      //     posts: [],
      //   )
      // },
      // {
      //   'user_3': User(
      //     id: 3,
      //     name: 'Emanual',
      //     followings: [2, 3, 4],
      //     followers: [5, 6, 7],
      //     age: 20,
      //     relationshipStatus: RelationshipStatus.single,
      //     profilePicture: Image.asset(''),
      //     bio: 'I am a UI/UX Designer',
      //     contact: 1234567890,
      //     location: 'Bhilai',
      //     posts: [],
      //   )
    };

    return Container(
      color: Colors.cyanAccent,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: maxHeight * 0.15,
            width: double.infinity,
            color: Colors.blue.shade300,
            child: GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(SearchScreen.routeName),
              child: Container(
                width: maxWidth * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Text('Search...'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.greenAccent,
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    ref.child('Users').set(users);
                    ref.child('Users').once().then(
                          (value) => print(value.snapshot.value),
                        );
                    return Post();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
