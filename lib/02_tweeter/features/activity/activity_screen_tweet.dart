import 'package:flutter/material.dart';
import 'package:tiktok_clone/02_tweeter/features/activity/model/make_faker_activity.dart';
import 'package:tiktok_clone/02_tweeter/features/activity/widgets/activity_tile_tweet.dart';
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

  List<Map<String, dynamic>> _filterDataByType(String type) {
    if (type == "All") {
      return fakerData;
    } else {
      return fakerData.where((item) => item['type'] == type).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Activity",
            style: StyleGuide.titleStyle(),
          ),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            indicatorWeight: 0,
            indicatorPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            dividerColor: Colors.white,
            tabs: [
              for (var tab in tabs)
                Tab(
                  child: FractionallySizedBox(
                    heightFactor: 1,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: SizedBox(
                        width: 100,
                        child: Center(
                          child: Text(tab),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (var tab in tabs)
              ListView.separated(
                itemCount: _filterDataByType(tab).length,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 0,
                  );
                },
                itemBuilder: (context, index) {
                  var filteredData = _filterDataByType(tab);
                  return ActivityTileTweet(
                    nickName: filteredData[index]["nickName"].toString(),
                    subTitle: filteredData[index]["subTitle"].toString(),
                    avatar: filteredData[index]["avatar"].toString(),
                    type: filteredData[index]["type"].toString(),
                    dataTime: filteredData[index]["dataTime"].toString(),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
