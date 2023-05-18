import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
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
  String profilePicture;
  String bio;
  int contact;
  String location;
  List<Post> posts;
  List<int> likes;

  User({
    required this.id,
    required this.name,
    followings,
    followers,
    required this.age,
    required this.relationshipStatus,
    required this.profilePicture,
    required this.bio,
    required this.contact,
    required this.location,
    posts,
    likes,
  })  : followings = [],
        likes = [],
        posts = [],
        followers = [];
}

class UserProvider with ChangeNotifier {
  final List<User> _myFollowings = [];
  final fb = FirebaseDatabase.instance;

  final Map<String, Map<String, dynamic>> dummyData = {
    "user_1": {
      'id': 1,
      'name': 'Ashish lahre',
      'following': [2, 3, 4],
      'followers': [5, 6, 7],
      'age': 19,
      'relationshipStatus': 'RelationshipStatus.single',
      'profilePicture': 'location',
      'bio': 'I am a developer',
      'contact': 1234567890,
      'location': 'Bhilai',
      'posts': [],
      'likes': []
    },
    "user_2": {
      'id': 2,
      'name': 'Alex dudy',
      'following': [2, 3, 4],
      'followers': [5, 6, 7],
      'age': 19,
      'relationshipStatus': 'RelationshipStatus.single',
      'profilePicture': 'location',
      'bio': 'I am a developer',
      'contact': 1234567890,
      'location': 'Bhilai',
      'posts': [],
      'likes': []
    },
    "user_3": {
      'id': 3,
      'name': 'Alex lahre',
      'following': [2, 3, 4],
      'followers': [5, 6, 7],
      'age': 19,
      'relationshipStatus': 'RelationshipStatus.single',
      'profilePicture': 'location',
      'bio': 'I am a developer',
      'contact': 1234567890,
      'location': 'Bhilai',
      'posts': [],
      'likes': []
    },
    "user_4": {
      'id': 4,
      'name': 'Emanual',
      'following': [2, 3, 4],
      'followers': [5, 6, 7],
      'age': 19,
      'relationshipStatus': 'RelationshipStatus.single',
      'profilePicture': 'location',
      'bio': 'I am a developer',
      'contact': 1234567890,
      'location': 'Bhilai',
      'posts': [],
      'likes': []
    },
    "user_5": {
      'id': 2,
      'name': 'christine',
      'following': [2, 3, 4],
      'followers': [5, 6, 7],
      'age': 19,
      'relationshipStatus': 'RelationshipStatus.single',
      'profilePicture': 'location',
      'bio': 'I am a developer',
      'contact': 1234567890,
      'location': 'Bhilai',
      'posts': [],
      'likes': []
    },
  };

  void updateDatabase() {
    final ref = fb.ref();

    ref.child('Users').update(dummyData);
  }

  List<User> get myFollowings {
    return [..._myFollowings];
  }

  List<User> databaseJsonToUsers(Map<String, Map<String, dynamic>> data) {
    final List<User> users = [];
    data.forEach((key, value) {
      users.add(
        User(
          id: value['id'],
          name: value['name'],
          age: value['age'],
          relationshipStatus:
              value['relationshipStatus'] == 'RelationshipStatus.taken'
                  ? RelationshipStatus.taken
                  : RelationshipStatus.single,
          profilePicture: value['profilePicture'],
          bio: value['bio'],
          contact: value['contact'],
          location: value['location'],
        ),
      );
    });

    return users;
  }

  List<Post> databaseJsonToPosts(Map<String, Map<String, dynamic>> data) {
    final List<Post> posts = [];
    data.forEach((key, value) {
      posts.add(Post(
        userId: value['userId'],
        postId: value['postId'],
        userPostId: value['userPostId'],
        text: value['text'],
      ));
    });

    // print('posts from database(users.dart) : ${posts[0]}');
    return posts;
  }

  Future<List<User>> myRecommends() async {
    final ref = await fb.ref().child('Users').once();
    final snapshot = ref.snapshot.value;
    // print('snapshot : $snapshot');

    // Null check...
    if (snapshot == null) {
      return [];
    }

    final encodeData = jsonEncode(snapshot);
    const JsonDecoder decoder = JsonDecoder();

    final data =
        Map<String, Map<String, dynamic>>.from(decoder.convert(encodeData));

    return databaseJsonToUsers(data);
  }

  Future<List<User>> fetchUserByNameCharacter(String name) async {
    final ref = await fb
        .ref()
        .child('Users')
        .orderByChild('name')
        .startAt(name)
        .endAt('$name\uf8ff')
        .once();

    final snapshot = ref.snapshot.value;

    // Null check...
    if (snapshot == null) {
      return [];
    }

    final encodeData = jsonEncode(snapshot);
    const JsonDecoder decoder = JsonDecoder();

    final data =
        Map<String, Map<String, dynamic>>.from(decoder.convert(encodeData));

    return databaseJsonToUsers(data);
  }

  void addUser(User user) {
    final ref = fb.ref();
    final addUser = {
      "user_${user.id}": {
        'id': user.id,
        'name': user.name,
        'following': user.followings,
        'followers': user.followers,
        'age': user.age,
        'relationshipStatus':
            user.relationshipStatus == RelationshipStatus.single ? 0 : 1,
        'profilePicture': user.profilePicture,
        'bio': user.bio,
        'contact': user.contact,
        'location': user.location,
        'posts': user.posts,
        'likes': user.likes
      }
    };

    ref.child('Users').update(addUser);
  }

  void createPost(Post post) {
    final ref = fb.ref();
    final addPost = {
      "post_${post.postId}": {
        'userId': post.userId,
        'postId': post.postId,
        'userPostId': post.userPostId,
        'text': post.text,
        'imageUrl': post.image,
        'audioUrl': post.audio,
        'video': post.video,
      }
    };

    ref.child('Users/user_${1}/posts').update(addPost);

    notifyListeners();
  }

  Future<List<Post>> fetchPostFromUser(int userId) async {
    final ref = await fb.ref().child('Users/user_$userId/posts').once();

    final snapshot = ref.snapshot.value;

    // Null check...
    if (snapshot == null) {
      return [];
    }

    final encodeData = jsonEncode(snapshot);
    const JsonDecoder decoder = JsonDecoder();

    final data =
        Map<String, Map<String, dynamic>>.from(decoder.convert(encodeData));

    return databaseJsonToPosts(data);
  }

  // addUserasFollowing
  //likePosts
  //commentPosts
  //deleteUser
  //editProfile
  //follow
}
