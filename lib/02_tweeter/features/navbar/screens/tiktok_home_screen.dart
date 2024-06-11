library faker.example;

import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/02_tweeter/features/navbar/widgets/post_basic_form.dart';

class TiktokHomeScreen extends StatefulWidget {
  final String text;
  const TiktokHomeScreen({super.key, required this.text});

  @override
  State<TiktokHomeScreen> createState() => _TiktokHomeScreenState();
}

class _TiktokHomeScreenState extends State<TiktokHomeScreen> {
  final faker = Faker();

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
            PostBasicForm(
              userIcon: faker.image.image(keywords: ['people', 'avatar']),
              postText: faker.lorem.sentence(),
              postTime: faker.date.call().toString(),
              userName: faker.internet.userName(),
            ),
          ],
        ),
      ),
    );
  }
}
