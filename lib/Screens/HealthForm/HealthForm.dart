//import 'dart:html';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import '/components/dropdown_field.dart';
import '/components/number_field.dart';
import '/screens/HealthForm/physical.dart';
import '/constants.dart';
import 'package:flutter/material.dart';
import '/components/normal_textfield.dart';
import '/components/icon_textfield.dart';

class HealthForm extends StatefulWidget {
  @override
  _HealthFormState createState() => _HealthFormState();
}

class _HealthFormState extends State<HealthForm> {
  //final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController disability = TextEditingController();
  TextEditingController bloodGroup = TextEditingController();
  TextEditingController hbCounts = TextEditingController();
  TextEditingController bp = TextEditingController();
  TextEditingController sugarLevel = TextEditingController();
  TextEditingController oxygenLevel = TextEditingController();
  TextEditingController pulse = TextEditingController();
  TextEditingController temperature = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Health Details of Patient",
            style: TextStyle(color: headingColor)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            BuildIconField(
              controller: disability,
              labelText: 'Any Disability?',
              icon: Icon(Icons.wheelchair_pickup),
            ),
            BuildIconField(
              controller: bloodGroup,
              labelText: 'Blood Group',
              icon: Icon(Icons.bloodtype),
            ),
            Row(
              children: [
                NumberField(
                  controller: hbCounts,
                  labelText: 'HB Counts',
                ),
                NumberField(controller: pulse, labelText: 'Pulse'),
              ],
            ),
            Row(
              children: [
                NumberField(controller: sugarLevel, labelText: 'Sugar Level'),
                NumberField(controller: oxygenLevel, labelText: 'Oxygen Level'),
              ],
            ),
            Row(
              children: [
                NumberField(controller: bp, labelText: 'Blood Pressure'),
                NumberField(controller: temperature, labelText: 'Temperature'),
              ],
            ),
            Row(
              children: <Widget>[
                NumberField(controller: height, labelText: 'Height'),
                NumberField(controller: weight, labelText: 'Weight'),
              ],
            ),
            SizedBox(height: 30),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Text("Previous"),
                    onPressed: () => {
                      Navigator.pop(context),
                    },
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                      child: Text("Next"),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhysicalHealthForm()),
                        );
                      }),
                ],
              ),
            ),
            SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }

/*FIREBASE CRUD OPERATIONS
  void _create() async {
    try {
      await firestore.collection('users').doc(name.text).set({
        'firstName': name.text,
        'village': village.text,
        'caste':caste.text,
        'family':family.text,
        'education':education.text,
        'age':age.text,
        'phone':phone.text

      });
    } catch (e) {
      print(e);
    }
  }

  void _secondaryData() async {
    try {
      await firestore
          .collection('users')
          .doc(name.text)
          .collection("secdata")
          .doc("day1")
          .set({'firstName': 'John', 'lastName': 'Peter', 'PatientID': 'John'});
    } catch (e) {
      print(e);
    }
  }

  

  void _read() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot =
          await firestore.collection('users').doc('thilak').get();
          Map<String, dynamic>? mapEventData = documentSnapshot.data();
      print(mapEventData);
    } catch (e) {
      print(e);
    }
  }

  void _update() async {
    try {
      firestore.collection('users').doc('testUser').update({
        'prec': 'Alan',
      });
    } catch (e) {
      print(e);
    }
  }

  void _delete() async {
    try {
      firestore.collection('users').doc('testUser').delete();
    } catch (e) {
      print(e);
    }
  }
*/

}
