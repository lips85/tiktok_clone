import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TermsPageScreen extends StatefulWidget {
  const TermsPageScreen({super.key});

  @override
  State<TermsPageScreen> createState() => _TermsPageScreenState();
}

class _TermsPageScreenState extends State<TermsPageScreen> {
  bool _isSwitched = false;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v24,
            const Text(
              "Customize your",
              style: TextStyle(
                fontFamily: "Helvetica Neue hevie",
                fontSize: Sizes.size28 + Sizes.size2,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Text(
              "experience",
              style: TextStyle(
                fontFamily: "Helvetica Neue hevie",
                fontSize: Sizes.size28 + Sizes.size2,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v20,
            const Text(
              "Track where you see Twitter",
              style: TextStyle(
                fontFamily: "Helvetica Neue hevie",
                fontSize: Sizes.size16 + Sizes.size2,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Text(
              "content across the web",
              style: TextStyle(
                fontFamily: "Helvetica Neue hevie",
                fontSize: Sizes.size16 + Sizes.size2,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Twitter uses this data to",
                      style: TextStyle(
                        fontFamily: "Helvetica Neue light",
                        fontSize: Sizes.size16 + Sizes.size1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "personalize your experience. This",
                      style: TextStyle(
                        fontFamily: "Helvetica Neue light",
                        fontSize: Sizes.size16 + Sizes.size1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "web browsing history will never be",
                      style: TextStyle(
                        fontFamily: "Helvetica Neue light",
                        fontSize: Sizes.size16 + Sizes.size1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "stored with your name, email, or",
                      style: TextStyle(
                        fontFamily: "Helvetica Neue light",
                        fontSize: Sizes.size16 + Sizes.size1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "phone number.",
                      style: TextStyle(
                        fontFamily: "Helvetica Neue light",
                        fontSize: Sizes.size16 + Sizes.size1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                CupertinoSwitch(
                  value: _isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                )
              ],
            ),
            Gaps.v24,
            const Text.rich(
              TextSpan(
                text: 'By signing up, you agree to our ',
                style: TextStyle(
                  fontSize: Sizes.size14 + Sizes.size1,
                  fontFamily: "Helvetica Neue light",
                  fontWeight: FontWeight.w300,
                ),
                children: [
                  TextSpan(
                    text: 'Terms',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: ', ',
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: ', and ',
                  ),
                  TextSpan(
                    text: 'Cookie Use. ',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. ',
                  ),
                  TextSpan(
                    text: 'Learn more',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
