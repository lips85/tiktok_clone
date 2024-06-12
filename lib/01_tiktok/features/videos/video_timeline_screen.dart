import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Container(
          color: Colors.red,
          child: const Center(
            child: Text("Video Timeline"),
          ),
        ),
        Container(
          color: Colors.blue,
          child: const Center(
            child: Text("Following"),
          ),
        ),
        Container(
          color: Colors.green,
          child: const Center(
            child: Text("For You"),
          ),
        ),
      ],
    );
  }
}
