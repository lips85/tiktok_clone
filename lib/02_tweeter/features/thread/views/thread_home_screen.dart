import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/02_tweeter/features/navbar/widgets/post_basic_form.dart';
import 'package:tiktok_clone/02_tweeter/features/thread/view_models/thread_view_model.dart';
import 'package:tiktok_clone/utils.dart';

class ThreadHomeScreen extends ConsumerStatefulWidget {
  static String routeName = "Thread";
  static String routeURL = "/thread";

  const ThreadHomeScreen({super.key});

  @override
  ThreadHomeScreenState createState() => ThreadHomeScreenState();
}

class ThreadHomeScreenState extends ConsumerState<ThreadHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(threadProvider).when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: Text(
              'Error: $error',
              style: const TextStyle(color: Colors.red),
            ),
          ),
          data: (threads) => SafeArea(
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
                    itemCount: threads.length,
                    itemBuilder: (BuildContext context, int index) {
                      final thread = threads[index];
                      return PostBasicForm(
                        userIcon: thread.userIcon,
                        postText: thread.postText,
                        postTime: thread.postTime,
                        userName: thread.userName,
                        isImageUse: true,
                        postImages: thread.postImages,
                        repNum: thread.repNum,
                        likeNum: thread.likeNum,
                        avator1: thread.avator1,
                        avator2: thread.avator2,
                        avator3: thread.avator3,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
