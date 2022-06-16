import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../size_config.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn, {this.selectedImage});

  String selectedImage;
  final void Function(File pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 20);
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imagePickFn(pickedImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: _pickImage,
          child: Container(
            width: getProportionateScreenWidth(42),
            height: getProportionateScreenWidth(40),
            child: CircleAvatar(
              radius: 40,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: _pickedImage != null
                    ? Container()
                    : SvgPicture.asset(
                        "assets/icons/user.svg",
                        height: getProportionateScreenWidth(15),
                        width: getProportionateScreenWidth(15),
                      ),
              ),
              backgroundColor: kLightestGreyColor,
              backgroundImage: _pickedImage != null
                  ? FileImage(_pickedImage)
                  : (widget.selectedImage != null
                      ? NetworkImage(widget.selectedImage)
                      : null),
            ),
          ),
        ),
      ],
    );
  }
}
