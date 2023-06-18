import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          heightSpace5,
          tabBars(),
          tabBarView(),
        ],
      ),
    );
  }

  Expanded tabBarView() {
    return Expanded(
      child: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: _tabController,
          children: [chatsTab(), callsTab()]),
    );
  }

  Widget callsTab() {
    String fetchText(String callType) {
      switch (callType) {
        case 'incoming':
          return 'Incoming Call';
        case 'outgoing':
          return 'Outgoing Call';
        case 'missed':
          return 'Missed Call';
      }
      return '';
    }

    Color fetchColor(String callType) {
      switch (callType) {
        case 'incoming':
          return onlineColor;
        case 'outgoing':
          return const Color(0xffFFAC33);
        case 'missed':
          return const Color(0xffFF0000);
      }
      return const Color(0xffFFFFFF);
    }

    List callsList = [
      {
        'image': user1,
        'isOnline': true,
        'name': 'Johnny',
        'callType': 'missed',
        'time': '10:50 am',
      },
    ];
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: callsList.length,
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
      itemBuilder: (context, index) {
        dynamic item = callsList[index];
        return Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: primaryColor,
                    backgroundImage: AssetImage(item['image']),
                  ),
                  item['isOnline'] == true
                      ? Positioned(
                          right: 5,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: onlineColor,
                                shape: BoxShape.circle,
                                border: Border.all(color: white, width: 1.5)),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['name'], style: blackSemiBold16),
                      Text.rich(TextSpan(
                          text: fetchText(item['callType']),
                          style: TextStyle(
                              color: fetchColor(item['callType']),
                              fontFamily: 'SB',
                              fontSize: 9.7.sp),
                          children: [
                            TextSpan(
                                text: ' ${item['time']}',
                                style: color94Regular14)
                          ]))
                    ],
                  ),
                  Row(
                    children: List.generate(
                        2,
                        (index) => Container(
                              margin: index == 0
                                  ? const EdgeInsets.only(right: 7.5)
                                  : const EdgeInsets.only(left: 7.5),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: white,
                                boxShadow: [primaryBS],
                              ),
                              child: GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context,
                                    index == 0
                                        ? '/VideoCallPage'
                                        : '/VoiceCallPage'),
                                child: Icon(
                                    index == 0
                                        ? Icons.videocam_sharp
                                        : Icons.call,
                                    color: black,
                                    size: index == 0 ? 20 : 18),
                              ),
                            )),
                  )
                ],
              ),
            ),
            const Divider(color: colorE6)
          ],
        );
      },
    );
  }

  Widget chatsTab() {
    List onlineUsers = [
      {'image': storyBy1, 'name': 'Johnny'},
      {'image': user2, 'name': 'Vin'},
    ];
    Widget onlineUser() {
      return SizedBox(
        height: 65,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: onlineUsers.length,
          itemBuilder: (context, index) {
            int lastIndex = onlineUsers.length - 1;
            dynamic item = onlineUsers[index];
            return Padding(
              padding: index == 0
                  ? const EdgeInsets.only(right: 15)
                  : index == lastIndex
                      ? const EdgeInsets.only(left: 5)
                      : const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: primaryColor.withOpacity(.25),
                        backgroundImage: AssetImage(item['image']),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 5,
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: Color(0xff35CB00),
                        ),
                      )
                    ],
                  ),
                  heightSpace6,
                  Container(
                      alignment: Alignment.center,
                      width: 60,
                      child: Text(item['name'], style: blackRegular12))
                ],
              ),
            );
          },
        ),
      );
    }

    Widget recentChats() {
      List chatsList = [
        {
          'image': storyBy1,
          'name': 'Johnny',
          'time': '10:50 am',
          'isOnline': true,
        },
        {
          'image': user2,
          'name': 'Vin',
          'time': '10:30 am',
          'isOnline': true,
        },
      ];
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding:
            const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 40),
        shrinkWrap: true,
        itemCount: chatsList.length,
        itemBuilder: (context, index) {
          dynamic item = chatsList[index];
          return Column(
            children: [
              ListTile(
                onTap: () => Navigator.pushNamed(context, '/ChatRoom'),
                contentPadding: EdgeInsets.zero,
                leading: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: primaryColor,
                      backgroundImage: AssetImage(item['image']),
                    ),
                    item['isOnline'] == true
                        ? Positioned(
                            right: 5,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: onlineColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: white, width: 1.5)),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['name'], style: blackSemiBold16),
                    Text('Hello', style: color94Regular14),
                  ],
                ),
                trailing: Text(item['time'], style: blackSemiBold12),
              ),
              const Divider(color: colorE6),
            ],
          );
        },
      );
    }

    return Column(
      children: [
        heightSpace20,
        onlineUser(),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              heightSpace15,
              recentChats(),
            ],
          ),
        ),
      ],
    );
  }

  Widget tabBars() {
    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: colorB7, width: 1.5),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SizedBox(
            height: 35,
            child: TabBar(
              physics: const BouncingScrollPhysics(),
              overlayColor: MaterialStateProperty.all(transparent),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              indicatorColor: primaryColor,
              labelColor: primaryColor,
              unselectedLabelColor: colorB7,
              labelStyle: primarySemiBold16,
              unselectedLabelStyle: colorB7SemiBold16,
              controller: _tabController,
              tabs: const [
                Tab(text: 'Chats'),
                Tab(text: 'Call'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: false,
      elevation: 3,
      shadowColor: colorForShadow.withOpacity(.30),
      backgroundColor: appBarColor,
      title: Text(
        'Message',
        style: blackSemiBold20,
      ),
      actions: [
        IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/SearchConverstaion'),
            icon: const Icon(
              Icons.search,
              color: black,
            ))
      ],
    );
  }
}
