import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/02_tweeter/features/navbar/widgets/post_basic_form.dart';
import 'package:tiktok_clone/02_tweeter/features/thread/utils/make_fakerimage.dart';
import 'package:tiktok_clone/02_tweeter/features/thread/view_models/thread_view_model.dart';
import 'package:tiktok_clone/utils.dart';

class ThreadHomeScreen extends ConsumerStatefulWidget {
  const ThreadHomeScreen({super.key});

  @override
  ThreadHomeScreenState createState() => ThreadHomeScreenState();
}

class ThreadHomeScreenState extends ConsumerState<ThreadHomeScreen> {
  final faker2 = Faker.instance;

  @override
  Widget build(BuildContext context) {
    final post1 = makeFakerData(2);
    final post2 = makeFakerData(7);
    final post3 = makeFakerData(11);
    final post4 = makeFakerData(14);
    final post5 = makeFakerData(17);
    final post6 = makeFakerData(19);

    final List posts = [post1, post2, post3, post4, post5, post6];
    final List postTexts = [
      "Just finished a great workout session!",
      "Loving the new features in the latest app update.",
      "Had an amazing dinner at the new restaurant downtown.",
      "Reading a fantastic book on personal development.",
      "Exploring new hiking trails this weekend.",
      "Enjoying a relaxing day at the beach.",
    ];
    final List userNames = [
      "john_doe",
      "jane_smith",
      "alex_jones",
      "emily_clark",
      "michael_brown",
      "sarah_davis",
    ];

    // ref.watch(threadProvider).when(
    //       loading: () => const Center(
    //         child: CircularProgressIndicator(),
    //       ),
    //       error: () => const Center(
    //         child: Text('Error'),
    //       ),
    //       data: (threads) => ,
    //     );

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
                colorFilter: ColorFilter.mode(
                  isDarkMode(ref) ? Colors.white : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const Gap(20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return PostBasicForm(
                  userIcon: posts[index]['userIcon'],
                  postText: postTexts[index],
                  postTime: posts[index]['postTime'],
                  userName: userNames[index],
                  isImageUse: true,
                  postImages: posts[index]['postImages'],
                  repNum: posts[index]['repNum'],
                  likeNum: posts[index]['likeNum'],
                  avator1: posts[index]['avator1'],
                  avator2: posts[index]['avator2'],
                  avator3: posts[index]['avator3'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
