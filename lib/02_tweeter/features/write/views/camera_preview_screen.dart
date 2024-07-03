import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';

class CameraPreviewScreen extends StatefulWidget {
  final List<XFile> photo;
  final bool isPickImage;

  const CameraPreviewScreen({
    super.key,
    required this.photo,
    required this.isPickImage,
  });

  @override
  State<CameraPreviewScreen> createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  // late final VideoPlayerController _videoPlayerController;
  late final filePath = widget.photo[0].path;
  bool _savedVideo = false;
  // Future<void> _initVideo() async {
  //   // _videoPlayerController = VideoPlayerController.file(
  //   //   File(widget.photo.path),
  //   // );

  //   // await _videoPlayerController.initialize();
  //   // await _videoPlayerController.setLooping(true);
  //   // await _videoPlayerController.play();

  //   setState(() {});
  // }

  Future<void> _saveToGallery() async {
    if (_savedVideo) return;

    await GallerySaver.saveImage(
      filePath,
      albumName: "TikTok Clone!",
    );

    _savedVideo = true;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // _initVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Preview Photo'),
        actions: [
          if (!widget.isPickImage)
            IconButton(
              onPressed: _saveToGallery,
              icon: FaIcon(
                _savedVideo
                    ? FontAwesomeIcons.check
                    : FontAwesomeIcons.download,
              ),
            ),
        ],
      ),
      // body: _videoPlayerController.value.isInitialized
      //     ? VideoPlayer(_videoPlayerController)
      //     : null,
      // body: Image.file(
      //   File(filePath),
      //   fit: BoxFit.fill,
      // ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.photo.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.file(
                      File(widget.photo[index].path),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < widget.photo.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor:
                                  i == index ? Colors.amber : Colors.grey,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
