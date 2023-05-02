import 'package:flutter/material.dart';
import 'package:status/provider/postModel.dart';

enum RelationshipStatus { taken, single }

class User {
  final int id;
  String name;
  List<int> followings;
  List<int> followers;
  int age;
  RelationshipStatus relationshipStatus;
  Image profilePicture;
  String bio;
  int contact;
  String location;
  List<PostModel> posts;

  User({
    required this.id,
    required this.name,
    required List<int> followings,
    required List<int> followers,
    required this.age,
    required this.relationshipStatus,
    required this.profilePicture,
    required this.bio,
    required this.contact,
    required this.location,
    required this.posts,
  })  : followings = [],
        followers = [];
}

class UserProvider with ChangeNotifier {
  final List<User> _myFollowings = [];

  List<User> get myFollowings {
    return [..._myFollowings];
  }

  void addUser(User user) {
    // code to add user in firebase database
  }

  // List<User> fetchUsers() {
  //   // code to fetch uesrs from database
  // }

  // addUserasFollowing
  //likePosts
  //commentPosts
  //addUser
  //deleteUser
  //editProfile
  //follow
}
