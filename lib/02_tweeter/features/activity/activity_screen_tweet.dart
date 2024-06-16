import 'package:flutter/material.dart';
import 'package:tiktok_clone/02_tweeter/features/activity/model/make_faker_activity.dart';
import 'package:tiktok_clone/02_tweeter/features/activity/widgets/activity_tile_tweet.dart.dart';
import 'package:tiktok_clone/02_tweeter/textstyle/style_guide.dart';

final tabs = [
  "All",
  "Replies",
  "Mentions",
  "Follows",
  "Likes",
];

class ActivityScreenTweet extends StatefulWidget {
  const ActivityScreenTweet({super.key});

  @override
  State<ActivityScreenTweet> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreenTweet> {
  final TextEditingController _textEditingController = TextEditingController();

  final fakerData = generateActivityFakeData(8, 123);

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
                subTitle: fakerData[index]["subTitle"].toString(),
                avatar: fakerData[index]["avatar"].toString(),
                type: fakerData[index]["type"].toString(),
                dataTime: fakerData[index]["dataTime"].toString(),
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
