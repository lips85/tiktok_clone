import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  void onSignUpTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SignUpScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => onSignUpTap(context),
          child: const Text('Sign up'),
        ),
      ),
    );
  }
}
