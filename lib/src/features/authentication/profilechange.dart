
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Profilecontroller extends GetxController {
  var ImgPath = ''.obs;

  changeImage(context) async {
    try{
      final img = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if(img == null) return;
      ImgPath.value =img.path;
    }on PlatformException catch(e){
     showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
    
  }
}
