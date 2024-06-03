import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          size: Sizes.size48,
          color: Color(0xff4E98E9),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text("find")],
          ),
        ),
      ),
    );
  }
}
