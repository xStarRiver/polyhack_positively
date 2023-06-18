import 'dart:io';

import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/widgets.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

List commentsList = [
  {
    'type': 'multi',
    'data': [
      {
        'image': user1,
        'user': 'jiyashah_',
        'isCommentFirst': false,
        'text': ['😇']
      },
      {
        'image': user2,
        'user': 'samanthaofficial ',
        'isCommentFirst': true,
        'text': ['😇']
      }
    ],
  },
  // {
  //   'type': 'single',
  //   'data': [
  //     {
  //       'image': user3,
  //       'user': 'ishaofficial.',
  //       'isCommentFirst': false,
  //       'text': ['💫 😇', '@samanthaofficial']
  //     },
  //   ],
  // },
  // {
  //   'type': 'multi',
  //   'data': [
  //     {
  //       'image': user4,
  //       'user': 'ishankhatri. ',
  //       'isCommentFirst': false,
  //       'text': ['', '@samanthaofficial', ' Nice one...']
  //     },
  //     {
  //       'image': user2,
  //       'user': 'samanthaofficial',
  //       'isCommentFirst': true,
  //       'text': ['', '\nThank you ,', '@ishankhatri']
  //     }
  //   ],
  // },
  // {
  //   'type': 'single',
  //   'data': [
  //     {
  //       'image': user5,
  //       'user': 'vaishanavi__',
  //       'isCommentFirst': false,
  //       'text': ['🌷 🌸', '@samanthaofficial']
  //     },
  //   ],
  // },
  // {
  //   'type': 'single',
  //   'data': [
  //     {
  //       'image': user6,
  //       'user': 'anujshah.__',
  //       'isCommentFirst': false,
  //       'text': ['👌', '@samanthaofficial']
  //     },
  //   ],
  // },
  // {
  //   'type': 'single',
  //   'data': [
  //     {
  //       'image': user7,
  //       'user': 'diya.___',
  //       'isCommentFirst': false,
  //       'text': ['✨ ❤️', '@samanthaofficial']
  //     },
  //   ],
  // },
  // {
  //   'type': 'multi',
  //   'data': [
  //     {
  //       'image': user8,
  //       'user': 'monaliali.',
  //       'isCommentFirst': false,
  //       'text': ['', '@samanthaofficial', '\nAdorable🔥']
  //     },
  //     {
  //       'image': user2,
  //       'user': 'samanthaofficial',
  //       'isCommentFirst': true,
  //       'text': ['', '\nThank you ,', '@monaliali']
  //     }
  //   ],
  // },
  // {
  //   'type': 'multi',
  //   'data': [
  //     {
  //       'image': user1,
  //       'user': 'jiyashah_',
  //       'isCommentFirst': false,
  //       'text': ['😇', '@samanthaofficial']
  //     },
  //     {
  //       'image': user2,
  //       'user': 'samanthaofficial ',
  //       'isCommentFirst': true,
  //       'text': ['😇']
  //     }
  //   ],
  // },
  // {
  //   'type': 'single',
  //   'data': [
  //     {
  //       'image': user3,
  //       'user': 'ishaofficial.',
  //       'isCommentFirst': false,
  //       'text': ['💫 😇', '@samanthaofficial']
  //     },
  //   ],
  // },
  // {
  //   'type': 'multi',
  //   'data': [
  //     {
  //       'image': user4,
  //       'user': 'ishankhatri. ',
  //       'isCommentFirst': false,
  //       'text': ['', '@samanthaofficial', ' Nice one...']
  //     },
  //     {
  //       'image': user2,
  //       'user': 'samanthaofficial',
  //       'isCommentFirst': true,
  //       'text': ['', '\nThank you ,', '@ishankhatri']
  //     }
  //   ],
  // },
  // {
  //   'type': 'single',
  //   'data': [
  //     {
  //       'image': user5,
  //       'user': 'vaishanavi__',
  //       'isCommentFirst': false,
  //       'text': ['🌷 🌸', '@samanthaofficial']
  //     },
  //   ],
  // },
  // {
  //   'type': 'single',
  //   'data': [
  //     {
  //       'image': user6,
  //       'user': 'anujshah.__',
  //       'isCommentFirst': false,
  //       'text': ['👌', '@samanthaofficial']
  //     },
  //   ],
  // },
  // {
  //   'type': 'single',
  //   'data': [
  //     {
  //       'image': user7,
  //       'user': 'diya.___',
  //       'isCommentFirst': false,
  //       'text': ['✨ ❤️', '@samanthaofficial']
  //     },
  //   ],
  // },
  // {
  //   'type': 'multi',
  //   'data': [
  //     {
  //       'image': user8,
  //       'user': 'monaliali.',
  //       'isCommentFirst': false,
  //       'text': ['', '@samanthaofficial', '\nAdorable🔥']
  //     },
  //     {
  //       'image': user2,
  //       'user': 'samanthaofficial',
  //       'isCommentFirst': true,
  //       'text': ['', '\nThank you ,', '@monaliali']
  //     }
  //   ],
  // },
];

