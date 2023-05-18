import 'package:flutter/material.dart';

class Post {
  final int userId;
  final int postId;
  final int userPostId;
  String? text;
  String? image;
  String? audio;
  String? video;

  Post({
    required this.userId,
    required this.postId,
    required this.userPostId,
    this.text,
    this.image,
    this.audio,
    this.video,
  });
}
