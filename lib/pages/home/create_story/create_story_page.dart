import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';

class CreateStoryPage extends StatefulWidget {
  const CreateStoryPage({Key? key}) : super(key: key);

  @override
  State<CreateStoryPage> createState() => _CreateStoryPageState();
}

class _CreateStoryPageState extends State<CreateStoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appBar(context),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 20),
        physics: const BouncingScrollPhysics(),
        children: [
          createStoryType(),
          ...gallaryImages(),
        ],
      ),
    );
  }

  SizedBox createStoryType() {
    List createStoryTypes = [
      {
        'image': createStoryType1,
        'title': 'Text Story',
      },
      {
        'image': createStoryType2,
        'title': 'Camera',
      },
      {
        'image': createStoryType3,
        'title': 'Music',
      },
      {
        'image': createStoryType4,
        'title': 'Selfie',
      },
      {
        'image': createStoryType5,
        'title': 'Boomerang',
      },
    ];
    List colors = [
      [
        const Color.fromRGBO(0, 210, 255, 1),
        const Color.fromRGBO(58, 123, 213, 1)
      ],
      [
        const Color.fromRGBO(248, 87, 166, 1),
        const Color.fromRGBO(255, 88, 88, 1)
      ],
      [
        const Color.fromRGBO(255, 226, 89, 1),
        const Color.fromRGBO(255, 125, 81, 1)
      ],
      [
        const Color.fromRGBO(121, 159, 12, 1),
        const Color.fromRGBO(172, 187, 120, 1)
      ],
      [
        const Color.fromRGBO(76, 184, 196, 1),
        const Color.fromRGBO(60, 211, 173, 1)
      ],
    ];
    return SizedBox(
      height: 135,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20).copyWith(bottom: 15),
        itemCount: createStoryTypes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          dynamic item = createStoryTypes[index];
          return PushNavigate(
            navigate: 'TextStory',
            child: Container(
              height: 100,
              width: 90,
              margin: index == 0
                  ? const EdgeInsets.only(right: 5)
                  : index == createStoryTypes.length - 1
                      ? const EdgeInsets.only(left: 5)
                      : const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  borderRadius: borderRadius10,
                  gradient: LinearGradient(
                      colors: colors[index],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    item['image'],
                    height: 23,
                    width: 30,
                  ),
                  heightSpace5,
                  Text(
                    item['title'],
                    style: whiteSemiBold14,
                  ),
                  heightSpace7
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: -7,
      elevation: 3,
      shadowColor: colorForShadow.withOpacity(.30),
      backgroundColor: appBarColor,
      leading: IconButton(
        icon: const Icon(Icons.close, color: black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Create Story',
        style: blackSemiBold20,
      ),
    );
  }

  List<Widget> gallaryImages() {
    List gallaryImages = [
      gallery1,
      gallery2,
      gallery3,
      gallery4,
      gallery5,
      gallery6,
      gallery7,
      gallery8,
      gallery9,
      gallery10,
      gallery11,
      gallery12,
      gallery13,
      gallery14,
      gallery15,
      gallery1,
      gallery17,
      gallery18,
    ];
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text('Gallery', style: blackSemiBold18),
      ),
      GridView.builder(
        itemCount: gallaryImages.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20).copyWith(bottom: 0),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: .80),
        itemBuilder: (context, index) {
          return Image.asset(
            gallaryImages[index],
            fit: BoxFit.cover,
          );
        },
      )
    ];
  }
}
