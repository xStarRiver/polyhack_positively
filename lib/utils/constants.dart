import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//Colors
const Color white = Colors.white;
const Color amber = Colors.amber;
const Color grey = Colors.grey;
const Color red = Colors.red;
const Color green = Colors.green;
const Color black = Colors.black;
const Color transparent = Colors.transparent;
const Color scaffoldColor = Color(0xffFFFFFF);
const Color secondaryBGColor = Color(0xffFFFFFF);
const Color colorForShadow = Color(0xff000000);
const Color appBarColor = Color(0xffFAFAFA);
const Color primaryColor = Color(0xff5790DF);
const Color colorB7 = Color(0xffB7B7B7);
const Color chatContainerColor = Color(0xffF0F0F0);
const Color color94 = Color(0xff949494);
const Color colorE6 = Color(0xffE6E6E6);
const Color onlineColor = Color(0xff35CB00);
const Color favColor = Color(0xffFF0000);
const Color circleAvtarColor = Color(0xffE3F2FD);
BoxShadow primaryBS =
    BoxShadow(blurRadius: 4, color: colorForShadow.withOpacity(.25));

//SizedBox
const SizedBox heightSpace1 = SizedBox(height: 1);
const SizedBox heightSpace2 = SizedBox(height: 2);
const SizedBox heightSpace3 = SizedBox(height: 3);
const SizedBox heightSpace4 = SizedBox(height: 4);
const SizedBox heightSpace5 = SizedBox(height: 5);
const SizedBox heightSpace6 = SizedBox(height: 6);
const SizedBox heightSpace7 = SizedBox(height: 7);
const SizedBox heightSpace8 = SizedBox(height: 8);
const SizedBox heightSpace10 = SizedBox(height: 10);
const SizedBox heightSpace14 = SizedBox(height: 14);
const SizedBox heightSpace15 = SizedBox(height: 15);
const SizedBox heightSpace17 = SizedBox(height: 17);
const SizedBox heightSpace18 = SizedBox(height: 18);
const SizedBox heightSpace20 = SizedBox(height: 20);
const SizedBox heightSpace22 = SizedBox(height: 22);
const SizedBox heightSpace25 = SizedBox(height: 25);
const SizedBox heightSpace30 = SizedBox(height: 30);
const SizedBox heightSpace35 = SizedBox(height: 35);
const SizedBox heightSpace40 = SizedBox(height: 40);
const SizedBox heightSpace45 = SizedBox(height: 45);
const SizedBox heightSpace50 = SizedBox(height: 50);
const SizedBox heightSpace55 = SizedBox(height: 55);
const SizedBox heightSpace60 = SizedBox(height: 60);
const SizedBox heightSpace70 = SizedBox(height: 70);
const SizedBox heightSpace80 = SizedBox(height: 80);
const SizedBox heightSpace100 = SizedBox(height: 100);

const SizedBox widthSpace2 = SizedBox(width: 2);
const SizedBox widthSpace3 = SizedBox(width: 3);
const SizedBox widthSpace4 = SizedBox(width: 4);
const SizedBox widthSpace5 = SizedBox(width: 5);
const SizedBox widthSpace7 = SizedBox(width: 7);
const SizedBox widthSpace8 = SizedBox(width: 8);
const SizedBox widthSpace10 = SizedBox(width: 10);
const SizedBox widthSpace12 = SizedBox(width: 12);
const SizedBox widthSpace15 = SizedBox(width: 15);
const SizedBox widthSpace20 = SizedBox(width: 20);
const SizedBox widthSpace25 = SizedBox(width: 25);
const SizedBox widthSpace30 = SizedBox(width: 30);
const SizedBox widthSpace35 = SizedBox(width: 35);
const SizedBox widthSpace40 = SizedBox(width: 40);
const SizedBox widthSpace45 = SizedBox(width: 45);
const SizedBox widthSpace50 = SizedBox(width: 50);
BorderRadius borderRadius5 = BorderRadius.circular(5);
BorderRadius borderRadius10 = BorderRadius.circular(10);

