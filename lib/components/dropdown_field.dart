import '/constants.dart';
import 'package:flutter/material.dart';

class BuildDropDown extends StatefulWidget {
  const BuildDropDown({
    Key key,
    @required this.controller,
    @required this.labelText,
    @required this.dropitems,
  }) : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final List<String> dropitems;
  @override
  _BuildDropDownState createState() => _BuildDropDownState();
}

class _BuildDropDownState extends State<BuildDropDown> {
  String dropdownValue = 'no';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: textColor),
      underline: Container(
        height: 2,
        color: yellowTheme,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items:
          <String>['yes', 'no'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
