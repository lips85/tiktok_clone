import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/02_tweeter/textstyle/style_guide.dart';

class TiktokHomeScreen extends StatefulWidget {
  final String text;
  const TiktokHomeScreen({super.key, required this.text});

  @override
  State<TiktokHomeScreen> createState() => _TiktokHomeScreenState();
}

class _TiktokHomeScreenState extends State<TiktokHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(20),
            Center(
              child: SvgPicture.asset(
                'assets/images/threads.svg',
                width: 34,
                height: 34,
              ),
            ),
            const Gap(20),
            const PostBasicForm(),
            const PostBasicForm(),
            const PostBasicForm(),
            const PostBasicForm(),
            const PostBasicForm(),
            const PostBasicForm(),
            const PostBasicForm(),
            const PostBasicForm(),
            const PostBasicForm(),
          ],
        ),
      ),
    );
  }
}

class PostBasicForm extends StatelessWidget {
  const PostBasicForm({
    super.key,
  });

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
                      const Column(
                        children: [
                          Icon(
                            Icons.circle_notifications_outlined,
                            size: 40,
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 3,
                              child: ColoredBox(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Gap(5),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "pubity",
                                        style: StyleGuide.threadTitleStyle(),
                                      ),
                                      const Gap(10),
                                      const Icon(
                                        Icons.access_time_filled_sharp,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        "2m",
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
                                "Vine after seeing the Threads logo unveiled",
                                style: StyleGuide.threadBodyStyle(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.asset(
                                    "assets/images/widthfull.jpg",
                                    fit: BoxFit.fill,
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
