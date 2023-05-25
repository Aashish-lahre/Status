import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:status/provider/postModel.dart';

enum RelationshipStatus { taken, single }

class User {
  String userId;
  String name;
  String email;
  List<int> followings;
  List<int> followers;
  // int age;
  // RelationshipStatus relationshipStatus;
  // String profilePicture;
  String bio;
  // int contact;
  // String location;
  List<Post> posts;
  List<int> likes;

  User({
    required this.userId,
    required this.name,
    required this.email,
    followings,
    followers,
    // required this.age,
    // required this.relationshipStatus,
    // required this.profilePicture,
    bio,
    // required this.contact,
    // required this.location,
    posts,
    likes,
  })  : followings = [],
        likes = [],
        posts = [],
        followers = [],
        bio = '';
}

class UserProvider with ChangeNotifier {
  final List<User> _myFollowings = [];
  final fb = FirebaseDatabase.instance;
  final users = FirebaseFirestore.instance.collection('Users');
  final posts = FirebaseFirestore.instance.collection('posts');

  List<User> get myFollowings {
    return [..._myFollowings];
  }

  List<User> databaseJsonToUsers(List<Map<dynamic, dynamic>> data) {
    final List<User> users = [];
    data.forEach((element) {
      users.add(User(
        userId: element['id'],
        name: element['name'],
        email: element['email'],
      ));
    });

    return users;
  }

  List<Post> databaseJsonToPosts(List<Map<dynamic, dynamic>> data) {
    final List<Post> posts = [];

    data.forEach((element) {
      posts.add(Post(
        userId: element['userId'],
        postId: element['postId'],
        // likes: element['likes'],
        likes: element['likes'] == null
            ? []
            : List<String>.from(element['likes'].map((e) => e as String)),
        userPostId: element['userPostId'],
        text: element['text'],
      ));
    });

    // print('posts from database(users.dart) : ${posts[0].likes}');
    return posts;
  }

  Future<List<User>> myRecommends() async {
    final snapshot = await users.get();

    final documents = snapshot.docs;
    final jsonData = documents
        .map((doc) => {
              'id': doc.id,
              ...doc.data(),
            })
        .toList();

    // final encodeData = jsonEncode(snapshot);
    // const JsonDecoder decoder = JsonDecoder();

    // final data =
    //     Map<String, Map<String, dynamic>>.from(decoder.convert(encodeData));

    return databaseJsonToUsers(jsonData);
  }

  List<String> databaseJsonToUsersId(List<Map<String, String>> data) {
    final List<String> userIds = [];

    data.forEach((element) {
      userIds.add(element['id'].toString());
    });

    return userIds;
  }

  Future<List<User>> fetchUserByNameCharacter(String name) async {
    final snapshot = await users
        .orderBy('name')
        .startAt([name]).endAt(['$name\uf8ff']).get();

    final documents = snapshot.docs;
    final jsonData = documents
        .map((doc) => {
              'id': doc.id,
              ...doc.data(),
            })
        .toList();
    return databaseJsonToUsers(jsonData);
  }

  Future<void> addUser(auth.User user) async {
    final db = FirebaseFirestore.instance;
    final addUser = {
      'userId': user.uid,
      'name': user.displayName,
      'email': user.email,
    };

    // ref.child('Users').update(addUser);
    final users = db.collection('Users');

    await users.doc(user.uid).set(addUser);
    // print('doc id : ${doc.id}');
  }

  void createPost(Post post, auth.User currentUser) async {
    final currentUser = auth.FirebaseAuth.instance.currentUser!;
    // final ref = fb.ref();

    final addPost = {
      'userId': post.userId,
      'postId': post.postId,
      'userPostId': post.userPostId,
      'likes': post.likes,
      'text': post.text,
      'imageUrl': post.image,
      'audioUrl': post.audio,
      'video': post.video,
    };

    final postRef = posts.doc(post.postId);
    await postRef.set(addPost);

    notifyListeners();
  }

  Future<List<String>> firstUserIds(int length) async {
    final snapshot = await users.limit(length).get();
    final jsonData = snapshot.docs.map((e) => {'id': e.id}).toList();

    return databaseJsonToUsersId(jsonData);
  }

  Future<List<Map<String, dynamic>>> fetchPostFromUsers(int length) async {
    // fetch first length users from database

    List<Map<String, dynamic>> postsAndUsers = [];

    List<String> userIds = await firstUserIds(length);

    // query post from each users

    final snapshot = await posts.where('userId', whereIn: userIds).get();

    final jsonPostData = snapshot.docs
        .map((doc) => {
              'id': doc.id,
              ...doc.data(),
            })
        .toList();

    final List<Post> fetchedposts = databaseJsonToPosts(jsonPostData);

    if (fetchedposts.isEmpty) {
      return [];
    }
    final List<User> initialfetchedUsers =
        await fetchUserFromPosts(fetchedposts);

    final List<User> result = [];

    for (var post in fetchedposts) {
      result.add(
          initialfetchedUsers.firstWhere((user) => user.userId == post.userId));
    }

    if (result.length == fetchedposts.length) {
      // combine them

      // print('got posts and users list with same length');

      for (int i = 0; i < fetchedposts.length; i++) {
        postsAndUsers.add({'post': fetchedposts[i], 'user': result[i]});
      }

      // print('posts and users : $postsAndUsers');
    } else {
      // print('not same length');
    }
    return postsAndUsers;
  }

  List spreadUserId(List<Post> posts) {
    final post = [];
    for (var element in posts) {
      post.add(element.userId);
    }

    return post;
  }

  Future<List<User>> fetchUserFromPosts(List<Post> posts) async {
    // final snapshot =
    //     await users.where('userId', whereIn: spreadPost(posts)).get();
    final snapshot = await users
        .where(
          // FieldPath.documentId,
          'userId',
          whereIn: spreadUserId(posts),
        )
        .get();
    final jsonData = snapshot.docs
        .map((doc) => {
              'id': doc.id,
              ...doc.data(),
            })
        .toList();

    // print('jsondata---- : $jsonData');

    return databaseJsonToUsers(jsonData);
  }

  Future<List<Post>> fetchPostFromUser(String userId) async {
    final snapshot = await posts.where('userId', isEqualTo: userId).get();
    final documents = snapshot.docs;
    // print('documents : $documents');

    final jsonData = documents
        .map((doc) => {
              'id': doc.id,
              ...doc.data(),
            })
        .toList();

    return databaseJsonToPosts(jsonData);
  }

  void likePost(Post post, String currentUserId) async {
    // final ref = fb.ref('Users/user_${post.userId}/posts/post_${post.postId}');
    // final snapshot =
    //     users.doc(post.userId).collection('posts').doc(post.postId).update({
    //   'likes': FieldValue.arrayUnion([currentUserId])
    // });

    await posts.doc(post.postId).update({
      'likes': FieldValue.arrayUnion([currentUserId])
    });

    notifyListeners();
  }

  void unlikePost(Post post, String currentUserId) async {
    // final snapshot =
    //     users.doc(post.userId).collection('posts').doc(post.postId).update({
    //   'likes': FieldValue.arrayRemove([currentUserId])
    // });

    await posts.doc(post.postId).update({
      'likes': FieldValue.arrayRemove([currentUserId])
    });

    notifyListeners();
  }

  Future<User> getUser(String userId) async {
    final snapshot = await users.doc(userId).get();

    return User(
        userId: snapshot.data()!['userId'],
        name: snapshot.data()!['name'],
        email: snapshot.data()!['email']);
  }

  // addUserasFollowing
  //commentPosts
  //deleteUser
  //editProfile
  //follow
}
