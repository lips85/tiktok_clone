import 'package:flutter/material.dart';
import 'package:tiktok_clone/02_tweeter/features/activity/widgets/activity_tile_tweet.dart.dart';
import 'package:tiktok_clone/02_tweeter/textstyle/style_guide.dart';
import 'package:tiktok_clone/constants/make_faker.dart';

final tabs = [
  "All",
  "Replies",
  "Mentions",
  "Ve",
  "LIVE",
  "Shopping",
  "Brands",
];

class ActivityScreenTweet extends StatefulWidget {
  const ActivityScreenTweet({super.key});

  @override
  State<ActivityScreenTweet> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreenTweet> {
  final TextEditingController _textEditingController = TextEditingController();

  final fakerData = generateFakeData(20, 123);

  void _onSearchChanged(String value) {
    print(value);
  }

  void _onSearchSubmitted(String value) {
    print("Submitted value $value");
  }

  bool isPrime(int num) {
    if (num <= 1) return false;
    for (int i = 2; i <= num ~/ 2; i++) {
      if (num % i == 0) return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: false,
          elevation: 1,
          title: Text(
            "Activity",
            style: StyleGuide.titleStyle(),
          ),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.separated(
              itemCount: fakerData.length,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 0,
                );
              },
              itemBuilder: (context, index) => ActivityTileTweet(
                nickName: fakerData[index]["nickName"].toString(),
                name: fakerData[index]["name"].toString(),
                numOfFollower: fakerData[index]["numOfFollower"]
                    .toString()
                    .substring(0, 4),
                avatar: fakerData[index]["avatar"].toString(),
                followAvatar: isPrime(index)
                    ? fakerData[index]["followAvatar"].toString()
                    : null,
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
