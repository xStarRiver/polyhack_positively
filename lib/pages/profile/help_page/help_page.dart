import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List helpItems = [
      'Managing your account',
      'Using social media',
      'Managing your account',
      'Troubleshooting and login help',
      'Learn about privacy settings',
      'Controlling your visibility',
      'Blocking people',
      'Report something',
    ];
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          Text('Popular Topics', style: blackSemiBold18),
          heightSpace8,
          Column(
            children: List.generate(
                helpItems.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 13),
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/HelpItem'),
                        child: Row(
                          children: [
                            Text(helpItems[index], style: blackRegular16),
                            const Spacer(),
                            const Icon(Icons.chevron_right, color: black)
                          ],
                        ),
                      ),
                    )),
          )
        ],
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
