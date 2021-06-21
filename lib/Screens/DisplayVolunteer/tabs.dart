import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_tutorial/constants.dart';
import 'package:flutter/material.dart';

import 'displayMental.dart';
import 'displayPersonal.dart';
import 'displayPhysical.dart';
import 'displayPrescriptions.dart';

class VolunteerTabs extends StatelessWidget {
  final String firstname;
  VolunteerTabs(this.firstname, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
            ],
          ),
          title: Text('Details: $firstname',
              style: TextStyle(color: headingColor)),
        ),
        body: TabBarView(
          children: <Widget>[
            DisplayPrescription(),
            DisplayPersonal(),
            DisplayPhysical(),
            DisplayMental(),
          ],
        ),
      ),
    );
  }
}
