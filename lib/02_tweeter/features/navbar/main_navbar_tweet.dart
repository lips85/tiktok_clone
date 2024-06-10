import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/02_tweeter/features/navbar/stf_screen.dart';

import 'package:tiktok_clone/02_tweeter/features/navbar/widgets/nav_tap.dart';
import 'package:tiktok_clone/02_tweeter/features/navbar/widgets/post_video_button.dart';

class MainNavbarTweetScreen extends StatefulWidget {
  const MainNavbarTweetScreen({super.key});

  @override
  State<MainNavbarTweetScreen> createState() => _MainNavbarTweetScreenState();
}

class _MainNavbarTweetScreenState extends State<MainNavbarTweetScreen> {
  int _selectedIndex = 0;

  final screens = [
    StfScreen(
      key: GlobalKey(),
    ),
    StfScreen(
      key: GlobalKey(),
    ),
    Container(),
    StfScreen(
      key: GlobalKey(),
    ),
    StfScreen(
      key: GlobalKey(),
    ),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const StfScreen(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTap(
              icon: Icons.home_filled,
              selectedIcon: FontAwesomeIcons.house,
              text: "Home",
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
            ),
            NavTap(
              text: "Discover",
              icon: FontAwesomeIcons.compass,
              selectedIcon: FontAwesomeIcons.solidCompass,
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
            ),
            const Gap(24),
            GestureDetector(
              onTap: _onPostVideoButtonTap,
              child: const PostVideoButton(),
            ),
            const Gap(24),
            NavTap(
              text: "Inbox",
              icon: FontAwesomeIcons.message,
              selectedIcon: FontAwesomeIcons.solidMessage,
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
            ),
            NavTap(
              text: "Profile",
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
