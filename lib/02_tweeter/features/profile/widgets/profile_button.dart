import 'package:flutter/material.dart';
import 'package:tiktok_clone/utils.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  const ProfileButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color:
              isDarkMode(context) ? Colors.grey.shade700 : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: isDarkMode(context)
                  ? Colors.grey.shade300
                  : Colors.grey.shade700,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
