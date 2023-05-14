import 'package:flutter/material.dart';

class SliverTabs extends SliverPersistentHeaderDelegate {
  final Container _tabBar;
  SliverTabs(this._tabBar);

  @override
  double get minExtent {
    // return _tabBar.preferredSize.height;
    return 50.0;
  }

  @override
  double get maxExtent {
    // return _tabBar.preferredSize.height;
    return 50.0;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverTabs oldDelegate) {
    return false;
  }
}
