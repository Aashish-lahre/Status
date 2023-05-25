import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:provider/provider.dart';
import 'package:status/provider/users.dart';
import '../provider/postModel.dart';

class PostContainer extends StatefulWidget {
  // const PostContainer({super.key});
  // final double maxWidth;
  final Post post;
  final User user;
  PostContainer(this.post, this.user);

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  late bool _isLiked;
  final auth.User currentUser = auth.FirebaseAuth.instance.currentUser!;
  Widget _interactiveElement(IconButton iconButton, int value) {
    return Row(
      children: [
        iconButton,
        SizedBox(
          width: 5,
        ),
        Text('$value'),
      ],
    );
  }

  Text _takeName(User user) {
    String name = user.name;
    if (name.length > 15) {
      name = '${name.substring(0, 16)}...';
    }
    return Text(
      name,
      style: GoogleFonts.forum(
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }

  int getLikes(Post post) {
    if (post.likes == null) {
      return 0;
    }
    return post.likes!.length;
  }

  void toggleLike(Function likePost, Function unlikePost) {
    setState(() {
      _isLiked = !_isLiked;
    });
    if (_isLiked) {
      // add currentUser email in the list of likes
      likePost(widget.post, currentUser.uid);
    } else {
      // remove the currentUser email from the list of likes.
      unlikePost(widget.post, currentUser.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.post.likes == null) {
      _isLiked = false;
    } else {
      _isLiked = widget.post.likes!.contains(currentUser.uid);
    }
    print('is liked : $_isLiked');
    print('list of users liked : ${widget.post.likes}');
    final likePost = Provider.of<UserProvider>(context).likePost;
    final unlikePost = Provider.of<UserProvider>(context).unlikePost;
    final getUser = Provider.of<UserProvider>(context).getUser;
    // final currentUser = auth.FirebaseAuth.instance.currentUser!;
    return Container(
      alignment: Alignment.topLeft,
      color: Color.fromARGB(255, 223, 172, 172),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          color: Colors.orangeAccent,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                color: Colors.blue,
                child: CircleAvatar(),
              ),
            ),
            Expanded(
              child: Container(
                // alignment: Alignment.topLeft,
                // width: double.infinity,
                color: Colors.indigoAccent.shade400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        color: Colors.cyan,
                        child: _takeName(widget.user),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        child: Text(
                          widget.post.text!,
                          style: GoogleFonts.averiaSerifLibre(
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.blueGrey,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _interactiveElement(
                                IconButton(
                                    onPressed: () {
                                      toggleLike(likePost, unlikePost);
                                    },
                                    icon: Icon(
                                      _isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                    )),
                                getLikes(widget.post)),
                            _interactiveElement(
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.comment)),
                                12),
                            _interactiveElement(
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.graphic_eq)),
                                113),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}






// Container(
//       color: Color.fromARGB(255, 148, 82, 82),
//       // width: double.infinity,
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: maxWidth * 0.1,
//             color: Colors.green,
//             child: CircleAvatar(),
//           ),
//           Container(
//             width: double.infinity,
//             color: Colors.teal,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   color: Colors.cyan,
//                   child: Text('Name'),
//                 ),
//                 Container(child: Text('dd')),
//                 Container(
//                   color: Colors.blueGrey,
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         _interactiveElement(Icons.favorite, 3),
//                         _interactiveElement(Icons.comment, 13),
//                         _interactiveElement(Icons.graphic_eq, 113),
//                       ]),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
  