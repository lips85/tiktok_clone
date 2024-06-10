import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/02_tweeter/features/navbar/screens/other_screen.dart';
import 'package:tiktok_clone/02_tweeter/features/navbar/screens/tiktok_home_screen.dart';

import 'package:tiktok_clone/02_tweeter/features/navbar/widgets/nav_tap.dart';

class MainNavbarTweetScreen extends StatefulWidget {
  const MainNavbarTweetScreen({super.key});

  @override
  State<MainNavbarTweetScreen> createState() => _MainNavbarTweetScreenState();
}

class _MainNavbarTweetScreenState extends State<MainNavbarTweetScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Record Video"),
          ),
          body: const Center(
            child: Text("Post Video"),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  final List screens = [
    "Home",
    "Search",
    "Post",
    "Favorite",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: TiktokHomeScreen(text: screens[0]),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: OtherScreen(text: screens[1]),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: OtherScreen(text: screens[2]),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: OtherScreen(text: screens[3]),
          ),
          Offstage(
              offstage: _selectedIndex != 4,
              child: OtherScreen(
                text: screens[4],
              ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTap(
              icon: FontAwesomeIcons.house,
              selectedIcon: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
            ),
            NavTap(
              icon: FontAwesomeIcons.magnifyingGlass,
              selectedIcon: FontAwesomeIcons.magnifyingGlass,
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
            ),
            NavTap(
              icon: FontAwesomeIcons.penToSquare,
              selectedIcon: FontAwesomeIcons.solidPenToSquare,
              isSelected: _selectedIndex == 2,
              onTap: () => _onTap(2),
            ),
            NavTap(
              icon: FontAwesomeIcons.heart,
              selectedIcon: FontAwesomeIcons.solidHeart,
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
            ),
            NavTap(
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
