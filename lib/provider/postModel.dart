import 'package:flutter/material.dart';

class Post {
  final int userId;
  final int postId;
  String? text;
  Image? image;
  String? audio;
  String? video;

  Post({
    required this.userId,
    required this.postId,
    this.text,
    this.image,
    this.audio,
    this.video,
  });
}
