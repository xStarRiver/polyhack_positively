import 'package:flutter/material.dart';
import 'package:positively/helper/helper.dart';
import 'package:positively/utils/widgets.dart';
import 'package:sizer/sizer.dart';
import '../../utils/constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late TabController _tabController;

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
      endDrawer: drawerMethod(),
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
        editButton(),
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
    List tabView3List = [gallery1, gallery2, gallery3];
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
      {'image': gallery1, 'views': '190k'},
      {'image': gallery2, 'views': '200k'},
      {'image': gallery3, 'views': '120k'},
   
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

  Widget editButton() {
    return PushNavigate(
      navigate: 'EditProfile',
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 16, bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
            borderRadius: borderRadius10, border: Border.all(color: color94)),
        child: Text('Edit Profile', style: blackSemiBold16),
      ),
    );
  }

  SafeArea drawerMethod() {
    List settignItems = [
      {
        'icon': setting1,
        'title': 'Your Activity',
        'navigate': '/YourActivity',
      },
      {
        'icon': setting2,
        'title': 'Notifications',
        'navigate': '/',
      },
      {
        'icon': setting3,
        'title': 'Account Privacy',
        'navigate': '/AccountPrivacy',
      },
      {
        'icon': setting4,
        'title': 'Block Accounts',
        'navigate': '/BlockAccounts',
      },
      {
        'icon': setting5,
        'title': 'Link Accounts',
        'navigate': '/LinkAccounts',
      },
      {
        'icon': setting6,
        'title': 'About',
        'navigate': '/AboutPage',
      },
      {
        'icon': setting7,
        'title': 'Help',
        'navigate': '/HelpPage',
      },
    ];
    return SafeArea(
        child: Drawer(
            child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 3,
        shadowColor: colorForShadow.withOpacity(.30),
        backgroundColor: appBarColor,
        title: Text(
          'Settings',
          style: blackSemiBold20,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 15),
        children: [
          Column(
            children: List.generate(settignItems.length, (index) {
              dynamic item = settignItems[index];
              return ListTile(
                onTap: index == 1
                    ? () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                        Navigator.pushReplacementNamed(
                            context, '/BottomNavigation',
                            arguments: 1);
                      }
                    : () {
                        Navigator.popAndPushNamed(context, item['navigate']);
                      },
                leading: Image.asset(item['icon'], height: 22),
                title: Transform.translate(
                    offset: const Offset(-20, 0),
                    child: Text(item['title'], style: blackSemiBold16)),
              );
            }),
          ),
          heightSpace10,
          ListTile(
            onTap: () => UiHelper.logOutDialog(context),
            leading: Image.asset(logOut, height: 22),
            title: Transform.translate(
                offset: const Offset(-20, 0),
                child: Text('Logout', style: primarySemiBold16)),
          )
        ],
      ),
    )));
  }

  AppBar appBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: black),
      centerTitle: false,
      elevation: 3,
      shadowColor: colorForShadow.withOpacity(.30),
      backgroundColor: appBarColor,
      title: Text(
        'xstarriver',
        style: blackSemiBold20,
      ),
    );
  }

  List<Widget> userInfo() {
    Map userItem = {
      'posts': '3',
      'videos': '2',
      'followers': '3',
      'following': '2',
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
              Text('xStarRiver', style: blackSemiBold18),
              Text('👨🏻‍💻Fullstack Developer', style: color94Regular14),
              Text('💻Founder - @visionerse', style: blackRegular14),
              Text.rich(
                  TextSpan(text: '📩Gmail :', style: blackRegular14, children: [
                TextSpan(
                    text: ' xstarriver@gmail.com',
                    style: TextStyle(
                      color: const Color(0xff3A7BD5),
                      fontFamily: 'R',
                      fontSize: 9.7.sp,
                    ))
              ])),
            ],
          ),
          const CircleAvatar(
            radius: 48.5,
            backgroundColor: primaryColor,
            backgroundImage: AssetImage(callOwnMain),
          )
        ],
      )
    ];
  }
}
