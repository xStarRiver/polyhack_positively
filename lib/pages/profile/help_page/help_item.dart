import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';

import '../../../utils/widgets.dart';

class HelpItem extends StatelessWidget {
  const HelpItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List helpItem = [
      'Managing your account',
      'test',
    ];
    return Scaffold(
      appBar: appBar(),
      body: ListView.builder(
        itemCount: helpItem.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: Text(
            helpItem[index],
            style: index == 0 ? blackSemiBold18 : color94Regular14,
          ),
        ),
      ),
    );
  }

  PreferredSize appBar() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: MyAppBar(title: 'Help'),
    );
  }
}
