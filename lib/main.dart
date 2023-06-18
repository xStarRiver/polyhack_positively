import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:positively/splash_page.dart';
import 'package:positively/utils/constants.dart';
import 'package:sizer/sizer.dart';
import 'bottom_navigation.dart';
import 'on_boarding/on_boarding_page.dart';
import 'pages/auth/sign_in_page.dart';
import 'pages/auth/sign_up_page.dart';
import 'pages/auth/verification_page.dart';
import 'pages/home/create_story/create_story_page.dart';
import 'pages/home/friend_profile/friend_profile.dart';
import 'pages/home/open_story/open_story_page.dart';
import 'pages/home/search/search.dart';
import 'pages/home/search/search_by_category/search_by_category.dart';
import 'pages/home/text_story/text_story.dart';
import 'pages/home/videos/videos.dart';
import 'pages/message/chat_room/chat_room.dart';
import 'pages/message/search_converstaion/search_converstaion.dart';
import 'pages/message/video_call/video_call_page.dart';
import 'pages/message/voice_call/voice_call_page.dart';
import 'pages/new_post/customize_post/customize_post.dart';
import 'pages/new_post/new_post.dart';
import 'pages/new_post/post_caption_and_tag/post_caption_and_tag.dart';
import 'pages/notification/comments/comments.dart';
import 'pages/notification/follow_request/follow_request_page.dart';
import 'pages/notification/notification_page.dart';
import 'pages/notification/posts/posts.dart';
import 'pages/profile/about_page/about_page.dart';
import 'pages/profile/account_privacy/account_privacy.dart';
import 'pages/profile/block_accounts/block_accounts.dart';
import 'pages/profile/edit_profile/edit_profile.dart';
import 'pages/profile/followers/followers_page.dart';
import 'pages/profile/following/following_page.dart';
import 'pages/profile/help_page/help_item.dart';
import 'pages/profile/help_page/help_page.dart';
import 'pages/profile/link_accounts/link_accounts.dart';
import 'pages/profile/your_activity/your_activity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) =>
          AnnotatedRegion(
        value:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Social Media',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: scaffoldColor),
          initialRoute: '/SplashPage',
          // initialRoute: '/BottomNavigation',
          onGenerateRoute: (settings) {
            var argument = settings.arguments;
            switch (settings.name) {
              case '/SplashPage':
                return PageTransition(
                    isIos: true,
                    child: const SplashPage(),
                    type: PageTransitionType.rightToLeft);
              case '/OnBoardingPage':
                return PageTransition(
                    isIos: true,
                    child: const OnBoardingPage(),
                    type: PageTransitionType.rightToLeft);
              case '/SignInPage':
                return PageTransition(
                    isIos: true,
                    child: const SignInPage(),
                    type: PageTransitionType.rightToLeft);
              case '/SignUpPage':
                return PageTransition(
                    isIos: true,
                    child: const SignUpPage(),
                    type: PageTransitionType.rightToLeft);
              case '/VerificationPage':
                return PageTransition(
                    isIos: true,
                    child: const VerificationPage(),
                    type: PageTransitionType.rightToLeft);
//*BottomNavigation
              case '/BottomNavigation':
                return PageTransition(
                    isIos: true,
                    child: argument == 1
                        ? const BottomNavigation(initialIndex: 1)
                        : const BottomNavigation(),
                    type: PageTransitionType.rightToLeft);
              case '/OpenStoryPage':
                return PageTransition(
                    isIos: true,
                    child: const OpenStoryPage(),
                    type: PageTransitionType.rightToLeft);
              case '/Search':
                return PageTransition(
                    isIos: true,
                    child: const Search(),
                    type: PageTransitionType.rightToLeft);
              case '/CreateStoryPage':
                return PageTransition(
                    isIos: true,
                    child: const CreateStoryPage(),
                    type: PageTransitionType.rightToLeft);
              case '/TextStory':
                return PageTransition(
                    isIos: true,
                    child: const TextStory(),
                    type: PageTransitionType.rightToLeft);
              case '/Notification':
                return PageTransition(
                    isIos: true,
                    child: const NotificationPage(),
                    type: PageTransitionType.rightToLeft);
              case '/FollowRequestPage':
                return PageTransition(
                    isIos: true,
                    child: const FollowRequestPage(),
                    type: PageTransitionType.rightToLeft);
              case '/Posts':
                return PageTransition(
                    isIos: true,
                    child: const Posts(),
                    type: PageTransitionType.rightToLeft);
              case '/Comments':
                return PageTransition(
                    isIos: true,
                    child: const Comments(),
                    type: PageTransitionType.rightToLeft);
              case '/SearchByCategory':
                return PageTransition(
                    isIos: true,
                    child: const SearchByCategory(),
                    type: PageTransitionType.rightToLeft);
              case '/VideosPage':
                return PageTransition(
                    isIos: true,
                    child: const VideosPage(),
                    type: PageTransitionType.rightToLeft);
              case '/VideoCallPage':
                return PageTransition(
                    isIos: true,
                    child: const VideoCallPage(),
                    type: PageTransitionType.rightToLeft);
              case '/VoiceCallPage':
                return PageTransition(
                    isIos: true,
                    child: const VoiceCallPage(),
                    type: PageTransitionType.rightToLeft);
              case '/ChatRoom':
                return PageTransition(
                    isIos: true,
                    child: const ChatRoom(),
                    type: PageTransitionType.rightToLeft);
              case '/NewPost':
                return PageTransition(
                    isIos: true,
                    child: const NewPost(),
                    type: PageTransitionType.rightToLeft);
              case '/CustomizePost':
                return PageTransition(
                    isIos: true,
                    child: const CustomizePost(),
                    type: PageTransitionType.rightToLeft);
              case '/PostCaptionAndTag':
                return PageTransition(
                    isIos: true,
                    child: const PostCaptionAndTag(),
                    type: PageTransitionType.rightToLeft);
              case '/EditProfile':
                return PageTransition(
                    isIos: true,
                    child: const EditProfile(),
                    type: PageTransitionType.rightToLeft);
              case '/YourActivity':
                return PageTransition(
                    isIos: true,
                    child: const YourActivity(),
                    type: PageTransitionType.rightToLeft);
              case '/AccountPrivacy':
                return PageTransition(
                    isIos: true,
                    child: const AccountPrivacy(),
                    type: PageTransitionType.rightToLeft);
              case '/BlockAccounts':
                return PageTransition(
                    isIos: true,
                    child: const BlockAccounts(),
                    type: PageTransitionType.rightToLeft);
              case '/LinkAccounts':
                return PageTransition(
                    isIos: true,
                    child: const LinkAccounts(),
                    type: PageTransitionType.rightToLeft);
              case '/AboutPage':
                return PageTransition(
                    isIos: true,
                    child: const AboutPage(),
                    type: PageTransitionType.rightToLeft);
              case '/HelpPage':
                return PageTransition(
                    isIos: true,
                    child: const HelpPage(),
                    type: PageTransitionType.rightToLeft);
              case '/HelpItem':
                return PageTransition(
                    isIos: true,
                    child: const HelpItem(),
                    type: PageTransitionType.rightToLeft);
              case '/FollowersPage':
                return PageTransition(
                    isIos: true,
                    child: const FollowersPage(),
                    type: PageTransitionType.rightToLeft);
              case '/FollowingPage':
                return PageTransition(
                    isIos: true,
                    child: const FollowingPage(),
                    type: PageTransitionType.rightToLeft);
              case '/SearchConverstaion':
                return PageTransition(
                    isIos: true,
                    child: const SearchConverstaion(),
                    type: PageTransitionType.rightToLeft);
              case '/FriendProfile':
                return PageTransition(
                    isIos: true,
                    child: const FriendProfile(),
                    type: PageTransitionType.rightToLeft);
            }
            return null;
          },
        ),
      ),
    );
  }
}
