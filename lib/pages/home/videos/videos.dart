import 'package:flutter/material.dart';
import 'package:positively/pages/home/videos/video_content.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';
import 'package:sizer/sizer.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({Key? key}) : super(key: key);

  @override
  State<VideosPage> createState() => _VideosPageState();
}

List _videos = [
  seaview,
  roadview,
  natureview,
  seaview,
  roadview,
  natureview,
];
Set _favouriteVideo = {};

class _VideosPageState extends State<VideosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: PageView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: List.generate(
                _videos.length,
                (index) => Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        VideoContent(asset: _videos[index]),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(0.7),
                                    height: 35,
                                    width: 35,
                                    decoration: const BoxDecoration(
                                        color: white, shape: BoxShape.circle),
                                    child: Image.asset(suggestedPerson1),
                                  ),
                                  widthSpace10,
                                  Text.rich(TextSpan(
                                      text: 'realtinashah',
                                      style: whiteSemiBold14,
                                      children: [
                                        TextSpan(
                                            text: ' \u2022 ',
                                            style: whiteSemiBold16),
                                        TextSpan(
                                            text: 'Follow',
                                            style: whiteSemiBold16),
                                      ]))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25)
                                      .copyWith(top: 6),
                              child: Row(
                                children: [
                                  Image.asset(
                                    videoTag,
                                    height: 2.h,
                                  ),
                                  Transform.translate(
                                    offset: const Offset(-5, 0),
                                    child: Text(
                                        ' Arijit Singh , Shreya Ghosal • Qaafirana',
                                        style: whiteRegular12),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(32, 16, 22, 20),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                      _favouriteVideo.contains(index)
                                          ? _favouriteVideo.remove(index)
                                          : _favouriteVideo.add(index);
                                    },
                                    child: Icon(
                                      Icons.favorite_rounded,
                                      color: _favouriteVideo.contains(index)
                                          ? favColor
                                          : white,
                                      size: 2.5.h,
                                    ),
                                  ),
                                  widthSpace20,
                                  Image.asset(commentVideoIcon, height: 2.h),
                                  widthSpace20,
                                  Image.asset(shareVideoIcon, height: 2.h),
                                  const Spacer(),
                                  Icon(
                                    Icons.favorite_rounded,
                                    color: white,
                                    size: 1.5.h,
                                  ),
                                  widthSpace5,
                                  Text(
                                    '125k',
                                    style: TextStyle(
                                      color: white,
                                      fontFamily: 'SB',
                                      fontSize: 8.6.sp,
                                    ),
                                  ),
                                  widthSpace10,
                                  Image.asset(commentVideoIcon, height: 1.3.h),
                                  widthSpace5,
                                  Text(
                                    '550',
                                    style: TextStyle(
                                      color: white,
                                      fontFamily: 'SB',
                                      fontSize: 8.6.sp,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ))));
  }

  PreferredSize appBar() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: MyAppBar(title: 'Videos'),
    );
  }
}
