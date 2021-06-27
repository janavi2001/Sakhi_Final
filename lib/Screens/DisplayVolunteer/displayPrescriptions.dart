import '/components/display.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class DisplayPrescription extends StatefulWidget {
  final String firstname;
  const DisplayPrescription(this.firstname,{Key key}) : super(key: key);

  @override
  _DisplayPrescriptionState createState() => _DisplayPrescriptionState();
}

class _DisplayPrescriptionState extends State<DisplayPrescription> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Display(label: 'Patient Name', value: widget.firstname),
              Display(label: 'Doctor Name', value: 'N/A'),
              Divider(),
              Text('PRESCRIPTION'),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: textColor),
                  borderRadius: BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                child: Center(
                  child: Text('here'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
