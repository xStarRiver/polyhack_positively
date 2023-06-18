import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List _stories = [
  {
    'user': storyBy1,
    'userName': 'Johnny ',
    'image': homeStory1,
  },
  {
    'user': storyBy2,
    'userName': 'Vinamra',
    'image': homeStory2,
  },
  {
    'user': storyBy5,
    'userName': 'Derek',
    'image': homeStory5,
  },
  {
    'user': storyBy3,
    'userName': 'Tommy',
    'image': homeStory3,
  },
  {
    'user': storyBy4,
    'userName': 'Alex',
    'image': homeStory4,
  },
  {
    'user': storyBy5,
    'userName': 'Derek',
    'image': homeStory5,
  },
];

class _HomePageState extends State<HomePage> {
  final Set _likedContents = {};
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: white,
        appBar: appBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace15,
              ...shortStories(),
              heightSpace20,
              uploadedContents(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> shortStories() {
    List shortStories = [
      {
        'image': storyBy1,
        'user': 'Johnny',
        'isSeen': true,
      },
      {
        'image': storyBy1,
        'user': 'Johnny',
        'isSeen': true,
      },
      {
        'image': storyBy2,
        'user': 'Vinamra',
        'isSeen': true,
      },
      {
        'image': storyBy3,
        'user': 'Tommy',
        'isSeen': true,
      },
      {
        'image': storyBy4,
        'user': 'Alex',
        'isSeen': false,
      },
      {
        'image': storyBy5,
        'user': 'Derek',
        'isSeen': false,
      },
      {
        'image': storyBy6,
        'user': 'Thomas',
        'isSeen': false,
      },
    ];
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text('Stories', style: primaryBold14),
      ),
      SizedBox(
        height: 85,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: shortStories.length,
          itemBuilder: (context, index) {
            var item = shortStories[index];
            bool isSeen = item['isSeen'] == true;
            return Padding(
              padding: index == 0
                  ? const EdgeInsets.only(right: 5, top: 6)
                  : index == shortStories.length - 1
                      ? const EdgeInsets.only(left: 5, top: 6)
                      : const EdgeInsets.symmetric(horizontal: 6)
                          .copyWith(top: 5),
              child: index == 0
                  ? PushNavigate(
                      navigate: 'CreateStoryPage',
                      child: Column(
                        children: [
                          Container(
                            decoration: DottedDecoration(
                              shape: Shape.circle,
                              dash: const [3, 2],
                              strokeWidth: 3,
                              color: primaryColor,
                            ),
                            child: CircleAvatar(
                              radius: 3.2.h,
                              backgroundColor: const Color(0xffE3F2FD),
                              child: Icon(
                                Icons.add,
                                color: primaryColor,
                                size: 3.2.h,
                              ),
                            ),
                          ),
                          heightSpace4,
                          Text(
                            'Share story',
                            style: blackRegular10,
                          )
                        ],
                      ),
                    )
                  : PushNavigate(
                      navigate: 'OpenStoryPage',
                      child: Column(
                        children: [
                          Container(
                            decoration: DottedDecoration(
                              shape: Shape.circle,
                              dash: const [1, 0],
                              strokeWidth: 2.5,
                              color: isSeen ? primaryColor : colorB7,
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: const Color(0xffE3F2FD),
                              backgroundImage: AssetImage(item['image']),
                            ),
                          ),
                          heightSpace4,
                          Text(
                            item['user'],
                            style: blackRegular10,
                          ),
                        ],
                      ),
                    ),
            );
          },
        ),
      )
    ];
  }

  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(76),
      child: AppBar(
        backgroundColor: appBarColor,
        elevation: 3,
        shadowColor: colorForShadow.withOpacity(.30),
        automaticallyImplyLeading: false,
        flexibleSpace: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  homeIcon,
                  height: 4.2.h,
                ),
                PushNavigate(
                  navigate: 'Search',
                  child: Image.asset(
                    searchIcon,
                    height: 1.8.h,
                    color: black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget uploadedContents() {
    List suggestionForYou = [
      {
        'image': suggestedPerson1,
        'name': 'xstarriver',
        'id': 'offical_SR',
      },
      {
        'image': suggestedPerson2,
        'name': 'ngan_tommy',
        'id': 'nganwan',
      },
      {
        'image': suggestedPerson3,
        'name': 'visionerse',
        'id': 'tech_visionerse',
      },
      {
        'image': suggestedPerson4,
        'name': 'Swift Vinera',
        'id': 'vinera_swift',
      },
    ];
    return Column(
      children: List.generate(_stories.length, (index) {
        dynamic item = _stories[index];
        return index == 2
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20)
                        .copyWith(bottom: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Suggestion for you', style: blackSemiBold18),
                        Text('See All', style: primarySemiBold14),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 187,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: suggestionForYou.length,
                        itemBuilder: (context, index) {
                          dynamic item = suggestionForYou[index];
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                margin: index == 0
                                    ? const EdgeInsets.only(right: 5)
                                    : index == 4
                                        ? const EdgeInsets.only(left: 5)
                                        : const EdgeInsets.symmetric(
                                            horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: color94),
                                ),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: colorE6,
                                      backgroundImage:
                                          AssetImage(item['image']),
                                    ),
                                    heightSpace10,
                                    Text(item['name'], style: blackSemiBold16),
                                    Text(item['id'], style: color94Regular14),
                                    heightSpace14,
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7.5),
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: borderRadius10,
                                      ),
                                      child: Text('Follow', style: whiteBold18),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      )),
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        PushNavigate(
                          navigate: 'FriendProfile',
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: circleAvtarColor,
                            backgroundImage: AssetImage(item['user']),
                          ),
                        ),
                        widthSpace10,
                        PushNavigate(
                          navigate: 'FriendProfile',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['userName'], style: blackSemiBold14),
                              heightSpace2,
                              Text('Hong Kong', style: color94Regular12),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Image.asset(moreVertIcon, height: 18)
                      ],
                    ),
                    heightSpace4,
                    Text(' ', style: color94Regular12),
                    heightSpace10,
                    Container(
                      margin: EdgeInsets.only(
                          bottom: index == 1
                              ? 15
                              : index == _stories.length - 1
                                  ? 40
                                  : 20),
                      alignment: Alignment.bottomCenter,
                      height: 192,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: borderRadius10,
                          color: colorE6,
                          image: DecorationImage(
                              image: AssetImage(item['image']),
                              fit: BoxFit.cover)),
                      child: Container(
                        width: 100.w,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 11.5),
                        decoration: BoxDecoration(
                            color: white,
                            boxShadow: [primaryBS],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _likedContents.contains(index)
                                        ? _likedContents.remove(index)
                                        : _likedContents.add(index);
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.favorite_rounded,
                                    color: _likedContents.contains(index)
                                        ? color94
                                        : favColor,
                                    size: 16,
                                  ),
                                ),
                                widthSpace10,
                                Text('4.2k Likes', style: color94SemiBold14),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  commentsIcon,
                                  height: 13,
                                ),
                                widthSpace10,
                                Text('53 Comments', style: color94SemiBold14),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  shareIcon,
                                  height: 14,
                                ),
                                widthSpace10,
                                Text('35 Share', style: color94SemiBold14),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
      }),
    );
  }
}
