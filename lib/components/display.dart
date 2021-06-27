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
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              label,
              style:
                  TextStyle(color: headingColor, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: MediaQuery.of(context).size.width / 3,
          
            
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
