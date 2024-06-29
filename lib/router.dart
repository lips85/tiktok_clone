import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/02_tweeter/features/activity/activity_screen_tweet.dart';
import 'package:tiktok_clone/02_tweeter/features/authentication/login_page_tweet.dart';
import 'package:tiktok_clone/02_tweeter/features/authentication/tweet_create_account.dart';
import 'package:tiktok_clone/02_tweeter/features/authentication_tread/repos/authentication_repository.dart';
import 'package:tiktok_clone/02_tweeter/features/authentication_tread/views/thread_login_page.dart';

import 'package:tiktok_clone/02_tweeter/features/navbar/main_navbar_tweet.dart';
import 'package:tiktok_clone/02_tweeter/features/thread/views/thread_home_screen.dart';
import 'package:tiktok_clone/02_tweeter/features/privacy/privacy_screen_tweet.dart';
import 'package:tiktok_clone/02_tweeter/features/profile/profile_tweet_screen.dart';
import 'package:tiktok_clone/02_tweeter/features/search/search_screen_tweet.dart';
import 'package:tiktok_clone/02_tweeter/features/settings/views/settings_screen_tweet.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.subloc != TweetCreateAccount.routeURL &&
            state.subloc != ThreadLogInPage.routeURL) {
          return "/login";
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: ThreadLogInPage.routeName,
        path: ThreadLogInPage.routeURL,
        builder: (context, state) => const ThreadLogInPage(),
      ),
      GoRoute(
        name: TweetCreateAccount.routeName,
        path: TweetCreateAccount.routeURL,
        builder: (context, state) => const TweetCreateAccount(),
      ),
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
});
