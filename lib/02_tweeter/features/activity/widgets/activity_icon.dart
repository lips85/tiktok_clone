import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivityIcon extends StatelessWidget {
  final String type;
  const ActivityIcon({
    super.key,
    required this.type,
  });

  Color _iconTypeColor(String type) {
    switch (type) {
      case "Mentions":
        return Colors.green;
      case "Replies":
        return Colors.blueAccent;
      case "Likes":
        return Colors.red;
      case "Follows":
        return Colors.purple;
      default:
        return Colors.black;
    }
  }

  IconData _iconType(String type) {
    switch (type) {
      case "Mentions":
        return FontAwesomeIcons.threads;
      case "Replies":
        return FontAwesomeIcons.reply;
      case "Likes":
        return FontAwesomeIcons.solidHeart;
      case "Follows":
        return FontAwesomeIcons.person;
      default:
        return FontAwesomeIcons.question;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _iconTypeColor(type),
        border: const Border.fromBorderSide(
          BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
      child: FaIcon(
        _iconType(type),
        size: 12,
        color: Colors.white,
      ),
    );
  }
}
