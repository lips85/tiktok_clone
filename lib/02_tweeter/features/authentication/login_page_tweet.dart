import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.v96,
            const Text(
              "See what's happening in the world right now.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.w900,
              ),
            ),
            Gaps.v96,
            Column(
              children: [
                const LoginFormButton(
                  assetPath: 'assets/images/google.svg',
                  text: "Continue with Google",
                  white: true,
                ),
                Gaps.v20,
                const LoginFormButton(
                  assetPath: 'assets/images/apple.svg',
                  text: "Continue with Apple",
                  white: true,
                ),
                Gaps.v20,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    Gaps.h16,
                    const Text(
                      "or",
                      style: TextStyle(
                        fontSize: Sizes.size10,
                      ),
                    ),
                    Gaps.h16,
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
                Gaps.v20,
                const LoginFormButton(
                  text: "Create account",
                  white: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginFormButton extends StatelessWidget {
  final String? assetPath;
  final String text;
  final bool white;

  const LoginFormButton({
    super.key,
    this.assetPath,
    required this.text,
    required this.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        color: white ? Colors.white : Colors.black,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(Sizes.size40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (assetPath != null)
            SvgPicture.asset(
              assetPath!,
              fit: BoxFit.cover,
              width: Sizes.size24,
              height: Sizes.size24,
            ),
          if (assetPath != null) Gaps.h24,
          Text(
            text,
            style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w900,
                color: white ? Colors.black : Colors.white),
          )
        ],
      ),
    );
  }
}
