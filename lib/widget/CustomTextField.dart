import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:provider/provider.dart';
import 'package:status/provider/postModel.dart';
import 'package:status/provider/users.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createPost = Provider.of<UserProvider>(context).createPost;
    return ConstrainedBox(
      constraints: const BoxConstraints(
        // minHeight: 40,
        maxHeight: 200,
      ),
      child: Container(
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.pink.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 130),
                child: TextField(
                  controller: myController,
                  style: TextStyle(fontSize: 18),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      hintText: 'Type...', border: InputBorder.none),
                ),
              ),
              const Divider(thickness: 2),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    const Card(
                      color: Colors.grey,
                      child: Icon(
                        Icons.format_bold,

                        // color: Colors.amber,
                      ),
                    ),
                    const Card(
                      color: Colors.grey,
                      child: Icon(Icons.format_italic),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.deepPurple.shade300,
                      child: IconButton(
                          onPressed: () {
                            createPost(Post(
                                userId: 1,
                                postId: 2,
                                userPostId: 2,
                                text: myController.text));
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.send)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
