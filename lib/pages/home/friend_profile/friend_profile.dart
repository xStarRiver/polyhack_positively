import 'package:flutter/material.dart';
import 'package:positively/utils/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants.dart';

class FriendProfile extends StatefulWidget {
  const FriendProfile({Key? key}) : super(key: key);

  @override
  State<FriendProfile> createState() => _FriendProfileState();
}

class _FriendProfileState extends State<FriendProfile>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isFollowed = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      _handleTabSelection();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: bodyMethod(),
    );
  }

  Widget bodyMethod() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      children: [
        ...userInfo(),
        followMessage(),
        tabBars(),
        IndexedStack(
          index: _tabController.index,
          children: <Widget>[
            tabView1(),
            tabView2(),
            tabView3(),
          ],
        ),
      ],
    );
  }

  Visibility tabView3() {
    List tabView3List = [gallery34, gallery33, gallery32, gallery31];
    return Visibility(
      maintainState: true,
      visible: _tabController.index == 2,
      child: GridView.builder(
        itemCount: tabView3List.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero.copyWith(top: 10, bottom: 20),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: .80),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/Posts'),
            child: Image.asset(
              tabView3List[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Visibility tabView2() {
    List tabView2List = [
      {'image': gallery19, 'views': '190k'},
      {'image': gallery20, 'views': '200k'},
      {'image': gallery21, 'views': '120k'},
      {'image': gallery22, 'views': '190k'},
      {'image': gallery23, 'views': '200k'},
      {'image': gallery24, 'views': '120k'},
      {'image': gallery25, 'views': '190k'},
      {'image': gallery26, 'views': '200k'},
      {'image': gallery27, 'views': '120k'},
      {'image': gallery28, 'views': '190k'},
      {'image': gallery29, 'views': '200k'},
      {'image': gallery30, 'views': '120k'},
    ];

    return Visibility(
      maintainState: true,
      visible: _tabController.index == 1,
      child: GridView.builder(
        itemCount: tabView2List.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero.copyWith(top: 10, bottom: 20),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: .80),
        itemBuilder: (context, index) {
          dynamic item = tabView2List[index];
          return GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/VideosPage'),
              child: Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(item['image']))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 6, bottom: 8),
                  child: Row(
                    children: [
                      Image.asset(playArrow, height: 1.6.h),
                      widthSpace4,
                      Text(item['views'], style: whiteSemiBold12),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }

  Visibility tabView1() {
    List tabView1List = [
      gallery1,
      gallery2,
      gallery3,
      gallery4,
      gallery5,
      gallery6,
      gallery7,
      gallery8,
      gallery9,
      gallery10,
      gallery11,
      gallery12,
      gallery13,
      gallery14,
      gallery15,
    ];
    return Visibility(
      maintainState: true,
      visible: _tabController.index == 0,
      child: GridView.builder(
        itemCount: tabView1List.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero.copyWith(top: 10, bottom: 20),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: .80),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/Posts'),
            child: Image.asset(
              tabView1List[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget tabBars() {
    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: colorB7, width: 1.5),
            ),
          ),
        ),
        SizedBox(
          height: 35,
          child: TabBar(
            physics: const BouncingScrollPhysics(),
            overlayColor: MaterialStateProperty.all(transparent),
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            unselectedLabelColor: colorB7,
            labelStyle: primarySemiBold16,
            unselectedLabelStyle: colorB7SemiBold16,
            controller: _tabController,
            tabs: [
              Tab(
                child: Image.asset(
                  profileTab1,
                  height: 18,
                  color: _tabController.index == 0 ? primaryColor : colorB7,
                ),
              ),
              Tab(
                icon: Image.asset(
                  profileTab2,
                  height: 20,
                  color: _tabController.index == 1 ? primaryColor : colorB7,
                ),
              ),
              Tab(
                icon: Image.asset(
                  profileTab3,
                  height: 24,
                  color: _tabController.index == 2 ? primaryColor : colorB7,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget followMessage() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _isFollowed = !_isFollowed),
            child: _isFollowed
                ? Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 5),
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    decoration: BoxDecoration(
                        borderRadius: borderRadius10,
                        color: white,
                        boxShadow: [primaryBS]),
                    child: Center(
                      child: Text(
                        'Following',
                        style: primaryBold18,
                      ),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 5),
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    decoration: BoxDecoration(
                        borderRadius: borderRadius10, color: primaryColor),
                    child: Center(
                      child: Text(
                        'Follow',
                        style: whiteBold18,
                      ),
                    ),
                  ),
          ),
        ),
        widthSpace20,
        Expanded(
          child: PushNavigate(
            navigate: 'ChatRoom',
            child: Container(
              margin: const EdgeInsets.only(top: 16, bottom: 5),
              padding: const EdgeInsets.symmetric(vertical: 11),
              decoration: BoxDecoration(
                  borderRadius: borderRadius10,
                  color: white,
                  boxShadow: [primaryBS]),
              child: Center(
                child: Text(
                  'Message',
                  style: primaryBold18,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> userInfo() {
    Map userItem = {
      'posts': '105',
      'videos': '59',
      'followers': '850k',
      'following': '542',
    };
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            userItem.length,
            (index) => GestureDetector(
                  onTap: index == 2
                      ? () => Navigator.pushNamed(context, '/FollowersPage')
                      : index == 3
                          ? () => Navigator.pushNamed(context, '/FollowingPage')
                          : null,
                  child: Column(
                    children: [
                      Text(userItem.values.toList()[index], style: blackBold16),
                      Text(userItem.keys.toList()[index],
                          style: color94Regular14),
                    ],
                  ),
                )),
      ),
      heightSpace25,
      heightSpace2,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tina Shah', style: blackSemiBold18),
              heightSpace1,
              Text('Artist', style: color94Regular14),
              heightSpace1,
              Text('Art + Prints + Workshops', style: blackRegular14),
              heightSpace1,
              Text.rich(TextSpan(
                  text: 'Find me on ',
                  style: blackRegular14,
                  children: [
                    TextSpan(
                        text: '@samantha___',
                        style: TextStyle(
                          color: const Color(0xff3A7BD5),
                          fontFamily: 'R',
                          fontSize: 9.7.sp,
                        ))
                  ])),
              heightSpace1,
              Text.rich(
                  TextSpan(text: 'Website: ', style: blackRegular14, children: [
                TextSpan(
                    text: 'www.officialtinashah.com',
                    style: TextStyle(
                      color: const Color(0xff3A7BD5),
                      fontFamily: 'R',
                      fontSize: 9.7.sp,
                    ))
              ])),
            ],
          ),
          PushNavigate(
            navigate: 'OpenStoryPage',
            child: Container(
              padding: const EdgeInsets.all(3),
              height: 97,
              width: 97,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: white,
                  border: Border.all(color: primaryColor)),
              child: Image.asset(suggestedPerson1, fit: BoxFit.cover),
            ),
          )
        ],
      ),
      heightSpace1,
      Text(
          'Followed by Followed by alicia___ , isha.__ , officialjoyjain_ and 27 more',
          style: blackRegular14)
    ];
  }

  PreferredSize appBar() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: MyAppBar(
        title: 'realtinashah',
      ),
    );
  }
}
