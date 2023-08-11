import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_app/src/features/authentication/profilechange.dart';
import '../../../../../common_widgets/textfild.dart';
import '../../../../../constants/size.dart';
import '../../../controller/signupcontrol.dart';
import 'package:path/path.dart';

// ignore: camel_case_types
class Profile_Page extends StatefulWidget {
  const Profile_Page({super.key});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

// ignore: camel_case_types
class _Profile_PageState extends State<Profile_Page> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  var controller = Get.put(Profilecontroller());
  bool isObscurePassword = true;
  var currentUser = FirebaseAuth.instance.currentUser;

  void updateData() async {
    final controller = Get.put(SignUpController());
    var v1 = await FirebaseFirestore.instance
        .collection('user')
        .doc(currentUser?.uid);
    v1.set({
      'username': controller.fullname.text.trim(),
      'email': controller.email.text.trim(),
      'phone': controller.phoneno.text.trim(),
      'hostelname': controller.hostelname.text.trim(),
      'imgPath': profilelink
    }, SetOptions(merge: true));
  }

  var profilelink;

  @override
  Widget build(BuildContext context) {
    Future<void> _uploadImage() async {
      if (_imageFile == null) {
        return;
      }
      final storage = FirebaseStorage.instance;
      final ref = storage.ref().child('images/${currentUser!.uid}');
      final uploadTask = ref.putFile(_imageFile!);
      profilelink = await ref.getDownloadURL();
      await uploadTask
          .whenComplete(() => print('Image uploaded to Firebase Storage'));
    }

    final controller = Get.put(SignUpController());
    var Controller = Get.find<Profilecontroller>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
              fontSize: 25.0,
              fontFamily: 'IBMPlexSans',
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.1),
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: _imageFile != null
                          ? ClipOval(
                              child: Image.file(
                                _imageFile!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Icon(
                              Icons.camera_alt,
                              size: 50,
                              color: Colors.grey[800],
                            ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4.0, color: Colors.white),
                          color: Colors.blue,
                        ),
                        child: InkWell(
                          onTap: () async {
                            _pickImage(ImageSource.gallery);
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ReuseTextField("Fullname", Icons.person_outline_rounded, false,
                  controller.fullname),
              const SizedBox(height: tFormHeight - 20),
              ReuseTextField(
                  "Email", Icons.email_outlined, false, controller.email),
              const SizedBox(height: tFormHeight - 20),
              ReuseTextField("PhoneNo", Icons.phone_in_talk_outlined, false,
                  controller.phoneno),
              const SizedBox(height: tFormHeight - 20),
              ReuseTextField("Hostel Name", Icons.hotel_sharp, false,
                  controller.hostelname),
              const SizedBox(height: tFormHeight - 20),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "CANCEL",
                      style: TextStyle(
                        fontSize: 15.0,
                        letterSpacing: 2.0,
                        fontFamily: 'IBMPlexSans',
                        color: Colors.white,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      updateData();
                      await _uploadImage();
                    },
                    child: const Text(
                      "SAVE",
                      style: TextStyle(
                        fontSize: 15.0,
                        letterSpacing: 2.0,
                        fontFamily: 'IBMPlexSans',
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 125, 55, 135),
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names

  Widget buildTextField(
      String lableText, String placeholder, bool ispasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Container(
        child: TextField(
            obscureText: ispasswordTextField ? isObscurePassword : false,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 125, 55, 135), width: 2.0),
                ),
                suffixIcon: ispasswordTextField
                    ? IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscurePassword = !isObscurePassword;
                          });
                        },
                      )
                    : null,
                // contentPadding: EdgeInsets.only(bottom: 5.0),
                labelText: lableText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: placeholder,
                hintStyle: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'IBMPlexSans',
                    fontWeight: FontWeight.w900,
                    color: Colors.grey))),
      ),
    );
  }
}
