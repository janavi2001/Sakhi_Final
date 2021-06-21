import '/components/display.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class DisplayPhysical extends StatelessWidget {
  const DisplayPhysical({Key key}) : super(key: key);

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
              Display(label: 'Tiredness', value: 'blah blah'),
              Display(label: 'Aches or Pains', value: 'blah blah '),
              Display(label: 'Sore Throat', value: 'blah blah'),
              Display(label: 'Diarrohea', value: 'blah blah '),
              Display(label: 'Conjuctivitis', value: 'blah blah'),
              Display(label: 'Headache', value: 'blah blah '),
              Display(label: 'Loss of taste', value: 'blah blah'),
              Display(label: 'Loss of smell', value: 'blah blah '),
              Display(
                  label: 'Discolouration of fingers/toes', value: 'blah blah'),
              Display(label: 'Rashes on skin', value: 'blah blah '),
              Display(label: 'Shortness of breath', value: 'blah blah'),
              Display(label: 'Chest Pain', value: 'blah blah '),
              Display(label: 'Loss of movement', value: 'blah blah '),
              Display(label: 'Loss of speech', value: 'blah blah'),
            ],
          ),
        ),
      ),
    );
  }
}
