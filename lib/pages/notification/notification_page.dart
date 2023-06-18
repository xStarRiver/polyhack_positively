import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';
import 'package:sizer/sizer.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

List _notificationsList = [
  {
    'type': 'followingYou',
    'data': {
      'userPic': suggestedPerson2,
      'title': 'ngan_tommy started following you',
      'time': '3 minutes ago',
    }
  },
];

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          followRequests(),
          _notificationsList.isEmpty
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        emptyNotification,
                        color: color94,
                        height: 4.5.h,
                      ),
                      heightSpace10,
                      Text('No new notification', style: color94SemiBold16)
                    ],
                  ),
                )
              : filledScreen(),
        ],
      ),
    );
  }

  Expanded filledScreen() {
    return Expanded(
        child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 50, top: 20),
      itemCount: _notificationsList.length,
      itemBuilder: (context, index) {
        dynamic item = _notificationsList[index];
        dynamic dataItem = item['data'];
        switch (item['type']) {
          case 'followingYou':
            return Dismissible(
              key: Key('$item'),
              background: Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: primaryColor,
              ),
              onDismissed: (direction) {
                setState(() => _notificationsList.removeAt(index));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: primaryColor,
                    duration: const Duration(seconds: 1),
                    content: Text(
                      'Notification removed',
                      style: whiteSemiBold14,
                    )));
              },
              child: followingYou(
                userPic: dataItem['userPic'],
                title: dataItem['title'],
                time: dataItem['time'],
              ),
            );
          case 'likedThreePhotos':
            return Dismissible(
              key: Key('$item'),
              background: Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: primaryColor,
              ),
              onDismissed: (direction) {
                setState(() => _notificationsList.removeAt(index));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: primaryColor,
                    duration: const Duration(seconds: 1),
                    content: Text(
                      'Notification removed',
                      style: whiteSemiBold14,
                    )));
              },
              child: likedThreePhotos(
                userPic: dataItem['userPic'],
                title: dataItem['title'],
                images: dataItem['images'],
                time: dataItem['time'],
              ),
            );
          case 'likedSinglePhoto':
            return Dismissible(
              key: Key('$item'),
              background: Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: primaryColor,
              ),
              onDismissed: (direction) {
                setState(() => _notificationsList.removeAt(index));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: primaryColor,
                    duration: const Duration(seconds: 1),
                    content: Text(
                      'Notification removed',
                      style: whiteSemiBold14,
                    )));
              },
              child: likedSinglePhoto(
                userPic: dataItem['userPic'],
                title: dataItem['title'],
                image: dataItem['image'],
                time: dataItem['time'],
              ),
            );
          case 'mentionedInCommented':
            return Dismissible(
              key: Key('$item'),
              background: Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: primaryColor,
              ),
              onDismissed: (direction) {
                setState(() => _notificationsList.removeAt(index));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: primaryColor,
                    duration: const Duration(seconds: 1),
                    content: Text(
                      'Notification removed',
                      style: whiteSemiBold14,
                    )));
              },
              child: mentionedYou(
                userPic: dataItem['userPic'],
                userName: dataItem['userName'],
                comment: dataItem['comment'],
              ),
            );
          case 'likedFourPhotos':
            return Dismissible(
              key: Key('$item'),
              background: Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: primaryColor,
              ),
              onDismissed: (direction) {
                setState(() => _notificationsList.removeAt(index));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: primaryColor,
                    duration: const Duration(seconds: 1),
                    content: Text(
                      'Notification removed',
                      style: whiteSemiBold14,
                    )));
              },
              child: likeFourPhotos(
                userPic: dataItem['userPic'],
                title: dataItem['title'],
                images: dataItem['images'],
                time: dataItem['time'],
              ),
            );
          case 'likedByMultiUsers':
            return Dismissible(
              key: Key('$item'),
              background: Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: primaryColor,
              ),
              onDismissed: (direction) {
                setState(() => _notificationsList.removeAt(index));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: primaryColor,
                    duration: const Duration(seconds: 1),
                    content: Text(
                      'Notification removed',
                      style: whiteSemiBold14,
                    )));
              },
              child: likedByMultiUsers(
                userPic1: dataItem['userPic1'],
                userPic2: dataItem['userPic2'],
                title: dataItem['title'],
                image: dataItem['image'],
                time: dataItem['time'],
              ),
            );
          case 'postFromYearAgo':
            return Dismissible(
              key: Key('$item'),
              background: Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: primaryColor,
              ),
              onDismissed: (direction) {
                setState(() => _notificationsList.removeAt(index));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: primaryColor,
                    duration: const Duration(seconds: 1),
                    content: Text(
                      'Notification removed',
                      style: whiteSemiBold14,
                    )));
              },
              child: postFromYearAgo(
                title: dataItem['title'],
                image: dataItem['image'],
                time: dataItem['time'],
              ),
            );

          default:
            return const SizedBox();
        }
      },
    ));
  }

  Widget postFromYearAgo({
    required String title,
    required String image,
    required String time,
  }) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: transparent,
            child: Image.asset(
              yearAgoPost,
              height: 20,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: blackSemiBold14),
              heightSpace4,
              Text(time, style: color94Regular12),
            ],
          ),
          trailing: ClipRRect(
            borderRadius: borderRadius5,
            child: Image.asset(
              image,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: colorE6,
            thickness: 1,
            height: 18,
          ),
        )
      ],
    );
  }

  Widget likedByMultiUsers({
    required String userPic1,
    required String userPic2,
    required String title,
    required String image,
    required String time,
  }) {
    return Column(
      children: [
        ListTile(
          leading: SizedBox(
            width: 50,
            height: 150,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: colorE6,
                  backgroundImage: AssetImage(userPic1),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: colorE6,
                    backgroundImage: AssetImage(userPic2),
                  ),
                ),
              ],
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: blackSemiBold14),
              heightSpace2,
              Text(time, style: color94Regular12),
            ],
          ),
          trailing: PushNavigate(
            navigate: 'Posts',
            child: ClipRRect(
              borderRadius: borderRadius5,
              child: Image.asset(
                image,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: colorE6,
            thickness: 1,
            height: 18,
          ),
        )
      ],
    );
  }

  Widget likeFourPhotos(
      {required String userPic,
      required String title,
      required List images,
      required String time}) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: colorE6,
            backgroundImage: AssetImage(userPic),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Smiti Khan liked 4 photos', style: blackSemiBold14),
              heightSpace6,
              Padding(
                padding: const EdgeInsets.only(right: 12.5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        4,
                        (index) => ClipRRect(
                              borderRadius: borderRadius5,
                              child: Image.asset(
                                images[index],
                                height: 66.8,
                                fit: BoxFit.cover,
                              ),
                            ))),
              ),
              heightSpace6,
              Text('50 minutes ago', style: color94Regular12),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: colorE6,
            thickness: 1,
            height: 18,
          ),
        )
      ],
    );
  }

  Widget mentionedYou(
      {required String userPic,
      required String userName,
      required String comment}) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: colorE6,
            backgroundImage: AssetImage(userPic),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(text: userName, style: blackBold14, children: [
                  TextSpan(
                      text: ' mentioned you in a commented: ',
                      style: blackSemiBold14),
                  TextSpan(text: '@samanthaofficial ', style: blueSemiBold14),
                  TextSpan(text: comment, style: blackSemiBold14),
                ]),
              ),
              heightSpace1,
              Text('35 minutes ago', style: color94Regular12),
            ],
          ),
          trailing: PushNavigate(
            navigate: 'Comments',
            child: ClipRRect(
              borderRadius: borderRadius5,
              child: Image.asset(
                gallery1,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: colorE6,
            thickness: 1,
            height: 18,
          ),
        )
      ],
    );
  }

  Widget likedSinglePhoto(
      {required String userPic,
      required String title,
      required String time,
      required String image}) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: colorE6,
            backgroundImage: AssetImage(userPic),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: blackSemiBold14),
              heightSpace4,
              Text(time, style: color94Regular12),
            ],
          ),
          trailing: PushNavigate(
            navigate: 'Posts',
            child: ClipRRect(
              borderRadius: borderRadius5,
              child: Image.asset(
                image,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: colorE6,
            thickness: 1,
            height: 18,
          ),
        )
      ],
    );
  }

  Widget likedThreePhotos(
      {required String userPic,
      required String title,
      required List images,
      required String time}) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: colorE6,
            backgroundImage: AssetImage(userPic),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: blackSemiBold14),
              heightSpace6,
              Row(
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: index != 2
                                ? const EdgeInsets.only(right: 10)
                                : const EdgeInsets.only(right: 0),
                            child: ClipRRect(
                              borderRadius: borderRadius5,
                              child: Image.asset(
                                images[index],
                                width: 66.8,
                                height: 66.8,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))),
              heightSpace6,
              Text(time, style: color94Regular12),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: colorE6,
            thickness: 1,
            height: 18,
          ),
        )
      ],
    );
  }

  Widget followingYou(
      {required String userPic, required String title, required String time}) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: colorE6,
            backgroundImage: AssetImage(userPic),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: blackSemiBold14),
              heightSpace4,
              Text(time, style: color94Regular12),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: colorE6,
            thickness: 1,
            height: 18,
          ),
        )
      ],
    );
  }

  Padding followRequests() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
      child: PushNavigate(
        navigate: 'FollowRequestPage',
        child: Row(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 70,
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  width: 70,
                  child: const CircleAvatar(
                    backgroundColor: colorE6,
                    radius: 30,
                    backgroundImage: AssetImage(followReq),
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: 15,
                    child: Text('2', style: whiteBold14),
                  ),
                )
              ],
            ),
            widthSpace10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Follow Request', style: blackSemiBold18),
                Text('Approve or ignore requests', style: color94Regular14),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: false,
      elevation: 3,
      shadowColor: colorForShadow.withOpacity(.30),
      backgroundColor: appBarColor,
      title: Text(
        'Notifications',
        style: blackSemiBold20,
      ),
    );
  }
}
