import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/02_tweeter/features/navbar/widgets/image_viewer.dart';
import 'package:tiktok_clone/02_tweeter/textstyle/style_guide.dart';

class PostBasicForm extends StatefulWidget {
  final String userIcon;
  final String userName;
  final String postText;
  final String postTime;
  final bool isImageUse;
  final List<String> postImages;
  final int repNum, likeNum;

  final String avator1, avator2, avator3;

  const PostBasicForm({
    super.key,
    required this.postImages,
    required this.userIcon,
    required this.userName,
    required this.postText,
    required this.postTime,
    required this.isImageUse,
    required this.repNum,
    required this.likeNum,
    required this.avator1,
    required this.avator2,
    required this.avator3,
  });

  @override
  State<PostBasicForm> createState() => _PostBasicFormState();
}

class _PostBasicFormState extends State<PostBasicForm> {
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
                                  widget.userIcon,
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
                          Expanded(
                            child: SizedBox(
                              width: 3,
                              child: ColoredBox(
                                color: Colors.grey.shade300,
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
                                        widget.userName,
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
                                        widget.postTime,
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
                                widget.postText,
                                style: StyleGuide.threadBodyStyle(),
                              ),
                              if (widget.isImageUse)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        if (widget.isImageUse)
                                          for (var i = 0;
                                              i < widget.postImages.length;
                                              i++)
                                            TweetImageViewer(
                                                assetPath:
                                                    widget.postImages[i]),
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
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 10,
                          child: CircleAvatar(
                            backgroundColor: null,
                            radius: 7,
                            backgroundImage: NetworkImage(
                              widget.avator1,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: CircleAvatar(
                            backgroundColor: null,
                            radius: 10,
                            backgroundImage: NetworkImage(
                              widget.avator2,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 0,
                          child: CircleAvatar(
                            backgroundColor: null,
                            radius: 7,
                            backgroundImage: NetworkImage(
                              widget.avator3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            "${widget.repNum} relies ",
                            style: StyleGuide.threadRepliesLikeStyle(),
                          ),
                          Text(
                            "• ${widget.likeNum} likes",
                            style: StyleGuide.threadRepliesLikeStyle(),
                          ),
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
