import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/02_tweeter/features/authentication_tread/repos/authentication_repository.dart';
import 'package:tiktok_clone/02_tweeter/features/privacy/privacy_screen_tweet.dart';
import 'package:tiktok_clone/02_tweeter/features/settings/view_models/darkmode_config_vm.dart';

class SettingsScreenTweet extends ConsumerWidget {
  static String routeName = "settings";
  static String routeURL = "/settings";

  const SettingsScreenTweet({super.key});

  void privacyTap(BuildContext context) =>
      context.push(PrivacyScreenTweet.routeUrl);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          const Divider(),
          SwitchListTile.adaptive(
            value: ref.watch(darkModeConfigProvider).isDarkMode,
            onChanged: (value) =>
                ref.read(darkModeConfigProvider.notifier).setDark(value),
            secondary: ref.watch(darkModeConfigProvider).isDarkMode
                ? const Icon(FontAwesomeIcons.moon)
                : const Icon(FontAwesomeIcons.sun),
            title: ref.watch(darkModeConfigProvider).isDarkMode
                ? const Text('Dark Mode (ON)')
                : const Text('Dark Mode (OFF)'),
          ),
          SettingListTile(
            icon: Icons.person_add,
            text: "Follow and invite friends",
            ontap: () {},
          ),
          SettingListTile(
            icon: Icons.notifications,
            text: "Notifications",
            ontap: () {},
          ),
          SettingListTile(
            icon: Icons.lock,
            text: "Privacy",
            ontap: () => privacyTap(context),
          ),
          SettingListTile(
            icon: Icons.person,
            text: "Account",
            ontap: () {},
          ),
          SettingListTile(
            icon: Icons.help,
            text: "Help",
            ontap: () {},
          ),
          SettingListTile(
            icon: Icons.info,
            text: "About",
            ontap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Log out',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => context.pop(),
                      child: const Text("No"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () {
                        ref.read(authRepo).signOut();
                        context.go("/login");
                      },
                      isDestructiveAction: true,
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SettingListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? ontap;

  const SettingListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(text),
      titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      onTap: ontap,
    );
  }
}
