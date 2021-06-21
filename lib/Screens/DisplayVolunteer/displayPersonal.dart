import '/components/display.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class DisplayPersonal extends StatelessWidget {
  const DisplayPersonal({Key key}) : super(key: key);

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
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: ExactAssetImage("assets/images/avatar.png"),
                  backgroundColor: headingColor,
                ),
              ),
              Display(label: 'Name', value: 'blah blah'),
              Display(label: 'Age', value: 'blah blah '),
              Display(label: 'Gender', value: 'blah blah'),
              Display(label: 'Phone Number', value: 'blah blah '),
              Display(label: 'Village Name', value: 'blah blah'),
              Display(label: 'Address', value: 'blah blah '),
              Display(label: 'Caste', value: 'blah blah'),
              Display(label: 'Family Members', value: 'blah blah '),
              Display(label: 'Education', value: 'blah blah'),
              Display(label: 'Profession', value: 'blah blah '),
              Display(label: 'Working Class', value: 'blah blah'),
              Display(label: 'Marriage status', value: 'blah blah '),
            ],
          ),
        ),
      ),
    );
  }
}
