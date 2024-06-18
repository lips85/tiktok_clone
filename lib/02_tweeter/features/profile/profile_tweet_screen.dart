import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/02_tweeter/features/navbar/widgets/post_basic_form.dart';
import 'package:tiktok_clone/02_tweeter/features/profile/widgets/persistent_tab_bar.dart';
import 'package:tiktok_clone/02_tweeter/features/profile/widgets/profile_button.dart';
import 'package:tiktok_clone/02_tweeter/features/settings/settings_screen_tweet.dart';
import 'package:tiktok_clone/02_tweeter/textstyle/style_guide.dart';

import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/github_avatar.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ProfileTweetScreen extends StatefulWidget {
  const ProfileTweetScreen({super.key});

  @override
  State<ProfileTweetScreen> createState() => _ProfileTweetScreenState();
}

class _ProfileTweetScreenState extends State<ProfileTweetScreen> {
  void _onBarPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreenTweet(),
      ),
    );
  }

  Map<String, dynamic> _makeFakerData(int seed) {
    final faker = Faker.instance;

    String makeFakerimage(seed) {
      return faker.image.loremPicsum.image(
        width: 100,
        height: 100,
        seed: seed.toString(),
      );
    }

    final images = [
      makeFakerimage(seed),
      makeFakerimage(seed * 7),
      makeFakerimage(seed * 11),
      makeFakerimage(seed * 13),
      makeFakerimage(seed * 17),
      makeFakerimage(seed * 23),
    ];
    final post = faker.lorem.sentence();
    final user = faker.name.lastName();

    return {
      'userIcon': images[0],
      'postText': post,
      'postTime': "${seed}m",
      'userName': user,
      'postImages': [
        images[2],
        images[1],
      ],
      'repNum': seed * 3,
      'likeNum': seed * 7,
      'avator1': images[3],
      'avator2': images[4],
      'avator3': images[5],
    };
  }

  @override
  Widget build(BuildContext context) {
    final post1 = _makeFakerData(2);
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/images/reshot-icon-globe-PL5973EKAD.svg",
                    width: 25,
                  ),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.instagram,
                        size: 30,
                      ),
                      const Gap(20),
                      IconButton(
                        onPressed: _onBarPressed,
                        icon: const FaIcon(
                          FontAwesomeIcons.bars,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Jane",
                                style: StyleGuide.customeStyle(
                                  25,
                                  FontWeight.w800,
                                  Colors.black,
                                )),
                            Row(
                              children: [
                                Text(
                                  "Jane_mobbin",
                                  style: StyleGuide.profileBody(),
                                ),
                                const Gap(5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade100,
                                  ),
                                  child: Text(
                                    "threads.net",
                                    style: StyleGuide.customeStyle(
                                      14,
                                      null,
                                      Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            CircleAvatar(
                              foregroundImage: NetworkImage(githubAvatar),
                              radius: 35,
                            ),
                            Gap(10),
                          ],
                        )
                      ],
                    ),
                    const Gap(5),
                    Text(
                      "Plant enthusiast!",
                      style: StyleGuide.profileBody(),
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        const SizedBox(
                          width: 30,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              CircleAvatar(
                                foregroundImage: NetworkImage(githubAvatar),
                                radius: 10,
                              ),
                              Positioned(
                                right: 0,
                                child: CircleAvatar(
                                  foregroundImage:
                                      AssetImage("assets/images/nerd.jpg"),
                                  radius: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(10),
                        Text(
                          "2 followers",
                          style: StyleGuide.explainStyle(),
                        ),
                      ],
                    ),
                    const Gap(20),
                    const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProfileButton(
                            text: "Edit profile",
                          ),
                          ProfileButton(
                            text: "Share profile",
                          ),
                        ],
                      ),
                    ),
                    const Gap(5),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: PersistentTabBarTweet(),
              pinned: true,
            ),
            TabBarView(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) => PostBasicForm(
                    userIcon: post1['userIcon'],
                    postText: "Just finished a great workout session!",
                    postTime: post1['postTime'],
                    userName: "john_doe",
                    isImageUse: false,
                    postImages: post1['postImages'],
                    repNum: post1['repNum'],
                    likeNum: post1['likeNum'],
                    avator1: post1['avator1'],
                    avator2: post1['avator2'],
                    avator3: post1['avator3'],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
