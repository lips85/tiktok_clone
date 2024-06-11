import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/02_tweeter/features/navbar/widgets/image_viewer.dart';
import 'package:tiktok_clone/02_tweeter/textstyle/style_guide.dart';

class PostBasicForm extends StatelessWidget {
  final String userIcon;

  final String userName;

  final String postText;

  final String postTime;

  PostBasicForm({
    super.key,
    required this.userIcon,
    required this.userName,
    required this.postText,
    required this.postTime,
  });

  final faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: null,
                                radius: 20,
                                backgroundImage: NetworkImage(
                                  userIcon,
                                ),
                              ),
                              const Positioned(
                                right: -1,
                                bottom: -1,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 9,
                                  child: Icon(
                                    FontAwesomeIcons.circlePlus,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(5),
                          const Expanded(
                            child: SizedBox(
                              width: 2,
                              child: ColoredBox(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        userName,
                                        style: StyleGuide.threadTitleStyle(),
                                      ),
                                      const Gap(10),
                                      SvgPicture.asset(
                                        alignment: Alignment.bottomCenter,
                                        "assets/images/Twitter_Verified_Badge.svg",
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        postTime,
                                        style:
                                            StyleGuide.threadRepliesLikeStyle(),
                                      ),
                                      const Gap(10),
                                      const Icon(
                                        Icons.menu,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Gap(3),
                              Text(
                                postText,
                                style: StyleGuide.threadBodyStyle(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      const Gap(10),
                                      TweetImageViewer(
                                          assetPath: faker.image.image()),
                                    ],
                                  ),
                                ),
                              ),
                              const Gap(6),
                              const Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.heart,
                                    size: 20,
                                  ),
                                  Gap(10),
                                  Icon(
                                    FontAwesomeIcons.comment,
                                    size: 20,
                                  ),
                                  Gap(10),
                                  Icon(
                                    FontAwesomeIcons.repeat,
                                    size: 20,
                                  ),
                                  Gap(10),
                                  Icon(
                                    FontAwesomeIcons.paperPlane,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(8),
                const Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.apple,
                      size: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text("36 relies"),
                          Gap(10),
                          Icon(FontAwesomeIcons.solidCircleDot),
                          Gap(10),
                          Text("36 relies"),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Gap(10),
          const Divider()
        ],
      ),
    );
  }
}
