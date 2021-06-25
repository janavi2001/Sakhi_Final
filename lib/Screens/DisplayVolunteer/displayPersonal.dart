import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/components/display.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class DisplayPersonal extends StatelessWidget {
  final String firstname;
  DisplayPersonal(this.firstname, {Key key}) : super(key: key);

  // String _printdetails(String x){
  // final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   String user = FirebaseAuth.instance.currentUser.uid;
  //   String a = '';
  //   var users = firestore.collection("Volunter").doc(user).collection("Patient").doc(firstname).get().then((DocumentSnapshot ds ) => a = ds['$x']);
  //   return a;

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
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return new Text("Loading");
                }
                var  userdocument = snapshot.data;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Center(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            ExactAssetImage("assets/images/avatar.png"),
                        backgroundColor: headingColor,
                      ),
                    ),
                    
                    Display(label: 'Name', value:userdocument["firstName"]),
                    Display(label: 'Age', value: userdocument["age"]),
                    Display(label: 'Gender', value: userdocument["gender"]),
                    Display(label: 'Phone Number', value:userdocument["phone"]),
                    Display(label: 'Village Name', value: userdocument["village"]),
                    Display(label: 'Address', value: userdocument["address"]),
                    Display(label: 'Caste', value: userdocument["caste"]),
                    Display(label: 'Family Members', value: userdocument["family"]),
                    Display(label: 'Education', value: userdocument["education"]),
                    Display(label: 'Profession', value: userdocument["profession"]),
                    Display(label: 'Working Class', value: userdocument["working class"]),
                    Display(label: 'Marriage status', value: userdocument["marriage"]),
                    
                  ],
                );
              }),
        ),
      ),
    );
  }
}
