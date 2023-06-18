import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';
import 'package:sizer/sizer.dart';

class FollowRequestPage extends StatefulWidget {
  const FollowRequestPage({Key? key}) : super(key: key);

  @override
  State<FollowRequestPage> createState() => _FollowRequestPageState();
}

List _followReq = [
  {
    'image': user1,
    'title': 'xstarriver',
    'subtitle': 'offical_SR',
  },
  {
    'image': user2,
    'title': 'Vinarma',
    'subtitle': 'Vin',
  },
];

class _FollowRequestPageState extends State<FollowRequestPage> {
  final Set _isReqAccepted = {};
  final Set _isFollowed = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: _followReq.isEmpty
          ? SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(emptyFollow, height: 5.0.h, color: color94),
                    heightSpace10,
                    Text('No Request found', style: color94SemiBold16)
                  ],
                ),
              ),
            )
          : filledScreen(),
    );
  }

  ListView filledScreen() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(20),
      itemCount: _followReq.length,
      itemBuilder: (context, index) {
        dynamic item = _followReq[index];
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: primaryColor.withOpacity(.25),
                    backgroundImage: AssetImage(item['image']),
                  ),
                  widthSpace10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['title'], style: blackSemiBold16),
                      Text(item['subtitle'], style: color94Regular14),
                    ],
                  ),
                  const Spacer(),
                  _isReqAccepted.contains(index)
                      ? GestureDetector(
                          onTap: () => setState(() =>
                              _isFollowed.contains(index)
                                  ? _isFollowed.remove(index)
                                  : _isFollowed.add(index)),
                          child: _isFollowed.contains(index)
                              ? Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.5),
                                  alignment: Alignment.center,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: borderRadius5,
                                      color: white,
                                      border: Border.all(color: primaryColor)),
                                  child:
                                      Text('Following', style: primaryBold14),
                                )
                              : Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.5),
                                  alignment: Alignment.center,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: borderRadius5,
                                  ),
                                  child: Text('Follow', style: whiteBold14),
                                ),
                        )
                      : Row(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() =>
                                  _isReqAccepted.contains(index)
                                      ? _isReqAccepted.remove(index)
                                      : _isReqAccepted.add(index)),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.5),
                                alignment: Alignment.center,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: borderRadius5,
                                ),
                                child: Text('Confirm', style: whiteBold14),
                              ),
                            ),
                            widthSpace10,
                            GestureDetector(
                              onTap: () {
                                setState(() => _followReq.removeAt(index));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: primaryColor,
                                        duration: const Duration(seconds: 1),
                                        content: Text(
                                          'Request removed',
                                          style: whiteSemiBold14,
                                        )));
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.5),
                                alignment: Alignment.center,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: borderRadius5,
                                    border: Border.all(color: primaryColor)),
                                child: Text('Delete', style: primaryBold14),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
            const Divider(color: colorE6, thickness: 1)
          ],
        );
      },
    );
  }

  PreferredSize appBarMethod() {
    return const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(
          title: 'Follow Request',
        ));
  }
}
