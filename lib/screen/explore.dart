import 'package:flutter/material.dart';
import 'package:status/screen/addFriends.dart';
import 'package:status/widget/mostFollowed.dart';
import 'package:status/widget/mostLiked.dart';
import 'package:status/widget/post.dart';

class Explore extends StatefulWidget {
  // const Explore({super.key});
  final double appBarHeight;

  Explore(this.appBarHeight);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  Widget widgetIconTab(Icon icon) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF474E68),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(padding: const EdgeInsets.all(0.0), child: icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    // widget.maxHeight = widget.maxHeight - widget.maxHeight * 0.07;
    double maxHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        widget.appBarHeight;
    maxHeight = maxHeight - maxHeight * 0.1;
    final double maxWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: maxHeight * 0.1,
            child: TabBar(tabs: [
              Icon(Icons.favorite),
              Icon(Icons.person_add),
              Icon(Icons.people_alt),
            ]),
          ),
          Container(
            height: maxHeight * 0.898,
            color: Colors.amber.shade100,
            child: TabBarView(
                // viewportFraction: ,
                children: [
                  MostLiked(),
                  AddFriends(widget.appBarHeight),
                  MostFollowed()
                ]),
          )
        ],
      ),
    );
  }
}
