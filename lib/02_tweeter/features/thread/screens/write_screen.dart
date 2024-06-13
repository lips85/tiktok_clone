import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/02_tweeter/textstyle/style_guide.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  void _onPressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.9,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Stack(
            children: [
              const Center(
                child: Text(
                  "New Thread",
                ),
              ),
              GestureDetector(
                onTap: _onPressed,
                child: const Text(
                  "Cancle",
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const Divider(),
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
                            const CircleAvatar(
                              backgroundColor: null,
                              radius: 20,
                              backgroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/88703915",
                              ),
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
                            const Gap(5),
                            const Opacity(
                              opacity: 0.5,
                              child: CircleAvatar(
                                backgroundColor: null,
                                radius: 13,
                                backgroundImage: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/88703915",
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
                                    Text(
                                      "hary_maybe",
                                      style: StyleGuide.threadTitleStyle(),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TextField(
                                    expands: true,
                                    minLines: null,
                                    maxLines: null,
                                    cursorColor: Colors.blue,
                                    scrollPadding: const EdgeInsets.symmetric(
                                        vertical: 96),
                                    decoration: InputDecoration(
                                      hintText: "Start a thread...",
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade400,
                                      ),
                                      border: const UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(6),
                                const Icon(
                                  FontAwesomeIcons.paperclip,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const Gap(40),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '   Anyone can reply',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                ),
                const Opacity(
                  opacity: 0.7,
                  child: Text(
                    "POST  ",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}
