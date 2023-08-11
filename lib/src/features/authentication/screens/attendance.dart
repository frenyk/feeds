import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'qrScannerpage.dart';

class Qrpage extends StatefulWidget {
  const Qrpage({super.key});

  @override
  State<Qrpage> createState() => _QrpageState();
}

class _QrpageState extends State<Qrpage> {
  bool isCheck = false;
  List<Map> availableHobbies = [
    {"name": "21dce011", "isChecked": false},
    {"name": "21dce021", "isChecked": false},
    {
      "name": "21dce064",
      "isChecked": false,
    },
    {"name": "21dce001", "isChecked": false},
    {"name": "21dce002", "isChecked": false},
    {
      "name": "21dce003",
      "isChecked": false,
    },
    {"name": "21dce004", "isChecked": false},
    {"name": "21dce005", "isChecked": false},
    {
      "name": "21dce006",
      "isChecked": false,
    },
    {"name": "21dce007", "isChecked": false},
    {"name": "21dce008", "isChecked": false},
    {
      "name": "21dce009",
      "isChecked": false,
    },
    {"name": "21dce011", "isChecked": false},
    {"name": "21dce012", "isChecked": false},
    {
      "name": "21dce013",
      "isChecked": false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 10),

            // The checkboxes will be here
            Column(
                children: availableHobbies.map((hobby) {
              return CheckboxListTile(
                  value: hobby["isChecked"],
                  title: Text(hobby["name"]),
                  onChanged: (newValue) {
                    setState(() {
                      hobby["isChecked"] = newValue;
                    });
                  });
            }).toList()),

            // Display the result here

            const SizedBox(height: 10),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.qr_code_scanner),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MaterialApp(
                              home: QRViewExample(),
                            )));
              },
            ),
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Attendance Saved!"),
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
