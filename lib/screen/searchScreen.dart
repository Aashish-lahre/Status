import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status/widget/post.dart';
import 'package:status/widget/searchFriends.dart';
import 'package:status/widget/userProfileMinimised.dart';

import '../provider/users.dart';

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
    final getUsers = Provider.of<UserProvider>(context).myRecommends;

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
                  child: FutureBuilder(
                      future: getUsers(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text('has Error'),
                          );
                        } else if (!snapshot.hasData) {
                          print('has data : ${snapshot.hasData}');
                          return const Center(
                              child: Text('No Users to Display'));
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return UserProfileMinimised(
                                    snapshot.data![index]);
                              });
                        }
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
