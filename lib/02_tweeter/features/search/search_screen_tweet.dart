import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/02_tweeter/features/search/widgets/search_list_tile.dart';
import 'package:tiktok_clone/constants/make_faker.dart';

class SearchScreenTweet extends StatefulWidget {
  const SearchScreenTweet({super.key});

  @override
  State<SearchScreenTweet> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<SearchScreenTweet> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        title: CupertinoSearchTextField(
          controller: _textEditingController,
          placeholder: "Serch Anything",
          onChanged: _onSearchChanged,
          onSubmitted: _onSearchSubmitted,
          autocorrect: false,
        ),
      ),
      body: ListView.separated(
        itemCount: fakerData.length,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 0,
          );
        },
        itemBuilder: (context, index) => SearchListTile(
          nickName: fakerData[index]["nickName"].toString(),
          name: fakerData[index]["name"].toString(),
          numOfFollower:
              fakerData[index]["numOfFollower"].toString().substring(0, 4),
          avatar: fakerData[index]["avatar"].toString(),
          followAvatar: isPrime(index)
              ? fakerData[index]["followAvatar"].toString()
              : null,
        ),
      ),
    );
  }
}
