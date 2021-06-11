import '/components/checkbox.dart';
import '/screens/HealthForm/mental.dart';
import '/constants.dart';
import 'package:flutter/material.dart';

class PhysicalHealthForm extends StatefulWidget {
  @override
  _PhysicalHealthFormState createState() => _PhysicalHealthFormState();
}

class _PhysicalHealthFormState extends State<PhysicalHealthForm> {
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Physical Health of Patient",
            style: TextStyle(color: headingColor)),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MentalHealthForm()),
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
