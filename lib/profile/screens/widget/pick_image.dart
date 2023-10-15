import 'dart:io';
//
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        //onTap: pickimage,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: image == null
                ? Image.asset('image/defultImage.png', height: 120, width: 120)
                : Image.file(image!, height: 120, width: 120)));
  }

  // Future<void> pickimage() async {
  //   var _image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (_image != null) {
  //     setState(() {
  //       image = File(_image.path);
  //     });
  //   }
  // }
}

File? image;
