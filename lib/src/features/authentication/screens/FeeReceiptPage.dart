import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class FeeReceiptPage extends StatefulWidget {
  const FeeReceiptPage({super.key});

  @override
  State<FeeReceiptPage> createState() => _FeeReceiptPageState();
}

class _FeeReceiptPageState extends State<FeeReceiptPage> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fee Receipt')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              //height: 150,
              // decoration: BoxDecoration(
              // border: Border.all(width: 4, color: Colors.white),
              //  boxShadow: [
              //     BoxShadow(
              //      spreadRadius: 2,
              ///     blurRadius: 10.0,
              //   color: Colors.black.withOpacity(0.1),
              //    )
              //  ],
              //  shape: BoxShape.circle,
              // ),
              child: _imageFile != null
                  ? Image.file(
                      _imageFile!,
                      fit: BoxFit.cover,
                    )
                  : Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.grey[800],
                    ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
              },
              child: Text('Add Fee Receipt')),
          ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
              },
              child: Text('Submit'))
        ],
      ),
    );
  }
}
