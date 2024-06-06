import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

import 'package:tiktok_clone/02_tweeter/features/authentication/tweet_create_account.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/constants/textstyle/style_guide.dart';

class ConfirmationCodeScreenTweet extends StatefulWidget {
  const ConfirmationCodeScreenTweet({super.key});

  @override
  State<ConfirmationCodeScreenTweet> createState() =>
      _ConfirmationCodeScreenTweetState();
}

class _ConfirmationCodeScreenTweetState
    extends State<ConfirmationCodeScreenTweet> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  bool _isCodeComplete = false;

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onCreateUserTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const TweetCreateAccount(),
    ));
  }

  void _checkCodeComplete() {
    setState(() {
      _isCodeComplete =
          _controllers.every((controller) => controller.text.isNotEmpty);
    });
  }

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
            bottom: 40,
            top: 20,
          ),
          child: FractionallySizedBox(
            widthFactor: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We sent you a code",
                  style: StyleGuide.titleStyle(),
                ),
                Gaps.v16,
                Text(
                  "Enter it below to verify",
                  style: StyleGuide.explainStyle(),
                ),
                Text(
                  "jhon.mobbin@gamil.com",
                  style: StyleGuide.explainStyle(),
                ),
                Gaps.v16,
                OTPInput(
                  controllers: _controllers,
                  focusNodes: _focusNodes,
                  onChanged: _checkCodeComplete,
                ),
                if (_isCodeComplete)
                  const Center(
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 40.0,
                    ),
                  ),
                Gaps.v16,
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Didn't receive email?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => _onCreateUserTap(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey, // 버튼 색상
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: Text(
                    'Next',
                    style: StyleGuide.buttonTextStyle(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OTPInput extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final VoidCallback onChanged;

  const OTPInput({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return Flexible(
          flex: 1,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2.0,
                  color:
                      focusNodes[index].hasFocus ? Colors.black : Colors.grey,
                ),
              ),
            ),
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1), // 입력 길이를 1자로 제한
                FilteringTextInputFormatter.digitsOnly, // 숫자만 입력 가능
              ],
              onChanged: (value) {
                if (value.isNotEmpty && index < 5) {
                  FocusScope.of(context).nextFocus();
                }
                onChanged();
              },
            ),
          ),
        );
      }),
    );
  }
}
