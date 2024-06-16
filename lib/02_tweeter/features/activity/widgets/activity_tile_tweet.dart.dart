import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/02_tweeter/textstyle/style_guide.dart';
import 'package:tiktok_clone/constants/github_avatar.dart';

class ActivityTileTweet extends StatelessWidget {
  final String nickName, name, numOfFollower;
  final String avatar;
  final String? followAvatar;

  const ActivityTileTweet({
    super.key,
    required this.nickName,
    required this.name,
    required this.numOfFollower,
    required this.avatar,
    this.followAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          isThreeLine: true,
          dense: true,
          leading: Container(
            clipBehavior: Clip.hardEdge,
            width: 40,
            height: 40,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: const NetworkImage(githubAvatar),
              image: NetworkImage(avatar),
            ),
          ),
          title: Row(
            children: [
              Text(
                nickName,
                style: StyleGuide.listTileTitle(),
              ),
              const Gap(5),
              SvgPicture.asset("./assets/images/Twitter_Verified_Badge.svg"),
            ],
          ),
          subtitle: Text(
            name,
            style: StyleGuide.listTileSub(),
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade400, width: 1),
            ),
            child: Text(
              "Follow",
              style: StyleGuide.listTileTitle(),
            ),
          ),
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
                  Row(
                    children: [
                      if (followAvatar != null && followAvatar!.isNotEmpty)
                        Container(
                          clipBehavior: Clip.hardEdge,
                          width: 20,
                          height: 20,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: const NetworkImage(githubAvatar),
                            image: NetworkImage(followAvatar!),
                          ),
                        ),
                      Text(
                        " ${numOfFollower}K followers",
                        style: StyleGuide.listTileFollower(),
                      ),
                    ],
                  ),
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
