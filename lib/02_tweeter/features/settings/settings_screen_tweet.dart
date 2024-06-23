import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/02_tweeter/features/privacy/privacy_screen_tweet.dart';

class SettingsScreenTweet extends StatefulWidget {
  const SettingsScreenTweet({super.key});

  @override
  State<SettingsScreenTweet> createState() => _SettingsScreenTweetState();
}

class _SettingsScreenTweetState extends State<SettingsScreenTweet> {
  void _onPrivacyTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PrivacyScreenTweet(),
      ),
    );
  }

  bool _loggingOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          const Divider(),
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
            ontap: _onPrivacyTap,
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
              setState(() {
                _loggingOut = true;
              });
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              ).then(
                (value) => setState(() {
                  _loggingOut = false;
                }),
              );
            },
            trailing: _loggingOut
                ? const CircularProgressIndicator.adaptive()
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}

class SettingListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final dynamic ontap;

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
