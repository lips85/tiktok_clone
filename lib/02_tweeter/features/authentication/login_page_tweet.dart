import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

import 'package:tiktok_clone/constants/sizes.dart';

class LoginPageTweet extends StatelessWidget {
  const LoginPageTweet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size28,
          color: Color(0xff4E98E9),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.v80,
            Gaps.v80,
            Expanded(
              child: Text(
                "See what's happening in the world right now.",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
