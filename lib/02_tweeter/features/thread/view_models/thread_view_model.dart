import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/02_tweeter/features/thread/models/thread_model.dart';

class ThreadViewModel extends AsyncNotifier<List<ThreadModel>> {
  final List<ThreadModel> _threads = [];

  @override
  FutureOr<List<ThreadModel>> build() async {
    // await Future.delayed(const Duration(seconds: 5));
    throw Exception('Failed to load threads');
    return _threads;
  }
}

final threadProvider =
    AsyncNotifierProvider<ThreadViewModel, List<ThreadModel>>(
  () => ThreadViewModel(),
);
