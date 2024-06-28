import 'package:tiktok_clone/02_tweeter/features/thread/utils/make_fakerimage.dart';

List<Map<String, dynamic>> generatePosts() {
  final List<int> seeds = [2, 7, 11, 14, 17, 19];
  return seeds.map((seed) => makeFakerData(seed)).toList();
}

final List<String> postTexts = [
  "Just finished a great workout session!",
  "Loving the new features in the latest app update.",
  "Had an amazing dinner at the new restaurant downtown.",
  "Reading a fantastic book on personal development.",
  "Exploring new hiking trails this weekend.",
  "Enjoying a relaxing day at the beach.",
];

final List<String> userNames = [
  "john_doe",
  "jane_smith",
  "alex_jones",
  "emily_clark",
  "michael_brown",
  "sarah_davis",
];
