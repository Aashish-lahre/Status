import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Post extends StatelessWidget {
  // const Post({super.key});
  // final double maxWidth;
  Post();

  Widget _interactiveElement(IconData iconData, int value) {
    return Row(
      children: [
        Icon(iconData),
        SizedBox(
          width: 5,
        ),
        Text('$value'),
      ],
    );
  }

  Text _takeName(String name) {
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

  @override
  Widget build(BuildContext context) {
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
                        child: _takeName('Ashish lahre'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        child: Text(
                          'Hello everybody this is a long post paragraph to test if i have some wierd bugs',
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
                            _interactiveElement(Icons.favorite, 3),
                            _interactiveElement(Icons.comment, 13),
                            _interactiveElement(Icons.graphic_eq, 113),
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
  