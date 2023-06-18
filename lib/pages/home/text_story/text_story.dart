import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants.dart';

class TextStory extends StatefulWidget {
  const TextStory({Key? key}) : super(key: key);

  @override
  State<TextStory> createState() => _TextStoryState();
}

List _gradientColors = [
  [const Color.fromRGBO(0, 210, 255, 1), const Color.fromRGBO(58, 123, 213, 1)],
  [const Color.fromRGBO(0, 245, 160, 1), const Color.fromRGBO(0, 217, 245, 1)],
  [
    const Color.fromRGBO(200, 78, 137, 1),
    const Color.fromRGBO(241, 95, 121, 1)
  ],
  [const Color.fromRGBO(148, 0, 211, 1), const Color.fromRGBO(75, 0, 130, 1)],
  [
    const Color.fromRGBO(0, 82, 212, 1),
    const Color.fromRGBO(67, 100, 247, 1),
    const Color.fromRGBO(111, 177, 252, 1),
  ],
  [const Color.fromRGBO(255, 224, 0, 1), const Color.fromRGBO(121, 159, 12, 1)],
  [const Color.fromRGBO(96, 56, 19, 1), const Color.fromRGBO(178, 159, 148, 1)],
];

class _TextStoryState extends State<TextStory> {
  final _textController = TextEditingController(text: 'Hello 🤚🏻');
  bool isDone = false;
  int _selectedColorIndex = 0;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      child: Scaffold(
        body: Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: _gradientColors[_selectedColorIndex],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  SafeArea(
                    bottom: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.close,
                            color: white,
                          ),
                        ),
                        isDone
                            ? Row(
                                children: List.generate(
                                    3,
                                    (index) => Padding(
                                          padding: index != 2
                                              ? const EdgeInsets.only(right: 15)
                                              : EdgeInsets.zero,
                                          child: Image.asset(
                                            index == 0
                                                ? edit1
                                                : index == 1
                                                    ? createStoryType1
                                                    : edit2,
                                            height: 16,
                                          ),
                                        )),
                              )
                            : GestureDetector(
                                onTap: () => setState(() => isDone = true),
                                child: Text('Done', style: whiteSemiBold14))
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    height: 80.h,
                    child: TextField(
                      cursorColor: white,
                      controller: _textController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: whiteExtraBold20,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: isDone
                          ? Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () => Navigator.popUntil(
                                    context, (route) => route.isFirst),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 9, horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: white,
                                  ),
                                  child: Text('Share Story',
                                      style: shareStoryStyle),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(_gradientColors.length,
                                    (index) {
                                  bool isSelected =
                                      _selectedColorIndex == index;
                                  return GestureDetector(
                                    onTap: () => setState(
                                        () => _selectedColorIndex = index),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              colors: _gradientColors[index]),
                                          border: Border.all(
                                              color: white, width: 1.5)),
                                      child: isSelected
                                          ? const Icon(
                                              Icons.check,
                                              color: white,
                                              size: 20,
                                            )
                                          : null,
                                    ),
                                  );
                                }),
                              ),
                            ))
                ],
              ),
            )),
      ),
    );
  }
}
