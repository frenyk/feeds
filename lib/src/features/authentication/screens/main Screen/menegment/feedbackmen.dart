import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Feedbackmen extends StatefulWidget {
  const Feedbackmen({super.key});

  @override
  State<Feedbackmen> createState() => _FeedbackmenState();
}

class _FeedbackmenState extends State<Feedbackmen> {
  late Stream<QuerySnapshot> _feedback;
  @override
  void initState() {
    // TODO: implement initState
    _feedback = _redfeedback.snapshots();
  }

  CollectionReference _redfeedback =
      FirebaseFirestore.instance.collection('feedback');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedbacks"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('feedbacks').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          snapshot.data.docs[index]['feedback'],
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
