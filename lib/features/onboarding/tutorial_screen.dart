import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: const SafeArea(
          child: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    Text(
                      "Watch cool videos",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v20,
                    Text(
                      "Videos are shown to you based on your interests. The more you interact with the app, the better the recommendations will be.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    Text(
                      "Watch cool videos",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v20,
                    Text(
                      "Videos are shown to you based on your interests. The more you interact with the app, the better the recommendations will be.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    Text(
                      "Watch cool videos",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v20,
                    Text(
                      "Videos are shown to you based on your interests. The more you interact with the app, the better the recommendations will be.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size16 + Sizes.size48,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelector(
                  color: Colors.white,
                  selectedColor: Colors.black38,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
