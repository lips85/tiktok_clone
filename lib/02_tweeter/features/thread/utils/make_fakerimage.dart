import 'package:faker_dart/faker_dart.dart';

Map<String, dynamic> makeFakerData(int seed) {
  final faker = Faker.instance;

  String makeFakerimage(seed) {
    return faker.image.loremPicsum.image(
      width: 100,
      height: 100,
      seed: seed.toString(),
    );
  }

  final images = [
    makeFakerimage(seed),
    makeFakerimage(seed * 7),
    makeFakerimage(seed * 11),
    makeFakerimage(seed * 13),
    makeFakerimage(seed * 17),
    makeFakerimage(seed * 23),
  ];
  final post = faker.lorem.sentence();
  final user = faker.name.lastName();

  return {
    'userIcon': images[0],
    'postText': post,
    'postTime': "${seed}m",
    'userName': user,
    'postImages': [
      images[2],
      images[1],
    ],
    'repNum': seed * 3,
    'likeNum': seed * 7,
    'avator1': images[3],
    'avator2': images[4],
    'avator3': images[5],
  };
}
