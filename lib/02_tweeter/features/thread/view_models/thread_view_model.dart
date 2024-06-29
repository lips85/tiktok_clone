import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/02_tweeter/features/thread/models/thread_model.dart';
import 'package:tiktok_clone/02_tweeter/features/thread/utils/fake_data_generater.dart';

class ThreadViewModel extends AsyncNotifier<List<ThreadModel>> {
  final List<ThreadModel> _threads = generatePosts()
      .map(
        (post) => ThreadModel(
          title: "Sample Title",
          userName: post['userName'],
          postText: post['postText'],
          postTime: post['postTime'],
          postImages: List<String>.from(post['postImages']),
          repNum: post['repNum'],
          likeNum: post['likeNum'],
          userIcon: post['userIcon'],
          avator1: post['avator1'],
          avator2: post['avator2'],
          avator3: post['avator3'],
        ),
      )
      .toList();

  @override
  FutureOr<List<ThreadModel>> build() async {
    await Future.delayed(const Duration(seconds: 1));
    return _threads;
  }
}

final threadProvider =
    AsyncNotifierProvider<ThreadViewModel, List<ThreadModel>>(
  () => ThreadViewModel(),
);
