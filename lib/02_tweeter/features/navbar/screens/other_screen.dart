import 'package:flutter/material.dart';
import 'package:tiktok_clone/02_tweeter/textstyle/style_guide.dart';

class OtherScreen extends StatelessWidget {
  final String text;
  const OtherScreen({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          text,
          style: StyleGuide.titleStyle(),
        ),
      ),
    );
  }
}
