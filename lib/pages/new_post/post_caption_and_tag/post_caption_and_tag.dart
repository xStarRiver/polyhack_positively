import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';

class PostCaptionAndTag extends StatelessWidget {
  const PostCaptionAndTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: primaryColor,
                backgroundImage: AssetImage(user13),
              ),
              widthSpace10,
              // Text('Add a caption...', style: color94Regular14),
              Expanded(
                child: TextField(
                  cursorColor: primaryColor,
                  style: color94Regular14,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add a caption...',
                      hintStyle: color94Regular14),
                ),
              ),

              widthSpace15,
              Image.asset(
                filterImage2,
                height: 52,
                width: 58,
                fit: BoxFit.cover,
              )
            ],
          ),
          heightSpace15,
          const Divider(
            color: colorE6,
            thickness: .5,
          ),
          Column(
            children: List.generate(
                2,
                (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                              index == 0 ? 'Tag People' : 'Add Location',
                              style: blackRegular16),
                        ),
                        const Divider(
                          color: colorE6,
                          thickness: .5,
                        ),
                      ],
                    )),
          )
        ],
      ),
    );
  }

  PreferredSize appBar(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: MyAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: GestureDetector(
                  onTap: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacementNamed(
                        context, '/BottomNavigation');
                  },
                  child: Text('Post', style: blackSemiBold14)),
            ),
          ],
        ));
  }
}
