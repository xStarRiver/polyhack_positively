import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:positively/utils/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:story_view/story_view.dart';

class OpenStoryPage extends StatefulWidget {
  const OpenStoryPage({Key? key}) : super(key: key);

  @override
  State<OpenStoryPage> createState() => _OpenStoryPageState();
}

class _OpenStoryPageState extends State<OpenStoryPage> {
  final FocusNode _focus = FocusNode();
  final StoryController _storyController = StoryController();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _storyController.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focus.hasFocus) {
      _storyController.pause();
    } else {
      _storyController.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Stack(
            children: [
              StoryView(
                storyItems: [
                  StoryItem.pageImage(
                    url:
                        "https://images.unsplash.com/photo-1543731068-7e0f5beff43a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80",
                    imageFit: BoxFit.cover,
                    controller: _storyController,
                  ),
                ],
                onStoryShow: (s) {},
                onComplete: () {
                  Navigator.pop(context);
                },
                progressPosition: ProgressPosition.top,
                repeat: false,
                controller: _storyController,
                inline: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(top: Platform.isAndroid ? 45 : 85),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: colorB7,
                      backgroundImage: AssetImage(storyBy1),
                    ),
                    widthSpace5,
                    Text('Shree Patel', style: whiteRegular12),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                        color: white,
                        size: 2.h,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      width: 80.w,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        cursorColor: primaryColor,
                        controller: _controller,
                        focusNode: _focus,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: 'Type Message...',
                            hintStyle: color94Regular12),
                      ),
                    ),
                    Image.asset(
                      sendIcon,
                      height: 2.9.h,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
