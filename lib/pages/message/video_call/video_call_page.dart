import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants.dart';

class VideoCallPage extends StatelessWidget {
  const VideoCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List buttonsList = [
      {'icon': callEffect, 'title': 'Effect'},
      {'icon': callMute, 'title': 'Mute'},
      {'icon': callFlip, 'title': 'Flip'},
      {'icon': callEnd, 'title': 'End'},
    ];
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(callMain), fit: BoxFit.cover)),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Jiya shah', style: whiteBold20),
                          Text('02:35 min', style: whiteSemiBold14),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: borderRadius10,
                        child: Image.asset(
                          callOwnMain,
                          height: 150,
                          width: 150,
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
                        if (index == 3) {
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
      ),
    );
  }
}
