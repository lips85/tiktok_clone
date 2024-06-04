import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

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
      height: Sizes.size48,
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
                fontSize: Sizes.size16,
                fontFamily: "Helvetica Neue medium",
                fontWeight: FontWeight.w800,
                color: white ? Colors.black : Colors.white),
          )
        ],
      ),
    );
  }
}
