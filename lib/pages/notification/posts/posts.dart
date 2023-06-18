import 'package:flutter/material.dart';
import 'package:positively/utils/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

List _stories = [post1, post2, post3, post4, post5];

class _PostsState extends State<Posts> {
  final Set _likedContents = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _stories.length,
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
          itemBuilder: (context, index) {
            dynamic item = _stories[index];
            return Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: circleAvtarColor,
                      backgroundImage: AssetImage(suggestedPerson1),
                    ),
                    widthSpace10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tina Shah', style: blackSemiBold14),
                        heightSpace2,
                        Text('Allentown, New Mexico', style: color94Regular12),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(moreVertIcon, height: 18)
                  ],
                ),
                heightSpace4,
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ipsum amet pellentesque in rhoncus, in erat. Placerat et nunc ipsum donec urna feugiat suspendisse.',
                    style: color94Regular12),
                heightSpace10,
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.bottomCenter,
                  height: 192,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: borderRadius10,
                      color: colorE6,
                      image: DecorationImage(
                          image: AssetImage(item), fit: BoxFit.cover)),
                  child: Container(
                    width: 100.w,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 11.5),
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
                            Text('10k Likes', style: color94SemiBold14),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              commentsIcon,
                              height: 13,
                            ),
                            widthSpace10,
                            Text('100 Comments', style: color94SemiBold14),
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
            );
          }),
    );
  }
}

PreferredSize appBar() {
  return const PreferredSize(
    preferredSize: Size.fromHeight(56),
    child: MyAppBar(
      title: 'Posts',
    ),
  );
}
