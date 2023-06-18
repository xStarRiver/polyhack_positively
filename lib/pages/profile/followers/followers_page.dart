import 'package:flutter/material.dart';
import 'package:positively/utils/widgets.dart';

import '../../../utils/constants.dart';

class FollowersPage extends StatefulWidget {
  const FollowersPage({Key? key}) : super(key: key);

  @override
  State<FollowersPage> createState() => _FollowersPageState();
}

List followersList = [
  {
    'image': user1,
    'title': 'xstarriver',
    'subtitle': 'offical_SR',
  },
  {
    'image': user2,
    'title': 'Vineamra',
    'subtitle': 'Vin',
  },
  {
    'image': user3,
    'title': 'Tommy.',
    'subtitle': 'nganwai',
  },
];

class _FollowersPageState extends State<FollowersPage> {
  final Set _following = {1, 2, 3, 4, 6, 7, 8, 9, 11, 12, 13, 14, 16, 17, 18};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView.builder(
        itemCount: followersList.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          var item = followersList[index];
          bool isFollowing = _following.contains(index);
          return Column(children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: primaryColor,
                backgroundImage: AssetImage(item['image']),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['title'], style: blackSemiBold16),
                  Text(item['subtitle'], style: color94Regular14)
                ],
              ),
              trailing: GestureDetector(
                onTap: () => setState(() => _following.contains(index)
                    ? _following.remove(index)
                    : _following.add(index)),
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 32.5,
                  decoration: BoxDecoration(
                    color: isFollowing ? primaryColor : scaffoldColor,
                    borderRadius: borderRadius5,
                    border:
                        isFollowing ? null : Border.all(color: primaryColor),
                  ),
                  child: Text(isFollowing ? 'Follow' : 'Following',
                      style: isFollowing ? whiteBold14 : primaryBold14),
                ),
              ),
            ),
            const Divider(
              color: colorE6,
              thickness: 1,
            )
          ]);
        },
      ),
    );
  }

  PreferredSize appBar() {
    return const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(
          title: 'Followers',
        ));
  }
}