//Path
const String images = 'assets/images/';
//Images
const String logo = '${images}logo.png';
const String onBoard1 = '${images}onBoard1.png';
const String onBoard2 = '${images}onBoard2.png';
const String onBoard3 = '${images}onBoard3.png';
const String fb = '${images}fb.png';
const String google = '${images}google.png';
const String twitter = '${images}twitter.png';
const String bN1 = '${images}bN1.png';
const String bN2 = '${images}bN2.png';
const String bN3 = '${images}bN3.png';
const String bN4 = '${images}bN4.png';
const String homeIcon = '${images}logo.png';
const String homeLogo = '${images}homeLogo.png';
const String searchIcon = '${images}searchIcon.png';
const String storyBy1 = '${images}storyBy1.png';
const String storyBy2 = '${images}storyBy2.png';
const String storyBy3 = '${images}storyBy3.png';
const String storyBy4 = '${images}storyBy4.png';
const String storyBy5 = '${images}storyBy5.png';
const String storyBy6 = '${images}storyBy6.png';
const String storyBy7 = '${images}storyBy7.png';
const String storyBy8 = '${images}storyBy8.png';
const String storyBy9 = '${images}storyBy9.png';
const String storyBy10 = '${images}storyBy10.png';
const String storyBy11 = '${images}storyBy11.png';
const String storyBy12 = '${images}storyBy12.png';
const String storyBy13 = '${images}storyBy13.png';
const String storyBy14 = '${images}storyBy14.png';
const String sendIcon = '${images}sendIcon.png';
const String moreVertIcon = '${images}moreVertIcon.png';
const String homeStory1 = '${images}homeStory1.png';
const String homeStory2 = '${images}homeStory2.png';
const String homeStory3 = '${images}homeStory3.png';
const String homeStory4 = '${images}homeStory4.png';
const String homeStory5 = '${images}homeStory5.png';
const String commentsIcon = '${images}commentsIcon.png';
const String shareIcon = '${images}shareIcon.png';
const String suggestedPerson1 = '${images}suggestedPerson1.png';
const String suggestedPerson2 = '${images}suggestedPerson2.png';
const String suggestedPerson3 = '${images}suggestedPerson3.png';
const String suggestedPerson4 = '${images}suggestedPerson4.png';
const String createStoryType1 = '${images}createStoryType1.png';
const String createStoryType2 = '${images}createStoryType2.png';
const String createStoryType3 = '${images}createStoryType3.png';
const String createStoryType4 = '${images}createStoryType4.png';
const String createStoryType5 = '${images}createStoryType5.png';
const String gallery1 = '${images}gallery1.png';
const String gallery2 = '${images}gallery2.png';
const String gallery3 = '${images}gallery3.png';
const String gallery4 = '${images}gallery4.png';
const String gallery5 = '${images}gallery5.png';
const String gallery6 = '${images}gallery6.png';
const String gallery7 = '${images}gallery7.png';
const String gallery8 = '${images}gallery8.png';
const String gallery9 = '${images}gallery9.png';
const String gallery10 = '${images}gallery10.png';
const String gallery11 = '${images}gallery11.png';
const String gallery12 = '${images}gallery12.png';
const String gallery13 = '${images}gallery13.png';
const String gallery14 = '${images}gallery14.png';
const String gallery15 = '${images}gallery15.png';
const String gallery17 = '${images}gallery17.png';
const String gallery18 = '${images}gallery18.png';
const String gallery19 = '${images}gallery19.png';
const String gallery20 = '${images}gallery20.png';
const String gallery21 = '${images}gallery21.png';
const String gallery22 = '${images}gallery22.png';
const String gallery23 = '${images}gallery23.png';
const String gallery24 = '${images}gallery24.png';
const String gallery25 = '${images}gallery25.png';
const String gallery26 = '${images}gallery26.png';
const String gallery27 = '${images}gallery27.png';
const String gallery28 = '${images}gallery28.png';
const String gallery29 = '${images}gallery29.png';
const String gallery30 = '${images}gallery30.png';
const String gallery31 = '${images}gallery31.png';
const String gallery32 = '${images}gallery32.png';
const String gallery33 = '${images}gallery33.png';
const String gallery34 = '${images}gallery34.png';
const String helloEmoji = '${images}helloEmoji.png';
const String edit1 = '${images}edit1.png';
const String edit2 = '${images}edit2.png';
const String liked1 = '${images}liked1.png';
const String liked2 = '${images}liked2.png';
const String liked3 = '${images}liked3.png';
const String liked4 = '${images}liked4.png';
const String liked5 = '${images}liked5.png';
const String liked6 = '${images}liked6.png';
const String liked7 = '${images}liked7.png';
const String liked8 = '${images}liked8.png';
const String liked9 = '${images}liked9.png';
const String yearAgoPost = '${images}yearAgoPost.png';
const String followReq = '${images}followReq.png';
const String user1 = '${images}user1.png';
const String user2 = '${images}user2.png';
const String user3 = '${images}user3.png';
const String user4 = '${images}user4.png';
const String user5 = '${images}user5.png';
const String user6 = '${images}user6.png';
const String user7 = '${images}user7.png';
const String user8 = '${images}user8.png';
const String user9 = '${images}user9.png';
const String user10 = '${images}user10.png';
const String user11 = '${images}user11.png';
const String user12 = '${images}user12.png';
const String user13 = '${images}user13.png';
const String arrowBack = '${images}arrowBack.png';
const String post1 = '${images}post1.png';
const String post2 = '${images}post2.png';
const String post3 = '${images}post3.png';
const String post4 = '${images}post4.png';
const String post5 = '${images}post5.png';
const String gridVideo1 = '${images}gridVideo1.png';
const String gridVideo2 = '${images}gridVideo2.png';
const String gridImage01 = '${images}gridImage01.png';
const String gridImage02 = '${images}gridImage02.png';
const String gridImage03 = '${images}gridImage03.png';
const String gridImage04 = '${images}gridImage04.png';
const String gridImage05 = '${images}gridImage05.png';
const String gridImage06 = '${images}gridImage06.png';
const String gridImage07 = '${images}gridImage07.png';
const String gridImage08 = '${images}gridImage08.png';
const String gridImage09 = '${images}gridImage09.png';
const String gridImage10 = '${images}gridImage10.png';
const String gridImage11 = '${images}gridImage11.png';
const String gridImage12 = '${images}gridImage12.png';
const String gridImage13 = '${images}gridImage13.png';
const String gridImage14 = '${images}gridImage14.png';
const String gridImage15 = '${images}gridImage15.png';
const String gridImage16 = '${images}gridImage16.png';
const String gridImage17 = '${images}gridImage17.png';
const String gridImage18 = '${images}gridImage18.png';
const String gridImage19 = '${images}gridImage19.png';
const String gridImage20 = '${images}gridImage20.png';
const String gridImage21 = '${images}gridImage21.png';
const String gridImage22 = '${images}gridImage22.png';
const String commentVideoIcon = '${images}commentVideoIcon.png';
const String shareVideoIcon = '${images}shareVideoIcon.png';
const String videoTag = '${images}videoTag.png';
const String tags1 = '${images}tags1.png';
const String tags2 = '${images}tags2.png';
const String tags3 = '${images}tags3.png';
const String tags4 = '${images}tags4.png';
const String tags5 = '${images}tags5.png';
const String tags6 = '${images}tags6.png';
const String tags7 = '${images}tags7.png';
const String tags8 = '${images}tags8.png';
const String callMain = '${images}callMain.png';
const String callOwnMain = '${images}callOwnMain.png';
const String callEffect = '${images}callEffect.png';
const String callMute = '${images}callMute.png';
const String callFlip = '${images}callFlip.png';
const String callEnd = '${images}callEnd.png';
const String callVideo = '${images}callVideo.png';
const String clipIcon = '${images}clipIcon.png';
const String smileIcon = '${images}smileIcon.png';
const String msgSend = '${images}msgSend.png';
const String chatImage1 = '${images}chatImage1.png';
const String chatImage2 = '${images}chatImage2.png';
const String chatImage3 = '${images}chatImage3.png';
const String chatImage4 = '${images}chatImage4.png';
const String photos1 = '${images}photos1.png';
const String photos2 = '${images}photos2.png';
const String photos3 = '${images}photos3.png';
const String photos4 = '${images}photos4.png';
const String photos5 = '${images}photos5.png';
const String photos6 = '${images}photos6.png';
const String photos7 = '${images}photos7.png';
const String photos8 = '${images}photos8.png';
const String photos9 = '${images}photos9.png';
const String photos10 = '${images}photos10.png';
const String photos11 = '${images}photos11.png';
const String photos12 = '${images}photos12.png';
const String filterImage1 = '${images}filterImage1.png';
const String filterImage2 = '${images}filterImage2.png';
const String filterImage3 = '${images}filterImage3.png';
const String filterImage4 = '${images}filterImage4.png';
const String filterImage5 = '${images}filterImage5.png';
const String filterImage6 = '${images}filterImage6.png';
const String filterImage7 = '${images}filterImage7.png';
const String editIcon1 = '${images}editIcon1.png';
const String editIcon2 = '${images}editIcon2.png';
const String editIcon3 = '${images}editIcon3.png';
const String editIcon4 = '${images}editIcon4.png';
const String editIcon5 = '${images}editIcon5.png';
const String editIcon6 = '${images}editIcon6.png';
const String editIcon7 = '${images}editIcon7.png';
const String editIcon8 = '${images}editIcon8.png';
const String setting1 = '${images}setting1.png';
const String setting2 = '${images}setting2.png';
const String setting3 = '${images}setting3.png';
const String setting4 = '${images}setting4.png';
const String setting5 = '${images}setting5.png';
const String setting6 = '${images}setting6.png';
const String setting7 = '${images}setting7.png';
const String logOut = '${images}logOut.png';
const String profileTab1 = '${images}profileTab1.png';
const String profileTab2 = '${images}profileTab2.png';
const String profileTab3 = '${images}profileTab3.png';
const String playArrow = '${images}playArrow.png';
const String linkDin = '${images}linkDin.png';
const String emptyBlock = '${images}emptyBlock.png';
const String emptyNotification = '${images}emptyNotification.png';
const String emptyFollow = '${images}emptyFollow.png';

