import 'package:flutter/material.dart';

class MostFollowed extends StatefulWidget {
  const MostFollowed({super.key});

  @override
  State<MostFollowed> createState() => _MostFollowedState();
}

class _MostFollowedState extends State<MostFollowed> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple.shade300,
        ),
        child: ListView.builder(
            itemCount: 17,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(),
                        CircleAvatar(),
                        Text('Ashish lahre'),
                        Container(
                          child: Row(children: []),
                        ),
                      ]),
                ),
              );
            }),
      ),
    );
  }
}
