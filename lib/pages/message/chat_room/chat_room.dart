import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

List _chats = [

  {
    'msgType': 'singleText',
    'sender': 'friend',
    'msg': 'what happened?',
    'time': '10:50 am',
  },
  {
    'msgType': 'singleText',
    'sender': 'friend',
    'msg': 'yes, i posted a new photo in positive-ly app',
    'time': '10:50 am',
  },
  {
    'msgType': 'singleText',
    'sender': 'user',
    'msg': 'i saw your new post',
    'time': '10:49 am',
  },
  {
    'msgType': 'multiText',
    'sender': 'friend',
    'msgList': ['hi', ' whats up?'],
    'time': '10:48 am',
  },
];

class _ChatRoomState extends State<ChatRoom> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            reverse: true,
            padding: const EdgeInsets.all(20),
            itemCount: _chats.length,
            itemBuilder: (context, index) {
              dynamic item = _chats[index];
              bool isSendByUser = item['sender'] == 'user';
              String msgType = item['msgType'];
              switch (msgType) {
                case 'singleText':
                  return singleText(isSendByUser, item);
                case 'textWithImage':
                  return textWithImage(item);
                case 'multiText':
                  return multiText(item);
              }
              return null;
            },
          )),
          writeMessage()
        ],
      ),
    );
  }

  Row textWithImage(item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 65.w),
                child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 6, 6, 10),
                    decoration: BoxDecoration(
                      borderRadius: borderRadius5.copyWith(
                          bottomRight: const Radius.circular(0)),
                      color: primaryColor,
                    ),
                    child: Text(item['msg'], style: whiteRegular12))),
            heightSpace5,
            SizedBox(
              width: 65.w,
              child: Row(
                children: List.generate(
                    item['images'].length,
                    (index) => Expanded(
                          child: Padding(
                            padding: index == 0
                                ? const EdgeInsets.only(right: 2.5)
                                : index == 3
                                    ? const EdgeInsets.only(left: 2.5)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 2.5),
                            child: Image.asset(
                              item['images'][index],
                            ),
                          ),
                        )),
              ),
            ),
            heightSpace2,
            Text(item['time'], style: color94SemiBold10)
          ],
        ),
        widthSpace5,
        const Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: CircleAvatar(
            radius: 12.5,
            backgroundColor: colorE6,
            backgroundImage: AssetImage(user1),
          ),
        )
      ],
    );
  }

  Padding writeMessage() {
    return Padding(
      padding: const EdgeInsets.all(20.0).copyWith(top: 10),
      child: Row(
        children: [
          Image.asset(clipIcon, height: 2.h),
          widthSpace8,
          Image.asset(smileIcon, height: 2.h),
          widthSpace8,
          Expanded(
            child: TextField(
              controller: _textController,
              style: color94Regular12,
              cursorColor: primaryColor,
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Write your Message...',
                hintStyle: color94Regular12,
                focusedBorder: OutlineInputBorder(
                    borderRadius: borderRadius10,
                    borderSide: const BorderSide(color: primaryColor)),
                border: OutlineInputBorder(borderRadius: borderRadius10),
              ),
            ),
          ),
          widthSpace12,
          GestureDetector(
              onTap: () {
                if (_textController.text.trim().isNotEmpty) {
                  _chats.insert(
                    0,
                    {
                      'msgType': 'singleText',
                      'sender': 'user',
                      'msg': _textController.text.trim(),
                      'time': '10:51 am',
                    },
                  );
                  setState(() {});
                }
              },
              child: Image.asset(msgSend, height: 2.2.h))
        ],
      ),
    );
  }

  Widget singleText(bool isSendByUser, dynamic item) {
    if (isSendByUser) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: borderRadius5.copyWith(
                          bottomRight: const Radius.circular(0)),
                      color: isSendByUser ? primaryColor : chatContainerColor),
                  child: Text(item['msg'], style: whiteRegular12),
                ),
                Text(item['time'], style: color94SemiBold10)
              ],
            ),
            widthSpace5,
            const CircleAvatar(
              radius: 12.5,
              backgroundColor: colorE6,
              backgroundImage: AssetImage(user1),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment:
              isSendByUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 12.5,
              backgroundColor: colorE6,
              backgroundImage: AssetImage(storyBy1),
            ),
            widthSpace5,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: borderRadius5.copyWith(
                          bottomLeft: const Radius.circular(0)),
                      color: isSendByUser ? primaryColor : chatContainerColor),
                  child: Text(item['msg'], style: blackRegular12),
                ),
                Text(item['time'], style: color94SemiBold10)
              ],
            ),
          ],
        ),
      );
    }
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: -7,
      elevation: 3,
      shadowColor: colorForShadow.withOpacity(.30),
      backgroundColor: appBarColor,
      leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10).copyWith(bottom: 8.5),
              child: Image.asset(arrowBack))),
      title: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 17.5,
                backgroundColor: primaryColor,
                backgroundImage: AssetImage(storyBy1),
              ),
              Container(
                height: 8.75,
                width: 8.75,
                decoration: BoxDecoration(
                  color: onlineColor,
                  border: Border.all(color: white),
                  shape: BoxShape.circle,
                ),
              )
            ],
          ),
          widthSpace10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('xstarriver', style: blackSemiBold14),
              Text('Online', style: color94Regular12),
            ],
          )
        ],
      ),
      actions: List.generate(
          3,
          (index) => Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.pushNamed(context, '/VideoCallPage');
                    } else if (index == 1) {
                      Navigator.pushNamed(context, '/VoiceCallPage');
                    }
                  },
                  child: Icon(
                    index == 0
                        ? Icons.videocam
                        : index == 1
                            ? Icons.call
                            : Icons.more_vert,
                    color: black,
                  ),
                ),
              )),
    );
  }

  Widget multiText(item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const CircleAvatar(
          radius: 12.5,
          backgroundColor: colorE6,
          backgroundImage: AssetImage(storyBy1),
        ),
        widthSpace5,
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                item['msgList'].length,
                (index) => Container(
                  margin: index == 0
                      ? const EdgeInsets.only(bottom: 2.5)
                      : const EdgeInsets.only(top: 2.5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: borderRadius5.copyWith(
                          bottomLeft: const Radius.circular(0)),
                      color: chatContainerColor),
                  child: Text(item['msgList'][index], style: blackRegular12),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
