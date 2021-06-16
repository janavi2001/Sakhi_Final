import '../constants.dart';
import 'package:flutter/material.dart';

class MyDropdown extends StatefulWidget {
  const MyDropdown({
    Key key,
    @required this.labelText,
    @required this.onSelected,
    @required this.dropList,
  }) : super(key: key);
  final String labelText;
  final List<String> dropList;
  final Function(String) onSelected;

  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String selected;
  @override
  void initState() {
    super.initState();
    selected = widget.dropList.first;
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            widget.labelText,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: DropdownButton<String>(
              elevation: 8,
              dropdownColor: yellowTheme,
              hint: Text("Select item"),
              value: selected,
              onChanged: (value) {
                setState(() {
                  selected = value.toString();
                });
                widget.onSelected(selected);
              },
              items: widget.dropList.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: TextStyle(color: textColor)),
                );
              }).toList()),
        ),
      ],
    );
  }
}
