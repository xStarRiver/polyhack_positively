import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _nameController = TextEditingController(text: 'xstarriver');
  final _userNameController = TextEditingController(text: 'xStarRiver');
  final _emailController = TextEditingController(text: 'xstarriver@gmail.com');
  final _phoneController = TextEditingController(text: '+852 1234 5678');
  final _descriptionController = TextEditingController(
      text:
          'xStarRiver\n👨🏻‍💻Fullstack Developer\n💻Founder - @visionerse\n📩Gmail : xstarriver@gmail.com');
  @override
  void dispose() {
    _nameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          editImage(context),
          heightSpace10,
          AuthTextField(
            controller: _nameController,
            labelText: 'Name',
            hintText: "Enter your name",
            hintStyle: blackRegular18,
            style: blackRegular18,
          ),
          heightSpace20,
          AuthTextField(
            controller: _userNameController,
            labelText: 'User Name',
            hintText: "Enter your username",
            hintStyle: blackRegular18,
            style: blackRegular18,
          ),
          heightSpace20,
          AuthTextField(
            controller: _emailController,
            labelText: 'Email Address',
            hintText: "Enter your email",
            hintStyle: blackRegular18,
            style: blackRegular18,
          ),
          heightSpace20,
          AuthTextField(
            controller: _phoneController,
            labelText: 'Phone Number',
            hintText: "Enter your phonenumber",
            hintStyle: blackRegular18,
            style: blackRegular18,
          ),
          heightSpace20,
          AuthTextField(
            controller: _descriptionController,
            labelText: 'Description',
            hintText: "Enter description",
            textInputAction: TextInputAction.done,
            hintStyle: blackRegular18,
            style: blackRegular18,
          ),
          heightSpace40,
          PrimaryButton(
            text: 'Update Profile',
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  Center editImage(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 120,
        child: Stack(
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => showEditSheet(context),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: primaryColor,
                backgroundImage: AssetImage(callOwnMain),
              ),
            ),
            Positioned(
              bottom: -5,
              right: -2.5,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => showEditSheet(context),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: white, width: 2)),
                  child: const Icon(
                    Icons.add,
                    size: 12,
                    color: white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  PreferredSize appBar() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: MyAppBar(
        title: 'Edit Profile',
      ),
    );
  }

  void showEditSheet(BuildContext context) {
    List editItems = [
      'Take a picture',
      'Select from gallery',
      'Remove profile picture'
    ];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
      builder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 23),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            Center(child: Text('Choose Option', style: blackSemiBold20)),
            heightSpace10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  editItems.length,
                  (index) => GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(editItems[index],
                                    style: blackRegular16),
                              ),
                            ],
                          ),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
