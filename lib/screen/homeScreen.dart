import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status/screen/explore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppBar appbar = AppBar(
    title: Text('Status'),
    primary: false,
  );

  Widget _mainTextBullets(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF474E68),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // padding from top(status bar) - appbar height
    final double maxHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appbar.preferredSize.height;

    final double maxWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appbar,
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF404258),
                ),
                width: double.infinity,
                height: maxHeight * 0.07,
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true,
                  indicator: const BoxDecoration(),
                  indicatorColor: Colors.blue,

                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.amber,
                  unselectedLabelColor: Colors.white,
                  // unselectedLabelStyle: TextStyle(),

                  // indicatorColor: Colors.transparent,
                  tabs: [
                    _mainTextBullets('Explore'),
                    _mainTextBullets('Friends'),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Color(0xff474E68)),
                height: maxHeight * 0.93,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Explore(appbar.preferredSize.height),
                    Text('Friends'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
