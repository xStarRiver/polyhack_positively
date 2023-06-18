import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

List imagesTypes = [
  'Style',
  'Travel',
  'Nature',
  'Decor',
  'Art',
  'Animal',
  'Beauty',
];

class _SearchState extends State<Search> {
  int _selectedType = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          selectTypes(),
          gridImages(),
        ],
      ),
    );
  }

  SizedBox selectTypes() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: imagesTypes.length,
        itemBuilder: (context, index) {
          String item = imagesTypes[index];
          bool isSelected = _selectedType == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedType = index),
            child: Container(
              margin: index == 0
                  ? const EdgeInsets.only(right: 5)
                  : index == imagesTypes.length - 1
                      ? const EdgeInsets.only(left: 5)
                      : const EdgeInsets.symmetric(horizontal: 5),
              width: 80,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: isSelected ? primaryColor : colorB7)),
              child: Center(
                  child: Text(item,
                      style:
                          isSelected ? primarySemiBold16 : colorB7SemiBold16)),
            ),
          );
        },
      ),
    );
  }

  StaggeredGridView gridImages() {
    List gridItems = [
      {
        'type': 'image',
        'image': [gridImage01]
      },
      {
        'type': 'video',
        'image': [gridVideo1]
      },
      {
        'type': 'image',
        'image': [gridImage02]
      },
      {
        'type': 'image',
        'image': [gridImage03]
      },
      {
        'type': 'image',
        'image': [gridImage04]
      },
      {
        'type': 'image',
        'image': [gridImage05]
      },
      {
        'type': 'image',
        'image': [gridImage06]
      },
      {
        'type': 'image',
        'image': [gridImage07]
      },
      {
        'type': 'image',
        'image': [gridImage08]
      },
      {
        'type': 'image',
        'image': [gridImage09]
      },
      {
        'type': 'image',
        'image': [gridImage10]
      },
      {
        'type': 'image',
        'image': [gridImage11]
      },
      {
        'type': 'video',
        'image': [gridVideo2, gridVideo2]
      },
      {
        'type': 'image',
        'image': [gridImage12]
      },
      {
        'type': 'image',
        'image': [gridImage13]
      },
      {
        'type': 'image',
        'image': [gridImage14]
      },
      {
        'type': 'image',
        'image': [gridImage15]
      },
      {
        'type': 'image',
        'image': [gridImage16]
      },
      {
        'type': 'image',
        'image': [gridImage17]
      },
      {
        'type': 'image',
        'image': [gridImage18]
      },
      {
        'type': 'image',
        'image': [gridImage19]
      },
      {
        'type': 'image',
        'image': [gridImage20]
      },
      {
        'type': 'image',
        'image': [gridImage21]
      },
      {
        'type': 'image',
        'image': [gridImage22]
      },
    ];

    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20).copyWith(top: 0),
      crossAxisCount: 3,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      itemCount: gridItems.length,
      itemBuilder: (context, index) {
        dynamic item = gridItems[index];
        return GestureDetector(
          onTap: () {
            if (item['type'] != 'image') {
              Navigator.pushNamed(context, '/VideosPage');
            }
          },
          child: Container(
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(item['image'][0]))),
            child: item['type'] != 'image'
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                    child: Text(item['image'].length > 1 ? 'Videos' : 'Video',
                        style: whiteSemiBold16),
                  )
                : const SizedBox(),
          ),
        );
      },
      staggeredTileBuilder: (int index) {
        switch (gridItems[index]['type']) {
          case 'image':
            return StaggeredTile.count(
                1, gridItems[index]['type'] == 'image' ? 1.05 : 2.10);
          case 'video':
            return const StaggeredTile.count(2, 2.10);
        }
        return null;
      },
    );
  }

  PreferredSize appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(130),
      child: AppBar(
        backgroundColor: appBarColor,
        elevation: 3,
        shadowColor: colorForShadow.withOpacity(.30),
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10).copyWith(bottom: 8.5),
                child: Image.asset(arrowBack))),
        flexibleSpace: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: white,
              borderRadius: borderRadius10,
              boxShadow: [primaryBS],
            ),
            child: Row(
              children: [
                Image.asset(
                  searchIcon,
                  color: color94,
                  height: 16,
                ),
                widthSpace10,
                Expanded(
                  child: PushNavigate(
                    navigate: 'SearchByCategory',
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'Search here...',
                        hintStyle: color94Regular14,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