//videos
const String seaview = 'assets/videos/sea_view.mp4';
const String roadview = 'assets/videos/road_view.mp4';
const String natureview = 'assets/videos/nature_view.mp4';

/*
10 = 7.6
12 = 9.2
13 = 9.5
14 = 9.7
15 = 10.8
16 = 11.2
17 = 13
18 = 12.6
20 = 14
22 = 15.5
24 = 16.8
25 = 17.5
28 = 19.4
 */
//Text_Styles
TextStyle whiteBold16 = TextStyle(
  color: white,
  fontFamily: 'B',
  fontSize: 11.2.sp,
);
TextStyle whiteSemiBold16 = TextStyle(
  color: white,
  fontFamily: 'SB',
  fontSize: 11.2.sp,
);
TextStyle colorB7SemiBold16 = TextStyle(
  color: colorB7,
  fontFamily: 'SB',
  fontSize: 11.2.sp,
);
TextStyle color94SemiBold16 = TextStyle(
  color: color94,
  fontFamily: 'SB',
  fontSize: 11.2.sp,
);
TextStyle primarySemiBold16 = TextStyle(
  color: primaryColor,
  fontFamily: 'SB',
  fontSize: 11.2.sp,
);
TextStyle shareStoryStyle = TextStyle(
  color: const Color(0xff0683A0),
  fontFamily: 'SB',
  fontSize: 11.2.sp,
);
TextStyle whiteBold22 = TextStyle(
  color: white,
  fontFamily: 'B',
  fontSize: 15.5.sp,
);
TextStyle blackSemiBold20 = TextStyle(
  color: black,
  fontFamily: 'SB',
  fontSize: 14.sp,
);
TextStyle primaryBold20 = TextStyle(
  color: primaryColor,
  fontFamily: 'B',
  fontSize: 14.sp,
);
TextStyle blackSemiBold18 = TextStyle(
  color: black,
  fontFamily: 'SB',
  fontSize: 12.6.sp,
);
TextStyle blackSemiBold16 = TextStyle(
  color: black,
  fontFamily: 'SB',
  fontSize: 11.2.sp,
);
TextStyle blackBold16 = TextStyle(
  color: black,
  fontFamily: 'B',
  fontSize: 11.2.sp,
);
TextStyle blackRegular16 = TextStyle(
  color: black,
  fontFamily: 'R',
  fontSize: 11.2.sp,
);
TextStyle blackSemiBold14 = TextStyle(
  color: black,
  fontFamily: 'SB',
  fontSize: 9.7.sp,
);
TextStyle taggedStyle = TextStyle(
  color: const Color(0xff3A7BD5),
  fontFamily: 'SB',
  fontSize: 9.7.sp,
);
TextStyle blackRegular14 = TextStyle(
  color: black,
  fontFamily: 'R',
  fontSize: 9.7.sp,
);
TextStyle blueSemiBold14 = TextStyle(
  color: const Color(0xff3A7BD5),
  fontFamily: 'SB',
  fontSize: 9.7.sp,
);
TextStyle blackBold14 = TextStyle(
  color: black,
  fontFamily: 'B',
  fontSize: 9.7.sp,
);
TextStyle whiteSemiBold20 = TextStyle(
  color: white,
  fontFamily: 'SB',
  fontSize: 14.sp,
);
TextStyle whiteExtraBold20 = TextStyle(
  color: white,
  fontFamily: 'EB',
  fontSize: 14.sp,
);
TextStyle whiteBold20 = TextStyle(
  color: white,
  fontFamily: 'B',
  fontSize: 14.sp,
);
TextStyle whiteRegular14 = TextStyle(
  color: white,
  fontFamily: 'R',
  fontSize: 9.7.sp,
);
TextStyle whiteBold14 = TextStyle(
  color: white,
  fontFamily: 'B',
  fontSize: 9.7.sp,
);
TextStyle whiteSemiBold14 = TextStyle(
  color: white,
  fontFamily: 'SB',
  fontSize: 9.7.sp,
);
TextStyle blackRegular10 = TextStyle(
  fontSize: 7.6.sp,
  color: black,
  fontFamily: 'R',
);
TextStyle primaryBold16 = TextStyle(
  color: primaryColor,
  fontFamily: 'B',
  fontSize: 11.2.sp,
);
TextStyle primaryBold14 = TextStyle(
  color: primaryColor,
  fontFamily: 'B',
  fontSize: 9.7.sp,
);
TextStyle primarySemiBold14 = TextStyle(
  color: primaryColor,
  fontFamily: 'SB',
  fontSize: 9.7.sp,
);
TextStyle colorB7Regular16 = TextStyle(
  color: colorB7,
  fontFamily: 'R',
  fontSize: 11.2.sp,
);
TextStyle whiteRegular16 = TextStyle(
  color: white,
  fontFamily: 'R',
  fontSize: 11.2.sp,
);
TextStyle whiteRegular12 = TextStyle(
  color: white,
  fontFamily: 'R',
  fontSize: 9.2.sp,
);
TextStyle whiteBold12 = TextStyle(
  color: white,
  fontFamily: 'B',
  fontSize: 9.2.sp,
);
TextStyle whiteSemiBold12 = TextStyle(
  color: white,
  fontFamily: 'SB',
  fontSize: 9.2.sp,
);
TextStyle blackSemiBold12 = TextStyle(
  color: black,
  fontFamily: 'SB',
  fontSize: 9.2.sp,
);
TextStyle blackRegular12 = TextStyle(
  color: black,
  fontFamily: 'R',
  fontSize: 9.2.sp,
);
TextStyle color94Regular12 = TextStyle(
  color: color94,
  fontFamily: 'R',
  fontSize: 9.2.sp,
);
TextStyle color94Regular10 = TextStyle(
  color: color94,
  fontFamily: 'R',
  fontSize: 7.6.sp,
);
TextStyle color94SemiBold10 = TextStyle(
  color: color94,
  fontFamily: 'SB',
  fontSize: 7.6.sp,
);
TextStyle colorB7Regular14 = TextStyle(
  color: colorB7,
  fontFamily: 'R',
  fontSize: 9.7.sp,
);
TextStyle color94Regular14 = TextStyle(
  color: color94,
  fontFamily: 'R',
  fontSize: 9.7.sp,
);
TextStyle color94SemiBold14 = TextStyle(
  color: color94,
  fontFamily: 'SB',
  fontSize: 9.7.sp,
);
TextStyle whiteRegular18 = TextStyle(
  color: white,
  fontFamily: 'R',
  fontSize: 12.6.sp,
);
TextStyle blackRegular18 = TextStyle(
  color: black,
  fontFamily: 'R',
  fontSize: 12.6.sp,
);
TextStyle whiteBold18 = TextStyle(
  color: white,
  fontFamily: 'B',
  fontSize: 12.6.sp,
);
TextStyle whiteSemiBold18 = TextStyle(
  color: white,
  fontFamily: 'SB',
  fontSize: 12.6.sp,
);
TextStyle primarySemiBold18 = TextStyle(
  color: primaryColor,
  fontFamily: 'SB',
  fontSize: 12.6.sp,
);
TextStyle primaryBold18 = TextStyle(
  color: primaryColor,
  fontFamily: 'B',
  fontSize: 12.6.sp,
);
