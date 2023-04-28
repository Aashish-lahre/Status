import 'package:flutter/material.dart';
import 'package:status/widget/post.dart';
import 'package:status/widget/searchFriends.dart';

class SearchScreen extends StatefulWidget {
  // const SearchScreen({super.key});

  static const routeName = './screen/searchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    AppBar _appBar = AppBar();
    double maxHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        _appBar.preferredSize.height;

    maxHeight = maxHeight - maxHeight * 0.1;
    return Scaffold(
        appBar: _appBar,
        body: Container(
          color: Colors.cyanAccent,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: maxHeight * 0.15,
                width: double.infinity,
                color: Colors.blue.shade300,
                child: SearchFriends(),
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
        ));
  }
}
