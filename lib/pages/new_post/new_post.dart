import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';
import 'package:sizer/sizer.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

List _photos = [
  photos1,
  photos2,
  photos3,
  photos4,
  photos5,
  photos6,
  photos7,
  photos8,
  photos9,
  photos10,
  photos11,
  photos12,
];
List _dropDownItems = ['Photos', 'Gallery', 'Camera', 'Crop Images'];

class _NewPostState extends State<NewPost> {
  String _selectedImage = _photos[0];
  Object _dropdownValue = _dropDownItems[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20).copyWith(bottom: 0),
        children: [
          Image.asset(
            _selectedImage,
            height: 336,
            width: 100.w,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _dropdownValue,
                  items: _dropDownItems
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e, style: blackSemiBold16),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => _dropdownValue = value!),
                ),
              ),
            ],
          ),
          GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _photos.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => setState(() => _selectedImage = _photos[index]),
                child: Image.asset(
                  _photos[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: MyAppBar(
        title: 'New Post',
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              color: black,
            )),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/CustomizePost',
                  arguments: _selectedImage),
              icon: const Icon(
                Icons.arrow_forward,
                color: black,
              )),
        ],
      ),
    );
  }
}
