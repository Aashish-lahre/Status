import 'package:flutter/material.dart';

class PostModel {
  final int userId;
  final int postId;
  String? text;
  Image? image;
  String? audio;
  String? video;

  PostModel({
    required this.userId,
    required this.postId,
    this.text,
    this.image,
    this.audio,
    this.video,
  });
}
