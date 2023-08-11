import 'package:flutter/material.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({super.key});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
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
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('img/img.jpg'),
                        ),
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
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              buildTextField("Full Name", "user", false),
              buildTextField("Email", "user@gmail.com", false),
              buildTextField("Password", "********", true),
              buildTextField("Hostel Name", "hostel", false),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "CANCLE",
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
                    onPressed: () {},
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
