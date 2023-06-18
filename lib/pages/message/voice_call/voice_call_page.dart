import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants.dart';

class VoiceCallPage extends StatelessWidget {
  const VoiceCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List buttonsList = [
      {'icon': callMute, 'title': 'Mute'},
      {'icon': callVideo, 'title': 'Video Call'},
      {'icon': callEnd, 'title': 'End'},
    ];
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(callMain), fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
                color: black.withOpacity(.90),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(buttonsList.length, (index) {
                  dynamic item = buttonsList[index];
                  return GestureDetector(
                    onTap: () {
                      if (index == 2) {
                        Navigator.pop(context);
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          item['icon'],
                          height: 3.5.h,
                        ),
                        heightSpace15,
                        Text(item['title'], style: whiteSemiBold18)
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
