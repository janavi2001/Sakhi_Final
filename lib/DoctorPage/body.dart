import 'package:flutter/material.dart';
import 'package:firebase_authentication_tutorial/PrescriptionForm/PrescriptionForm.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => new _BodyState();
}

class _BodyState extends State<Body> {
  /*for filtering search in app bar*/
  final TextEditingController _filter = new TextEditingController();

  //Get this list of names from DATABASE
  List patients = [
    "Patient1",
    "Patient2",
    "Patient3",
    "Patient4",
    "Patient5",
    "Patient6",
    "Patient7",
    "Patient8",
    "Patient9",
    "Patient10",
  ];
  String _searchText = ""; //decalring search string
  List names = []; //generating the names that will be displayed
  List filteredNames = []; //list that will be displayed while searching
  Icon _searchIcon = new Icon(Icons.search); //declaring search icon
  Widget _appBarTitle = new Text('My Patients'); //setting default app bar title

/*Constructor that has a listener*/
  _BodyState() {
    _filter.addListener(() {
      //input search
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames =
              names; //if search text is empty entire list is diplayed
        });
      } else {
        setState(() {
          _searchText = _filter
              .text; //if there is a search text, the state changes to what ever was input
        });
      }
    });
  }

  @override
  void initState() {
    this._getNames(); //initialising list of names and state
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Doctor Name"),
              accountEmail: Text("Doctor unique ID"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: ExactAssetImage("../assets/images/avatar.png"),
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.yellow
                        : Colors.white,
              ),
            ),
            ListTile(
              title: Text('My Profile?'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                //Add logout function here
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: new AppBar(centerTitle: true, title: _appBarTitle, actions: [
        IconButton(
          icon: _searchIcon,
          onPressed:
              _searchPressed, //execute _searchPressed function on clicking search icon
        ),
      ]),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildList() {
    if (!(_searchText == "")) {
      List tempList = [];
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]
            .toLowerCase()
            .contains(_searchText.toLowerCase())) //case insesnsitive searching
        {
          tempList.add(
              filteredNames[i]); //if found add the filtered names to templist
        }
      }
      filteredNames = tempList; //update the fitered list
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            //each patient displayed in a new card
            elevation: 4,
            child: ListTile(
              title: Text(filteredNames[index]),
              subtitle: Text("Click for health details"), //can change this
              trailing: Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PrescriptionForm();
                    },
                  ),
                );
              },
            ));
      },
    );
  }

  void _searchPressed() {
    setState(() {
      //based on which icon is pressed either search or display normal app bar title
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: '  Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('My Patients');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

//initialise the names list
  void _getNames() async {
    final response = patients;
    List tempList = [];
    for (int i = 0; i < response.length; i++) {
      tempList.add(response[i]);
    }
    setState(() {
      names = tempList;
      names.sort();
      filteredNames = names;
    });
  }
}