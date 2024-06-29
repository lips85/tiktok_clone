import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/02_tweeter/features/activity/activity_screen_tweet.dart';
import 'package:tiktok_clone/02_tweeter/features/navbar/main_navbar_tweet.dart';
import 'package:tiktok_clone/02_tweeter/features/thread/views/thread_home_screen.dart';
import 'package:tiktok_clone/02_tweeter/features/privacy/privacy_screen_tweet.dart';
import 'package:tiktok_clone/02_tweeter/features/profile/profile_tweet_screen.dart';
import 'package:tiktok_clone/02_tweeter/features/search/search_screen_tweet.dart';
import 'package:tiktok_clone/02_tweeter/features/settings/views/settings_screen_tweet.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      name: MainNavbarTweetScreen.routeName,
      path: MainNavbarTweetScreen.routeURL,
      builder: (context, state) => const MainNavbarTweetScreen(),
    ),
    GoRoute(
      name: ThreadHomeScreen.routeName,
      path: ThreadHomeScreen.routeURL,
      builder: (context, state) => const ThreadHomeScreen(),
    ),
    GoRoute(
      name: SearchScreenTweet.routeName,
      path: SearchScreenTweet.routeURL,
      builder: (context, state) => const SearchScreenTweet(),
    ),
    GoRoute(
      name: ActivityScreenTweet.routeName,
      path: ActivityScreenTweet.routeURL,
      builder: (context, state) => const ActivityScreenTweet(),
    ),
    GoRoute(
      name: ProfileTweetScreen.routeName,
      path: ProfileTweetScreen.routeURL,
      builder: (context, state) => const ProfileTweetScreen(),
    ),
    GoRoute(
      name: SettingsScreenTweet.routeName,
      path: SettingsScreenTweet.routeURL,
      builder: (context, state) => const SettingsScreenTweet(),
    ),
    GoRoute(
      name: PrivacyScreenTweet.routeName,
      path: PrivacyScreenTweet.routeUrl,
      builder: (context, state) => const PrivacyScreenTweet(),
    ),
  ],
);
