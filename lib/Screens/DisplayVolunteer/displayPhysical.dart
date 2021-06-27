import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/components/display.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class DisplayPhysical extends StatelessWidget {
  final String firstname;
  final String val;

  DisplayPhysical(this.firstname, this.val, {Key key}) : super(key: key);

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
                  .doc(firstname.toLowerCase())
                  .collection("Health_Record")
                  .doc(val)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: new Text("Choose Date"));
                }
                var userdocument = snapshot.data;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Display(
                        label: 'Tiredness', value: userdocument["tiredness"].toString()),
                    Display(
                        label: 'Aches or Pains', value: userdocument["pains"].toString()),
                    Display(
                        label: 'Sore Throat',
                        value: userdocument["soreThroat"].toString()),
                    Display(
                        label: 'Diarrohea', value: userdocument["diarrhoea"].toString()),
                    Display(
                        label: 'Conjuctivitis',
                        value: userdocument["conjuctivitis"].toString()),
                    Display(label: 'Headache', value: userdocument["headache"].toString()),
                    Display(
                        label: 'Loss of taste',
                        value: userdocument["lossTaste"].toString()),
                    Display(
                        label: 'Loss of smell',
                        value: userdocument["lossSmell"].toString()),
                    Display(
                        label: 'Discolouration of fingers/toes',
                        value: userdocument["discoloration"].toString()),
                    Display(
                        label: 'Rashes on skin', value: userdocument["rash"].toString()),
                    Display(
                        label: 'Shortness of breath',
                        value: userdocument["breathe"].toString()),
                    Display(
                        label: 'Chest Pain', value: userdocument["chestPain"].toString()),
                    Display(
                        label: 'Loss of movement',
                        value: userdocument["lossMovement"].toString()),
                    Display(
                        label: 'Loss of speech',
                        value: userdocument["lossSpeech"].toString()),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
