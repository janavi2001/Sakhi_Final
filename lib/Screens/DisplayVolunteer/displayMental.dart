import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/components/display.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class DisplayMental extends StatefulWidget {
  final String firstname;
  final String val;

  const DisplayMental(this.firstname, this.val, {Key key}) : super(key: key);

  @override
  _DisplayMentalState createState() => _DisplayMentalState();
}

class _DisplayMentalState extends State<DisplayMental> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String user = FirebaseAuth.instance.currentUser.uid;
    return new Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Volunter')
                  .doc(user)
                  .collection("Patient")
                  .doc(widget.firstname.toLowerCase())
                  .collection("Health_Record")
                  .doc(widget.val)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return new Text("Loading");
                }
                var userdocument = snapshot.data;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Display(
                        label: 'Able to concentrate',
                        value: userdocument["concentration"].toString()),
                    Display(
                        label: 'Loss of Sleep over worry',
                        value: userdocument["lossSleep"].toString()),
                    Display(
                        label:
                            'Feel like they are playing a useful part in life',
                        value: userdocument["useful"].toString()),
                    Display(
                        label: 'Capable of making decisions',
                        value: userdocument["decisions"].toString()),
                    
                    Display(
                        label: 'Feeling constantly stressed or under strain',
                        value: userdocument["stress"].toString()),
                    Display(
                        label: 'Could overcome difficulties',
                        value: userdocument["difficulty"].toString(),
                        ),
                    Display(
                        label: 'Able to enjoy day-to-day activities',
                        value: userdocument["enjoy"].toString()),
                    Display(
                        label: 'Able to face problems and issues',
                        value: userdocument["problems"].toString()),
                    Display(
                        label: 'Feeling Unhappy or depressed',
                        value: userdocument["unhappy"].toString()),
                    Display(
                        label: 'Have Confidence',
                        value: userdocument["confidence"].toString()),
                    Display(
                        label: 'Thinking of self as worthless',
                        value: userdocument["worthless"].toString()),
                    Display(
                        label: 'Feeling Reasonably Happy',
                        value: userdocument["happy"].toString()),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