class _CommentsState extends State<Comments> {
  final Set _likedComments = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration:
                BoxDecoration(color: scaffoldColor, boxShadow: [primaryBS]),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(callOwnMain),
                ),
                widthSpace10,
                Text('Comment as samanthaofficial', style: blackSemiBold14)
              ],
            ),
          ),
        ],
      ),
      appBar: appBar(),
      body: ListView(
        padding: const EdgeInsets.all(20)
            .copyWith(bottom: Platform.isAndroid ? 60 : 30),
        physics: const BouncingScrollPhysics(),
        children: [
          userTag(),
          heightSpace3,
          const Divider(color: colorE6, thickness: 1),
          heightSpace5,
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: commentsList.length,
            itemBuilder: (context, index) {
              dynamic item = commentsList[index];
              dynamic singleUser = item['data'][0];
              if (item['type'] == 'multi') {
                return multiCommentMethod(item);
              } else if (item['type'] == 'single') {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: primaryColor,
                        backgroundImage: AssetImage(singleUser['image']),
                      ),
                      widthSpace15,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          fetchTextLength(singleUser),
                          heightSpace3,
                          Text('1h  •  2like  •  Reply',
                              style: color94Regular12),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            _likedComments.contains(singleUser)
                                ? _likedComments.remove(singleUser)
                                : _likedComments.add(singleUser);
                            setState(() {});
                          },
                          child: Icon(
                              _likedComments.contains(singleUser)
                                  ? Icons.favorite_outline_rounded
                                  : Icons.favorite_rounded,
                              color: _likedComments.contains(singleUser)
                                  ? colorE6
                                  : red,
                              size: 1.8.h))
                    ],
                  ),
                );
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Padding multiCommentMethod(dynamic item) {
    dynamic upperUser = item['data'][0];
    dynamic lowerUser = item['data'][1];
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: primaryColor,
                backgroundImage: AssetImage(upperUser['image']),
              ),
              widthSpace15,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  fetchTextLength(upperUser),
                  heightSpace3,
                  Text('1h  •  2like  •  Reply', style: color94Regular12),
                ],
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    _likedComments.contains(upperUser)
                        ? _likedComments.remove(upperUser)
                        : _likedComments.add(upperUser);
                    setState(() {});
                  },
                  child: Icon(
                      _likedComments.contains(upperUser)
                          ? Icons.favorite_outline_rounded
                          : Icons.favorite_rounded,
                      color: _likedComments.contains(upperUser) ? colorE6 : red,
                      size: 1.8.h))
            ],
          ),
          heightSpace5,
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: primaryColor,
                  backgroundImage: AssetImage(lowerUser['image']),
                ),
                widthSpace15,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fetchTextLength(lowerUser),
                    heightSpace3,
                    Text('1h  •  2like  •  Reply', style: color94Regular12)
                  ],
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      _likedComments.contains(lowerUser)
                          ? _likedComments.remove(lowerUser)
                          : _likedComments.add(lowerUser);
                      setState(() {});
                    },
                    child: Icon(
                        _likedComments.contains(lowerUser)
                            ? Icons.favorite_outline_rounded
                            : Icons.favorite_rounded,
                        color:
                            _likedComments.contains(lowerUser) ? colorE6 : red,
                        size: 1.8.h))
              ],
            ),
          )
        ],
      ),
    );
  }

  Row userTag() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(callOwnMain),
          backgroundColor: primaryColor,
        ),
        widthSpace10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('samanthaofficial', style: blackSemiBold14),
            heightSpace2,
            Text('1h', style: color94Regular12),
          ],
        )
      ],
    );
  }

  PreferredSize appBar() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: MyAppBar(
        title: 'Comments',
      ),
    );
  }

  fetchTextLength(dynamic item) {
    switch (item['text'].length) {
      case 1:
        return Text.rich(TextSpan(
            text: item['user'],
            style: blackSemiBold14,
            children: [TextSpan(text: item['text'][0], style: taggedStyle)]));
      case 2:
        return Text.rich(
            TextSpan(text: item['user'], style: blackSemiBold14, children: [
          TextSpan(text: item['text'][0], style: taggedStyle, children: [
            TextSpan(text: '@samanthaofficial', style: taggedStyle)
          ]),
        ]));
      case 3:
        if (item['isCommentFirst']) {
          return SizedBox(
            width: 50.w,
            child: Text.rich(
                TextSpan(text: item['user'], style: blackSemiBold14, children: [
              TextSpan(text: item['text'][0], style: taggedStyle, children: [
                TextSpan(text: item['text'][1], style: color94SemiBold14),
                TextSpan(text: item['text'][2], style: taggedStyle),
              ]),
            ])),
          );
        } else {
          return SizedBox(
            width: 50.w,
            child: Text.rich(
                TextSpan(text: item['user'], style: blackSemiBold14, children: [
              TextSpan(text: item['text'][0], style: taggedStyle, children: [
                TextSpan(text: item['text'][1], style: taggedStyle),
                TextSpan(text: item['text'][2], style: color94SemiBold14),
              ]),
            ])),
          );
        }
    }
  }
}
