import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status/provider/postModel.dart';
import 'package:status/provider/users.dart';
import 'package:status/widget/post.dart';

class MostLiked extends StatefulWidget {
  // const MostLiked({super.key});

  @override
  State<MostLiked> createState() => _MostLikedState();
}

class _MostLikedState extends State<MostLiked> {
  final _streamController = StreamController<List<Post>>();

  void _fetchData(Future<List<Post>> Function(int) getPosts) async {
    final posts = await getPosts(1);

    try {
      _streamController.add(posts);
    } catch (err) {
      _streamController.addError(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fetchPosts = Provider.of<UserProvider>(context).fetchPostFromUser;
    _fetchData(fetchPosts);
    return StreamBuilder(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('has Error'),
          );
        } else if (!snapshot.hasData) {
          print('has data : ${snapshot.hasData}');
          return const Center(child: Text('No Posts to Display'));
        } else {
          final List<Post> _posts = snapshot.data!;
          // print('posts1 : ${_posts.length}');
          if (_posts.isEmpty) {
            return const Center(
              child: Text('No Posts to Display'),
            );
          }

          return ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                // print('index : $index');
                return PostContainer(_posts[index]);
              });
        }
      },
    );
  }
}
