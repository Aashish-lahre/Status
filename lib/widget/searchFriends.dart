import 'package:flutter/material.dart';

class SearchFriends extends StatefulWidget {
  // const SearchFriends({super.key});
  void Function(String text) callback;
  SearchFriends(this.callback);

  @override
  State<SearchFriends> createState() => _SearchFriendsState();
}

class _SearchFriendsState extends State<SearchFriends>
    with WidgetsBindingObserver {
  // focus Node deals with the focus on textField,
  // which indirectly also deals with keyBoard.
  final focusNode = FocusNode();
  bool readOnly = true;
  bool isKeyboardVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        setState(() {
          readOnly = true;
        });
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // @override
  // void didChangeMetrics() {
  //   final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
  //   if (bottomInset == 0) {
  //     print('unfocused');
  //     focusNode.unfocus();
  //   }
  // }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      isKeyboardVisible = bottomInset > 0;
      if (!isKeyboardVisible) {
        // focusNode.unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('keyboard visible : $isKeyboardVisible');
    // if (!isKeyboardVisible) {
    //   setState(() {
    //     focusNode.unfocus();
    //   });
    // }

    final maxWidth = MediaQuery.of(context).size.width;
    return Container(
      width: maxWidth * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey,
      ),
      child: TextField(
        onChanged: (value) {
          widget.callback(value);
        },
        focusNode: focusNode,
        readOnly: readOnly,
        onTap: () {
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              readOnly = false;
            });
            FocusScope.of(context).requestFocus(focusNode);
          });
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          hintText: 'Enter text here',
        ),
      ),
    );
  }
}
