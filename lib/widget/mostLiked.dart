import 'package:flutter/material.dart';
import 'package:status/widget/post.dart';

class MostLiked extends StatelessWidget {
  const MostLiked({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Post();
        });
  }
}
