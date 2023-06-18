import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';
import 'package:readmore/readmore.dart';

class AccountPrivacy extends StatefulWidget {
  const AccountPrivacy({Key? key}) : super(key: key);

  @override
  State<AccountPrivacy> createState() => _AccountPrivacyState();
}

class _AccountPrivacyState extends State<AccountPrivacy> {
  bool isAccPrivate = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            children: [
              Text('Enable Positive-ly', style: blackSemiBold18),
              const Spacer(),
              Transform.scale(
                scale: .75,
                child: CupertinoSwitch(
                    activeColor: primaryColor,
                    trackColor: colorE6,
                    value: isAccPrivate,
                    onChanged: (value) => setState(() => isAccPrivate = value)),
              ),
            ],
          ),
          heightSpace17,
          ReadMoreText(
            'Our software tool utilizes advanced natural language processing and sentiment analysis techniques to automatically identify and replace negative words with positive alternatives, fostering a more supportive and uplifting online environment.',
            trimLines: 4,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Learn more.',
            trimExpandedText: ' Learn less.',
            style: color94Regular14,
            moreStyle: primaryBold14,
            lessStyle: primaryBold14,
          )
        ],
      ),
    );
  }

  PreferredSize appBar() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: MyAppBar(
        title: 'Account Privacy',
      ),
    );
  }
}
