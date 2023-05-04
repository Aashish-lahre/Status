import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status/provider/users.dart';
import 'package:status/screen/searchScreen.dart';
import 'package:status/widget/userProfileMinimised.dart';
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

    // final updateDatabase = Provider.of<UserProvider>(context).updateDatabase;
    final getUsers = Provider.of<UserProvider>(context).myRecommends;

    // updateDatabase();
    // getUsers();

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
                child: FutureBuilder(
                    future: getUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text('has Error'),
                        );
                      } else if (!snapshot.hasData) {
                        print('has data : ${snapshot.hasData}');
                        return const Center(child: Text('No Users to Display'));
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
        ));
  }
}
