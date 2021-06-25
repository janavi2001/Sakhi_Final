import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_tutorial/components/dropdown.dart';
import 'package:firebase_authentication_tutorial/constants.dart';
import 'package:flutter/material.dart';

import 'displayMental.dart';
import 'displayPersonal.dart';
import 'displayPhysical.dart';
import 'displayPrescriptions.dart';

class VolunteerTabs extends StatefulWidget {
  final String firstname;
  VolunteerTabs(this.firstname, {Key key}) : super(key: key);

  @override
  _VolunteerTabsState createState() => _VolunteerTabsState();
}

class _VolunteerTabsState extends State<VolunteerTabs> {
  List<String> dates = [];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String user = FirebaseAuth.instance.currentUser.uid;
  @override
  void initState() {
    super.initState();
    print('inside init state');
    _create();
    print('after create');
  }

  @override
  List<String> _create() {
    print('inside create');
    FirebaseFirestore.instance
        .collection('Volunter')
        .doc(user)
        .collection('Patient')
        .doc(widget.firstname.toLowerCase())
        .collection('Health_Record')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        dates.add(element.id.toString());
      });
    });
    
    setState(() {
      dates = dates;
    });
  
  }

  // FirebaseFirestore.instance
  //     .collection('Volunter')
  //     .doc(user)
  //     .collection('Patient')
  //     .doc(widget.firstname.toLowerCase())
  //     .collection('Health_Record')
  //     .get()
  //     .then((QuerySnapshot querySnapshot) {
  //   querySnapshot.docs.forEach((element) {
  //     dates.add(element.id.toString());
  //   });
  //   print(dates);

  String date = '';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: headingColor,
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                  child: Text('Doctor\'s Prescription',
                      style: TextStyle(color: textColor))),
              Tab(
                  child: Text('Personal Details',
                      style: TextStyle(color: textColor))),
              Tab(
                  child: Text('Physical Details',
                      style: TextStyle(color: textColor))),
              Tab(
                  child: Text('Mental Health',
                      style: TextStyle(color: textColor))),
              Tab(child: Text('Date', style: TextStyle(color: textColor))),
            ],
          ),
          title: Text(widget.firstname, style: TextStyle(color: headingColor)),
        ),
        body: TabBarView(
          children: <Widget>[
            DisplayPrescription(),
            DisplayPersonal(widget.firstname),
            DisplayPhysical(widget.firstname),
            DisplayMental(),
            Center(
              child: MyDropdown(
                dropList: dates,
                //dropList: ['yes', 'no'],
                //dropList: _create(),
                labelText: 'Dates:',
                onSelected: (String val) {
                  setState(() => date = val);

                  print(dates);
                  print(val);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
