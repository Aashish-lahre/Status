import 'package:flutter/material.dart';

class Post {
  final String userId;
  final String postId;
  final String userPostId;
  List<String>? likes;
  String? text;
  String? image;
  String? audio;
  String? video;

  Post({
    required this.userId,
    required this.postId,
    required this.userPostId,
    this.likes,
    this.text,
    this.image,
    this.audio,
    this.video,
  });
}
