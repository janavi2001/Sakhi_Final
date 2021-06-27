import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import '/components/checkbox.dart';
import '/screens/HealthForm/mental.dart';
import '/constants.dart';
import 'package:flutter/material.dart';

class PhysicalHealth extends StatefulWidget {
  final String firstname;
  PhysicalHealth(this.firstname, {Key key}): super(key: key);
  @override
  _PhysicalHealthState createState() => _PhysicalHealthState();
}

class _PhysicalHealthState extends State<PhysicalHealth> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String user = FirebaseAuth.instance.currentUser.uid;
  //final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool tiredness = false;
  bool pains = false;
  bool soreThroat = false;
  bool diarrhoea = false;
  bool conjuctivitis = false;
  bool headache = false;
  bool lossTaste = false;
  bool lossSmell = false;
  bool discoloration = false;
  bool rash = false;
  bool breathe = false;
  bool chestPain = false;
  bool lossMovement = false;
  bool lossSpeech = false;
  String now = formatDate(DateTime(1989, 02, 21), [yyyy, '-', mm, '-', dd]);

  final _formKey = GlobalKey<FormState>();
  void _create() async {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    try {
      await firestore.collection('Volunter').doc(user).collection('Patient').doc(widget.firstname.toString()).collection('Health_Record').doc(formattedDate).update
      ({
        'tiredness':tiredness,
        'pains':pains,
        'soreThroat':soreThroat,
        'diarrhoea':diarrhoea,
        'conjuctivitis':conjuctivitis,
        'headache':headache,
        'lossTaste':lossTaste,
        'lossSmell':lossSmell,
        'discoloration':discoloration,
        'rash':rash,
        'breathe':breathe,
        'chestPain':chestPain,
        'lossMovement':lossMovement,
        'lossSpeech':lossSpeech

















 
       







      });
    
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Physical Health of Patient",
            style: TextStyle(color: headingColor)),
            iconTheme: IconThemeData(color: headingColor),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LabeledCheckbox(
                  label: 'Tiredness',
                  value: tiredness,
                  onChanged: (bool newValue) {
                    setState(() {
                      tiredness = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Aches Or Pains',
                  value: pains,
                  onChanged: (bool newValue) {
                    setState(() {
                      pains = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Sore Throat',
                  value: soreThroat,
                  onChanged: (bool newValue) {
                    setState(() {
                      soreThroat = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Diarrohea',
                  value: diarrhoea,
                  onChanged: (bool newValue) {
                    setState(() {
                      diarrhoea = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Conjuctivitis',
                  value: conjuctivitis,
                  onChanged: (bool newValue) {
                    setState(() {
                      conjuctivitis = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Headache',
                  value: headache,
                  onChanged: (bool newValue) {
                    setState(() {
                      headache = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Loss of taste',
                  value: lossTaste,
                  onChanged: (bool newValue) {
                    setState(() {
                      lossTaste = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Loss of smell',
                  value: lossSmell,
                  onChanged: (bool newValue) {
                    setState(() {
                      lossSmell = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Discolouration of fingers or toes',
                  value: discoloration,
                  onChanged: (bool newValue) {
                    setState(() {
                      discoloration = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Rashes on skin',
                  value: rash,
                  onChanged: (bool newValue) {
                    setState(() {
                      rash = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Difficulty breathing or shortness of breath',
                  value: breathe,
                  onChanged: (bool newValue) {
                    setState(() {
                      breathe = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Chest Pain',
                  value: chestPain,
                  onChanged: (bool newValue) {
                    setState(() {
                      chestPain = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Loss of movement',
                  value: lossMovement,
                  onChanged: (bool newValue) {
                    setState(() {
                      lossMovement = newValue;
                    });
                  },
                ),
                LabeledCheckbox(
                  label: 'Loss of speech',
                  value: lossSpeech,
                  onChanged: (bool newValue) {
                    setState(() {
                      lossSpeech = newValue;
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
                        child: Text("Next"),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        _create();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MentalHealthForm(widget.firstname)),
                          );
                        }),
                  ],
                )),
                SizedBox(height: 50),
              ]),
        ),
      ),
    );
  }
}
