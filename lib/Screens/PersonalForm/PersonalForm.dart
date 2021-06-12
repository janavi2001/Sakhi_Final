import 'package:firebase_authentication_tutorial/constants.dart';
import 'package:flutter/material.dart';

class PersonalForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonalFormState();
  }
}

class PersonalFormState extends State<PersonalForm> {
  String _VillageName;
  String _PatientName;
  String _Age;
  String _Education;
  String _Caste;
  String _FamilyMembers;
  String _Gender;
  String _Profession;
  String _WorkingClass;
  String _MarriageStatus;
  String _PhoneNumber;
  String _Address;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildVillageName() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: ' Village Name',
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Village Name is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _VillageName = value;
        },
      ),
    );
  }

  Widget _buildPatientName() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: ' Patient Name',
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Patient Name is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _PatientName = value;
        },
      ),
    );
  }

  Widget _buildAge() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Age',
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        keyboardType: TextInputType.number,
        validator: (String value) {
          int Age = int.tryParse(value);

          if (Age == null || Age <= 0) {
            return 'Age must be greater than 0';
          }

          return null;
        },
        onSaved: (String value) {
          _Age = value;
        },
      ),
    );
  }

  Widget _buildEducation() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Education',
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Education is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _Education = value;
        },
      ),
    );
  }

  Widget _buildCaste() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Caste',
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Caste is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _Caste = value;
        },
      ),
    );
  }

  Widget _buildFamilyMembers() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Family Members',
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        keyboardType: TextInputType.number,
        validator: (String value) {
          int FamilyMembers = int.tryParse(value);

          if (FamilyMembers == null) {
            return 'Enter a Valid number';
          }

          return null;
        },
        onSaved: (String value) {
          _FamilyMembers = value;
        },
      ),
    );
  }

  Widget _buildGender() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Gender',
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Gender is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _Gender = value;
        },
      ),
    );
  }

  Widget _buildProfession() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Profession',
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Profession is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _Profession = value;
        },
      ),
    );
  }

  Widget _buildWorkingClass() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Working Class',
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Working Class is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _WorkingClass = value;
        },
      ),
    );
  }

  Widget _buildMarriageStatus() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Marriage Status',
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Marriage Status is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _MarriageStatus = value;
        },
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Phone number',
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        keyboardType: TextInputType.phone,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Phone number is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _PhoneNumber = value;
        },
      ),
    );
  }

  Widget _buildAddress() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          labelText: 'Address',
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        maxLength: 30,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Address is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _Address = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Details of Patient',
          style: TextStyle(color: headingColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Theme(
          data: ThemeData(
            primaryColor: yellowTheme,
            primaryColorDark: textColor,
            accentColor: yellowTheme,
          ),
          child: Container(
            margin: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildPatientName(),
                  _buildAge(),
                  _buildGender(),
                  _buildPhoneNumber(),
                  _buildVillageName(),
                  _buildAddress(),
                  _buildCaste(),
                  _buildFamilyMembers(),
                  _buildEducation(),
                  _buildProfession(),
                  _buildWorkingClass(),
                  _buildMarriageStatus(),
                  SizedBox(height: 100),
                  ElevatedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: textColor, fontSize: 18),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }

                      _formKey.currentState.save();
                    },
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
