import '/components/checkbox.dart';
import '/VolunteerPage/VolunteerPage.dart';
import '/constants.dart';
import 'package:flutter/material.dart';

class MentalHealthForm extends StatefulWidget {
  @override
  _MentalHealthFormState createState() => _MentalHealthFormState();
}

class _MentalHealthFormState extends State<MentalHealthForm> {
  //final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool concentration = false;
  bool lossSleep = false;
  bool useful = false;
  bool decisions = false;
  bool stress = false;
  bool difficulty = false;
  bool enjoy = false;
  bool problems = false;
  bool unhappy = false;
  bool depressed = false;
  bool confidence = false;
  bool worthless = false;
  bool happy = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mental Health of Patient",
            style: TextStyle(color: headingColor)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LabeledCheckbox(
                  label: 'Able to concentrate',
                  value: concentration,
                  onChanged: (bool newValue) {
                    setState(() {
                      concentration = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Loss of Sleep over worry',
                  value: lossSleep,
                  onChanged: (bool newValue) {
                    setState(() {
                      lossSleep = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Feel like they are playing a useful part in life',
                  value: useful,
                  onChanged: (bool newValue) {
                    setState(() {
                      useful = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Capable of making decisions',
                  value: decisions,
                  onChanged: (bool newValue) {
                    setState(() {
                      decisions = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Feeling constantly stressed or under strain',
                  value: stress,
                  onChanged: (bool newValue) {
                    setState(() {
                      stress = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Could overcome difficulties',
                  value: difficulty,
                  onChanged: (bool newValue) {
                    setState(() {
                      difficulty = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Able to enjoy day-to-day activities',
                  value: enjoy,
                  onChanged: (bool newValue) {
                    setState(() {
                      enjoy = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Able to face problems and issues',
                  value: problems,
                  onChanged: (bool newValue) {
                    setState(() {
                      problems = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Feeling Unhappy or depressed',
                  value: unhappy,
                  onChanged: (bool newValue) {
                    setState(() {
                      unhappy = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Have Confidence',
                  value: confidence,
                  onChanged: (bool newValue) {
                    setState(() {
                      confidence = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Thinking of self as worthless',
                  value: worthless,
                  onChanged: (bool newValue) {
                    setState(() {
                      worthless = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Feeling Reasonably Happy',
                  value: happy,
                  onChanged: (bool newValue) {
                    setState(() {
                      happy = newValue;
                    });
                  },
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
                          child: Text("Submit"),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VolunteerPage(),
                                ));
                          }),
                    ],
                  ),
                ),
                SizedBox(height: 50),
              ]),
        ),
      ),
    );
  }
}
