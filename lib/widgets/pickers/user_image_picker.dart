import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);

  final void Function(File? pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  final ImagePicker _imagePicker = ImagePicker();

  File? _pickedImage;

  void _pickImage() async{
    final pickedImageFile = await _imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50, maxWidth: 150);
    setState(() {
      _pickedImage = File(pickedImageFile!.path);
    });
    widget.imagePickFn(_pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 40, backgroundColor: Colors.grey, backgroundImage: _pickedImage != null ? FileImage(_pickedImage!) : null),
        TextButton.icon(onPressed: _pickImage, icon: Icon(Icons.image), label: Text('Add image'),),
      ],
    );
  }
}
