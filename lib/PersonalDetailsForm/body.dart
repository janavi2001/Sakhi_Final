import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
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
    return TextFormField(
      decoration: InputDecoration(labelText: ' Village Name'),
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
    );
  }

  Widget _buildPatientName() {
    return TextFormField(
      decoration: InputDecoration(labelText: ' Patient Name'),
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
    );
  }

  Widget _buildAge() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Age'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int Age = int.tryParse(value);

        if (Age == null || Age <= 0|| Age>100) {
          return 'Enter a valid age';
        }

        return null;
      },
      onSaved: (String value) {
        _Age = value;
      },
    );
  }

  Widget _buildEducation() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Education'),
      
      validator: (String value) {
        if (value.isEmpty) {
          return 'Education is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _Education = value;
      },
    );
  }

  Widget _buildCaste() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Caste'),
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
    );
  }

  Widget _buildFamilyMembers() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Family Members'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        // ignore: non_constant_identifier_names
        int FamilyMembers = int.tryParse(value);

        if (FamilyMembers == null || FamilyMembers<20) {
          return 'Enter a Valid number';
        }

        return null;
      },
      onSaved: (String value) {
        _FamilyMembers = value;
      },
    );
  }

  

  Widget _buildGender() {
   
    

    var valueChoose;
    List listitem=['Male','Female','Others'];
    return Container(
      child: DropdownButton(
        hint: Text('Select Items:'),
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        value: valueChoose,
        onChanged: (newvalue){
          setState(() {
            valueChoose=newvalue;
          });

        },
        items: listitem.map((valueitem){
          return DropdownMenuItem(
            value:valueitem,
            child:Text(valueitem),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProfession() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Profession'),
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
    );
  }

  Widget _buildWorkingClass() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Working Class'),
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
    );
  }

  Widget _buildMarriageStatus() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Marriage Status'),
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
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
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
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Address'),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Demo")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildVillageName(),
                _buildPatientName(),
                _buildAge(),
                _buildEducation(),
                _buildCaste(),
                _buildFamilyMembers(),
                _buildGender(),
                _buildProfession(),
                _buildWorkingClass(),
                _buildMarriageStatus(),
                _buildPhoneNumber(),
                _buildAddress(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    print(_VillageName);
                    print(_Age);

                    /*print(_name);
                    print(_email);
                    print(_phoneNumber);
                    print(_url);
                    print(_password);
                    print(_calories);*/

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
