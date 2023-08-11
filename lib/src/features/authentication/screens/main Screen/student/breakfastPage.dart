// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class breakfastPage extends StatefulWidget {
  const breakfastPage({super.key});

  @override
  State<breakfastPage> createState() => _breakfastPageState();
}

class _breakfastPageState extends State<breakfastPage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  String i1 = '';
  String i2 = '';
  String i3 = '';
  String i4 = '';
  String i5 = '';
  String i6 = '';

  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var v1 = await FirebaseFirestore.instance
        .collection('Food')
        .doc('Breakfast')
        .get();
    setState(() {
      i1 = v1.data()!['item1'];
      i2 = v1.data()!['item2'];
      i3 = v1.data()!['item3'];
      i4 = v1.data()!['item4'];
      i5 = v1.data()!['item5'];
      i6 = v1.data()!['item6'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 198, 132, 207),
        title: Text('Breakfast',
            style: GoogleFonts.merriweather(
                textStyle:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.w600))),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 20,
          ),
          FilledCardExample(item: i1),
          SizedBox(
            height: 20,
          ),
          FilledCardExample(item: i2),
          SizedBox(
            height: 20,
          ),
          FilledCardExample(item: i3),
          SizedBox(
            height: 20,
          ),
          FilledCardExample(item: i4),
          SizedBox(
            height: 20,
          ),
          FilledCardExample(item: i5),
          SizedBox(
            height: 20,
          ),
          FilledCardExample(item: i6),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              color: Color.fromARGB(255, 198, 132, 207),
              height: 70.0,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundIconButton(
                      text: Text(
                        '🤩',
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                    RoundIconButton(
                      text: Text(
                        '😊',
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                    RoundIconButton(
                      text: Text(
                        '🙂',
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                    RoundIconButton(
                      text: Text(
                        '😐',
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                    RoundIconButton(
                      text: Text(
                        '😑',
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class FilledCardExample extends StatelessWidget {
  FilledCardExample({super.key, required this.item});
  final String item;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: SizedBox(
          width: 300,
          height: 70,
          child: Center(
              child: Text(
            item,
            style: TextStyle(fontSize: 22),
          )),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.text});
  final Widget text;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: text,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color.fromARGB(255, 198, 132, 207),
    );
  }
}
