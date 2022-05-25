import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    required this.path,
    Key? key}) : super(key: key);
  final String path;
  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    Future pickImage() async{
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null){
          return;
        }
        final imageTemporary = File(image.path);
        setState(() {
          this._image = imageTemporary;
        });
      } on PlatformException catch (e){

      }
    }
    return Center(
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              pickImage();
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
                      color: Colors.black.withOpacity(0.1)
                  )
                ],
              ),
              child: widget.path != null ? Image.network(widget.path,fit: BoxFit.fill) : Container(),
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
                  border: Border.all(
                      width: 4,
                      color: Colors.white
                  ),
                  color: Colors.blueAccent,
                ),
                child: Icon(Icons.edit,color: Colors.white,)
            ),
          ),
        ],
      ),
    );
  }
}