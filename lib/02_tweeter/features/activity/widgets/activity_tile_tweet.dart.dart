import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/02_tweeter/features/activity/widgets/activity_icon.dart';
import 'package:tiktok_clone/02_tweeter/textstyle/style_guide.dart';
import 'package:tiktok_clone/constants/github_avatar.dart';

class ActivityTileTweet extends StatelessWidget {
  final String nickName, subTitle, dataTime, avatar, type;

  const ActivityTileTweet({
    super.key,
    required this.nickName,
    required this.subTitle,
    required this.avatar,
    required this.type,
    required this.dataTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          horizontalTitleGap: 10,
          isThreeLine: true,
          dense: true,
          leading: Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                width: 50,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: FadeInImage(
                  height: 10,
                  width: 10,
                  fit: BoxFit.cover,
                  placeholder: const NetworkImage(githubAvatar),
                  image: NetworkImage(avatar),
                ),
              ),
              Positioned(
                right: 0,
                bottom: -2,
                child: ActivityIcon(type: type),
              ),
            ],
          ),
          title: Row(
            children: [
              Text(
                nickName,
                style: StyleGuide.listTileTitle(),
              ),
              const Gap(5),
              Text(
                "${dataTime}h",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          subtitle: Text(
            subTitle,
            style: StyleGuide.listTileSub(),
          ),
          trailing: type == "Follows"
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400, width: 1),
                  ),
                  child: Text(
                    "Following",
                    style: StyleGuide.listTileSub(),
                  ),
                )
              : null,
        ),
        Row(
          children: [
            const SizedBox(
              width: 70,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    thickness: 0.5,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
