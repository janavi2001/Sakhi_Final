import '/components/display.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class DisplayMental extends StatelessWidget {
  const DisplayMental({Key key}) : super(key: key);

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
              Display(label: 'Able to concentrate', value: 'blah blah'),
              Display(label: 'Loss of Sleep over worry', value: 'blah blah '),
              Display(
                  label: 'Feel like they are playing a useful part in life',
                  value: 'blah blah'),
              Display(
                  label: 'Capable of making decisions', value: 'blah blah '),
              Display(label: 'Conjuctivitis', value: 'blah blah'),
              Display(
                  label: 'Feeling constantly stressed or under strain',
                  value: 'blah blah '),
              Display(label: 'Could overcome difficulties', value: 'blah blah'),
              Display(
                  label: 'Able to enjoy day-to-day activities',
                  value: 'blah blah '),
              Display(
                  label: 'Able to face problems and issues',
                  value: 'blah blah'),
              Display(
                  label: 'Feeling Unhappy or depressed', value: 'blah blah '),
              Display(label: 'Have Confidence', value: 'blah blah'),
              Display(
                  label: 'Thinking of self as worthless', value: 'blah blah '),
              Display(label: 'Feeling Reasonably Happy', value: 'blah blah '),
            ],
          ),
        ),
      ),
    );
  }
}
