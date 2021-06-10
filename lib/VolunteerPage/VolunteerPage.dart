import 'package:firebase_authentication_tutorial/Authentication/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class VolunteerPage extends StatefulWidget {
  @override
  VolunteerPageState createState() => VolunteerPageState();
}

class VolunteerPageState extends State<VolunteerPage> {
  /*for filtering search in app bar*/
  final TextEditingController _filter = new TextEditingController();

  String currentlyLoggedIn = "manali"; //After authentication?

  String _searchText = ""; //decalring search string

  List names = []; //generating the names that will be displayed
  List filteredNames = []; //list that will be displayed while searching

  Icon _searchIcon =
      Icon(Icons.search, color: textColor); //declaring search icon
  Widget _appBarTitle = Text(
    'My Patients',
    style: TextStyle(color: headingColor),
  ); //setting default app bar title

/*Constructor that has a listener*/
  VolunteerPageState() {
    _filter.addListener(() {
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

//TODO: Get this list of names from database for currenlty logged in volunteer

  List patients = ['Patient1', 'Patient2', 'Patient3', 'Patient4', 'Patient5'];

  //initialise the names list
  void _getNames() async {
    final response = patients; //here
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
              decoration: BoxDecoration(
                color: bgColor,
              ),
              accountName:
                  Text(currentlyLoggedIn, style: TextStyle(color: textColor)),
              accountEmail: Text('Volunteer unique ID',
                  style: TextStyle(color: textColor)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: ExactAssetImage("assets/images/avatar.png"),
                backgroundColor: headingColor,
              ),
            ),
            ListTile(
              title: Text('Help'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Account'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                //Add logout function here
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Log Out'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                context.read<AuthenticationService>().signOut();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
          centerTitle: true,
          title: _appBarTitle,
          iconTheme: IconThemeData(color: headingColor),
          actions: [
            IconButton(
              icon: _searchIcon,
              onPressed:
                  _searchPressed, //execute _searchPressed function on clicking search icon
            ),
          ]),
      body: Container(
        child: _buildList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: NAVIGATE TO ADD PATIENT HERE
        },
        child: const Icon(Icons.add),
        backgroundColor: yellowTheme,
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
            color: bgColor,
            elevation: 1,
            child: ListTile(
              tileColor: bgColor,
              title: Text(filteredNames[index],
                  style: TextStyle(color: textColor)),
              subtitle: Text("00-7 ID",
                  style: TextStyle(color: textColor)), //can change this
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit, color: textColor),
                  onPressed: () {
                    //TODO: NAVIGATE TO PRESCRIPTIONS PAGE
                  },
                ),
                IconButton(
                  icon: Icon(Icons.medication, color: textColor),
                  onPressed: () {
                    //TODO: NAVIGATE TO PRESCRIPTIONS PAGE
                  },
                ),
                IconButton(
                  icon:
                      Icon(Icons.keyboard_arrow_right_sharp, color: textColor),
                  onPressed: () {
                    //TODO: NAVIGATE TO PERSONAL/HEALTH DETAILS PAGE
                  },
                ),
              ]),
            ),
          );
        });
  }

  void _searchPressed() {
    setState(() {
      //based on which icon is pressed either search or display normal app bar title
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close, color: textColor);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search, color: textColor),
              hintText: '  Search...',
              hintStyle: TextStyle(color: textColor)),
        );
      } else {
        this._searchIcon = new Icon(Icons.search, color: textColor);
        this._appBarTitle =
            Text('My Patients', style: TextStyle(color: headingColor));
        filteredNames = names;
        _filter.clear();
      }
    });
  }
}
