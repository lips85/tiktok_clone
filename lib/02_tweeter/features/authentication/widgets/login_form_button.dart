import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class LoginFormButton extends StatelessWidget {
  final String? assetPath;
  final String text;
  final bool validate;

  const LoginFormButton({
    super.key,
    this.assetPath,
    required this.text,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: Sizes.size48,
      decoration: BoxDecoration(
        color: validate ? Colors.black : Colors.white,
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
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: Sizes.size16,
              fontFamily: "Helvetica Neue medium",
              fontWeight: FontWeight.w800,
              color: validate ? Colors.white : Colors.black,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: Sizes.size16,
                fontFamily: "Helvetica Neue medium",
                fontWeight: FontWeight.w800,
                color: validate ? Colors.white : Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
