import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AvatarEmail extends StatefulWidget {
  const AvatarEmail({required this.path, Key? key}) : super(key: key);
  final String path;
  @override
  State<AvatarEmail> createState() => _AvatarEmailState();
}

class _AvatarEmailState extends State<AvatarEmail> {
  File? imageFile;
  Future<void> _openGallary(BuildContext context) async {
    XFile? picture = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(picture!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              _openGallary(context);
            },
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: Colors.white),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1))
                ],
              ),
              child: imageFile != null
                  ? Image.file(imageFile!, fit: BoxFit.cover)
                  : Image.network(widget.path, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Colors.white),
                  color: Colors.blueAccent,
                ),
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
