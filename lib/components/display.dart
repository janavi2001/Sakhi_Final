import '/constants.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({
    Key key,
    @required this.label,
    @required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              label,
              style:
                  TextStyle(color: headingColor, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Text(
              value,
              style: TextStyle(color: textColor),
            ),
          )
        ],
      ),
    );
  }
}
