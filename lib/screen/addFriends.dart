import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        widget.appBarHeight;
    double maxWidth = MediaQuery.of(context).size.width;

    maxHeight = maxHeight - maxHeight * 0.1;

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
                    return Post();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
