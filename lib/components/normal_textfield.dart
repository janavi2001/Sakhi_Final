import '/constants.dart';
import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField(
      {Key key, @required this.controller, @required this.labelText})
      : super(key: key);
  final TextEditingController controller;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(20),
      child: Theme(
        data: ThemeData(
          primaryColor: yellowTheme,
          primaryColorDark: textColor,
        ),
        child: TextFormField(
          maxLength: 10,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please fill this field';
            }
            return null;
          },
          onSaved: (String value) {
            //
          },
          controller: controller,
          style: TextStyle(fontSize: 18, color: textColor),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            contentPadding: EdgeInsets.all(18),
            labelText: labelText,
            labelStyle: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
