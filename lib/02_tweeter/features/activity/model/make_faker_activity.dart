import 'dart:math';

import 'package:faker/faker.dart';

final types = [
  "Replies",
  "Mentions",
  "Follows",
  "Likes",
];

List<Map<String, String>> generateActivityFakeData(int count, int seed) {
  var faker = Faker.withGenerator(RandomGenerator(seed: 12345)); // 고정된 시드 설정
  List<Map<String, String>> fakeDataList = [];

  String getImage() {
    final random = Random();
    return 'https://picsum.photos/300/200?hash=${random.nextInt(10000)}';
  }

  String getType() {
    final random = Random().nextInt(4);
    return types[random];
  }

  String getDataTime() {
    final random = Random().nextInt(12);
    return random.toString();
  }

  String subTitle(String type) {
    switch (type) {
      case "Replies":
        return "replied to your tweet";
      case "Mentions":
        return "Mentioned you";
      case "Follows":
        return "Followed you";
      case "Likes":
        return "🧵👀🍀";
      default:
        return "replied to your tweet";
    }
  }

  for (var i = 0; i < count; i++) {
    var randomType = getType();
    var fakeUser = {
      'subTitle': subTitle(randomType),
      'nickName': faker.internet.userName(),
      'avatar': getImage(),
      'type': randomType,
      'dataTime': getDataTime(),
    };

    fakeDataList.add(fakeUser);
  }

  return fakeDataList;
}
