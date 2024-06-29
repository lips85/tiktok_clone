import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tiktok_clone/utils.dart';

class ThreadLogInPage extends ConsumerStatefulWidget {
  static String routeName = "LogIn";
  static String routeURL = "/login";
  const ThreadLogInPage({super.key});

  @override
  ThreadLogInPageState createState() => ThreadLogInPageState();
}

class ThreadLogInPageState extends ConsumerState<ThreadLogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(10),
              Text(
                "English (US)",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.grey.shade700,
                    ),
              ),
              const Gap(80),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isDarkMode(ref) ? Colors.white : Colors.black,
                ),
                child: FaIcon(
                  FontAwesomeIcons.threads,
                  size: size.width * 0.14,
                  color: isDarkMode(ref) ? Colors.black : Colors.white,
                ),
              ),
              const Gap(90),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Mobile number or email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const Gap(20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
              const Gap(20),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  'Log in',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot password?',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  'Create new account',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FaIcon(
                    FontAwesomeIcons.meta,
                    size: 18,
                    color: Colors.grey.shade700,
                  ),
                  const Gap(5),
                  Text(
                    "Meta",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.grey.shade700,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
