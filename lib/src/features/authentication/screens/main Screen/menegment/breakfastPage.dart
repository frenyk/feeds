import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class breakfastPage extends StatefulWidget {
  const breakfastPage({Key? key}) : super(key: key);

  @override
  State<breakfastPage> createState() => _breakfastPageState();
}

class _breakfastPageState extends State<breakfastPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);
  var item_1 = '';
  var item_2 = '';
  var item_3 = '';
  var item_4 = '';
  var item_5 = '';
  var item_6 = '';
  int count = 1;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BreakFast',
            style:
                GoogleFonts.merriweather(textStyle: TextStyle(fontSize: 22))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: 'Items name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //
                      String name = nameController.text.trim();
                      if (name.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contacts.add(Contact(name: name));
                        });
                        if (count == 1) {
                          item_1 = name;
                        } else if (count == 2) {
                          item_2 = name;
                        } else if (count == 3) {
                          item_3 = name;
                        } else if (count == 4) {
                          item_4 = name;
                        } else if (count == 5) {
                          item_5 = name;
                        } else if (count == 6) {
                          item_6 = name;
                        }
                        FirebaseFirestore.instance
                            .collection('Food')
                            .doc("Breakfast")
                            .set({
                          'item1': item_1,
                          'item2': item_2,
                          'item3': item_3,
                          'item4': item_4,
                          'item5': item_5,
                          'item6': item_6,
                        });
                        count++;
                      }
                      //
                    },
                    child: const Text('Add')),
                ElevatedButton(
                    onPressed: () {
                      //
                      String name = nameController.text.trim();
                      if (name.isNotEmpty) {
                        setState(() {
                          nameController.text = '';

                          contacts[selectedIndex].name = name;

                          selectedIndex = -1;
                        });
                      }
                      //
                    },
                    child: const Text('Update')),
              ],
            ),
            const SizedBox(height: 10),
            contacts.isEmpty
                ? const Text(
                    'No items yet..',
                    style: TextStyle(fontSize: 22),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    nameController.text = contacts[index].name;
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      contacts.removeAt(index);
                    });
                    //
                  }),
                  child: const SizedBox(width: 45, child: Icon(Icons.delete))),
            ],
          ),
        ),
      ),
    );
  }
}

class Contact {
  String name;
  Contact({required this.name});
}
