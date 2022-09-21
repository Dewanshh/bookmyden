import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'Booking.dart';
import 'Profile.dart';
import 'Search.dart';
import 'Home_Screen/home.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  List<Widget> build_screens() {
    FocusScope.of(context).unfocus();
    return [
      HomeScreen(),
      Search(),
      Booking(),
      Profile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navbaritems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.home),
          title: "Home",
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.search),
          title: "Search",
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.doc_plaintext),
          title: "Booking",
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.profile_circled),
          title: "Profile",
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        screens: build_screens(),
        items: _navbaritems(),
        navBarStyle: NavBarStyle.style3,
      ),
    );
  }
}
