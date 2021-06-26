import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_tutorial/VolunteerPage/VolunteerPage.dart';
import 'package:firebase_authentication_tutorial/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_authentication_tutorial/components/dropdown.dart';

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
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String user = FirebaseAuth.instance.currentUser.uid;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _create() async {
    try {
      await firestore
          .collection('Volunter')
          .doc(user)
          .collection('Patient')
          .doc(_PatientName)
          .set({
        'firstName': _PatientName.toLowerCase(),
        'village': _VillageName,
        'caste': _Caste,
        'family': _FamilyMembers,
        'education': _Education,
        'age': _Age,
        'phone': _PhoneNumber,
        'address': _Address,
        'marriage': _MarriageStatus,
        'profession': _Profession,
        'working class': _WorkingClass,
        'gender': _Gender
      });
      print('add to firebase');
    } catch (e) {
      print(e);
    }
  }

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
        maxLength: 25,
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
          labelText: 'Patient Name',
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        maxLength: 25,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Patient Name is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _PatientName = value.toLowerCase();
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyDropdown(
            dropList: [
              'Primary Education',
              'Secondary Education',
              'Bachelors',
              'Masters',
              'Doctoral'
            ],
            labelText: 'Education',
            onSelected: (String val) {
              setState(() => _Education = val);
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'Education is Required';
              }

              return null;
            },
          ),
        ],
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyDropdown(
            dropList: [
              'Other',
              'Male',
              'Female',
            ],
            labelText: 'Gender:',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Gender is Required';
              }

              return null;
            },
            onSelected: (String val) {
              setState(() => _Gender = val);
            },
          ),
        ],
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyDropdown(
            dropList: ['Single', 'Married', 'Widowed', 'Seperated', 'Divorced'],
            labelText: 'Marital Status',
            onSelected: (String val) {
              setState(() => _MarriageStatus = val);
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'Marital Status is Required';
              }

              return null;
            },
          ),
        ],
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
        iconTheme: IconThemeData(color: headingColor),
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
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(yellowTheme),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(textColor),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: textColor, fontSize: 18),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }

                      _formKey.currentState.save();

                      _create();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VolunteerPage()),
                          (route) => false);
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
