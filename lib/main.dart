import 'package:flutter/material.dart';
import 'package:tiktok_clone/01_tiktok/features/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/02_tweeter/features/navbar/main_navbar_tweet.dart';

import 'package:tiktok_clone/constants/sizes.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tweets',
      theme: ThemeData(
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xff4E98E9),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xff4E98E9),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: "Helvetica Neue",
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const MainNavbarTweetScreen(),
      // home: const MainNavigationScreen(),
    );
  }
}
