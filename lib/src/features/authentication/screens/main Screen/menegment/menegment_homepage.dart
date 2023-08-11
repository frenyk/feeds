import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:login_app/src/features/authentication/screens/main%20Screen/menegment/feedbackmen.dart';
import 'package:login_app/src/features/authentication/screens/welcome_screen.dart';
import '../../../../../graph.dart';
import '../../attendance.dart';
import 'breakfastPage.dart';
import 'lunchPage.dart';
import 'dinnerPage.dart';
import 'profilepage.dart';

const activeColor = Color(0xff1d1e33);
const inactiveColour = Color(0xff111328);
var now = DateTime.now();
// ignore: non_constant_identifier_names
String Format = DateFormat('dd-MM-yyyy').format(now);

// ignore: camel_case_types
class Homepage_men extends StatefulWidget {
  const Homepage_men({super.key});

  @override
  State<Homepage_men> createState() => _Homepage_menState();
}

// ignore: camel_case_types
class _Homepage_menState extends State<Homepage_men> {
  Color bCardColor = inactiveColour;
  Color lCardColor = inactiveColour;
  Color dCardColor = inactiveColour;
  //1=breakfast 2=lunch 3=dinner
  void updateColor(int choice) {
    if (choice == 1) {
      if (bCardColor == inactiveColour) {
        bCardColor = activeColor;
        lCardColor = inactiveColour;
        dCardColor = inactiveColour;
      }
    }
    if (choice == 2) {
      if (lCardColor == inactiveColour) {
        lCardColor = activeColor;
        bCardColor = inactiveColour;
        dCardColor = inactiveColour;
      }
    }
    if (choice == 3) {
      if (dCardColor == inactiveColour) {
        dCardColor = activeColor;
        lCardColor = inactiveColour;
        bCardColor = inactiveColour;
      }
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  String uname = '';
  String pno = '';
  String hname = '';
  String imglink = '';

  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var v1 = await FirebaseFirestore.instance
        .collection('user')
        .doc(user?.uid)
        .get();
    setState(() {
      uname = v1.data()!['username'];
      pno = v1.data()!['phone'];
      hname = v1.data()!['hostelname'];
      imglink = v1.data()!['imgPath'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Format.toString(),
          style: const TextStyle(
              fontFamily: 'IBMPlexSans',
              fontWeight: FontWeight.w600,
              fontSize: 22.0),
        ),
        backgroundColor: const Color.fromARGB(255, 198, 132, 207),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 300.0,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 198, 132, 207),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60.0,
                      child: imglink != ''
                          ? ClipOval(
                              child: Image.network(
                                imglink,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Icon(
                              Icons.camera_alt,
                              size: 50,
                              color: Colors.grey[800],
                            ),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text(
                      uname,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'IBMPlexSans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text(
                      pno,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'IBMPlexSans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text(
                      '$hname Hostel',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'IBMPlexSans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Scaffold(body: GraphPage());
                        },
                      ),
                    );
                  },
                  title: Text('Graph',
                      style: GoogleFonts.merriweather(
                          textStyle: TextStyle(fontSize: 22))),
                  leading: const Icon(
                    Icons.auto_graph,
                    size: 35,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Scaffold(body: Feedbackmen());
                        },
                      ),
                    );
                  },
                  title: Text('Feedback',
                      style: GoogleFonts.merriweather(
                          textStyle: TextStyle(fontSize: 22))),
                  leading: const Icon(
                    Icons.feedback_outlined,
                    size: 35,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Scaffold(body: Qrpage());
                        },
                      ),
                    );
                  },
                  title: Text('Attendance',
                      style: GoogleFonts.merriweather(
                          textStyle: TextStyle(fontSize: 22))),
                  leading: const Icon(
                    Icons.qr_code,
                    size: 35,
                  ),
                ),
                ListTile(
                  onTap: () {
                    var auth = FirebaseAuth.instance;
                    auth.signOut().then((value) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen())));
                  },
                  title: Text('Logout',
                      style: GoogleFonts.merriweather(
                          textStyle: TextStyle(fontSize: 22))),
                  leading: const Icon(
                    Icons.logout_outlined,
                    size: 35,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const breakfastPage();
                    },
                  ),
                );
                setState(() {
                  updateColor(1);
                });
              },
              child: Rescode(
                colour: bCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text(
                        'Breakfast',
                        style: TextStyle(
                            fontSize: 40.0,
                            fontFamily: 'IBMPlexSans',
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const lunchPage();
                    },
                  ),
                );
                setState(() {
                  updateColor(2);
                });
              },
              child: Rescode(
                colour: lCardColor,
                childCard: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      'Lunch',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontFamily: 'IBMPlexSans',
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const dinnerPage();
                    },
                  ),
                );
                setState(() {
                  updateColor(3);
                });
              },
              child: Rescode(
                colour: dCardColor,
                childCard: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text(
                        'Dinner',
                        style: TextStyle(
                            fontSize: 40.0,
                            fontFamily: 'IBMPlexSans',
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Rescode extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  Rescode({required this.colour, required this.childCard});
  Color colour;
  Widget childCard;
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: sort_child_properties_last
      child: childCard,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
