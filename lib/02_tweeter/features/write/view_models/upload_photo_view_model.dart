import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/02_tweeter/features/authentication_tread/repos/authentication_repository.dart';
import 'package:tiktok_clone/02_tweeter/features/write/models/photo_model.dart';
import 'package:tiktok_clone/02_tweeter/features/write/repos/photo_repo.dart';

class UploadPhotoViewModel extends AsyncNotifier<void> {
  late final PhotoRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(photoRepo);
  }

  Future<void> uploadPhoto(File photo) async {
    final user = ref.read(authRepo).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final task = await _repository.uploadPhotoFile(
        photo,
        user!.uid,
      );
      if (task.metadata != null) {
        await _repository.savePhoto(
          PhotoModel(
            title: "RRR",
            description: "RRRR",
            fileUrl: await task.ref.getDownloadURL(),
            thumbnailUrl: "",
            creatorUid: user.uid,
            likes: 0,
            comments: 0,
            createdAt: DateTime.now().microsecondsSinceEpoch,
          ),
        );
      }
    });
  }
}
