import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:status/widget/post.dart';
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
  final _streamController = StreamController<List<User>>();

  // Acts as a initial data fetcher for stream.
  void _fetchData(Future<List<User>> Function() getUsers) async {
    try {
      final List<User> _users = await getUsers();
      _streamController.add(_users);
    } catch (error) {
      _streamController.addError(error);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final getUsers =
        Provider.of<UserProvider>(context, listen: false).myRecommends;
    _fetchData(getUsers);
  }

  @override
  Widget build(BuildContext context) {
    AppBar _appBar = AppBar();
    double maxHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        _appBar.preferredSize.height;

    maxHeight = maxHeight - maxHeight * 0.1;

    final getUsersByName =
        Provider.of<UserProvider>(context).fetchUserByNameCharacter;

    void _callBackTextInput(String text) async {
      try {
        final List<User> _users = await getUsersByName(text);
        _streamController.add(_users);
      } catch (error) {
        _streamController.addError(error);
      }
    }

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
                child: SearchFriends(_callBackTextInput),
              ),
              Expanded(
                child: Container(
                  color: Colors.greenAccent,
                  child: StreamBuilder(
                      stream: _streamController.stream,
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
                          final List<User> _users = snapshot.data!;
                          if (_users.isEmpty) {
                            return const Center(
                              child: Text('No Users to Display'),
                            );
                          }
                          return ListView.builder(
                              itemCount: _users.length,
                              itemBuilder: (context, index) {
                                return UserProfileMinimised(_users[index]);
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
