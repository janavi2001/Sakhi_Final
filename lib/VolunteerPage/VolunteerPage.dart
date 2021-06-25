import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_tutorial/Screens/DisplayVolunteer/tabs.dart';
import '/Authentication/authentication_service.dart';
import '/Authentication/sign_in_page.dart';
import '/Screens/HealthForm/HealthForm.dart';
import '/Screens/PersonalForm/PersonalForm.dart';
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
  String useremail = FirebaseAuth.instance.currentUser.email;
  String userid = FirebaseAuth.instance.currentUser.uid;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  String firstname;

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
  CollectionReference ref = FirebaseFirestore.instance.collection('Volunter');

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

  void initiateSearch(String val) {
    setState(() {
      name = val.trim().toLowerCase();
    });
    //print(name);
  }

  Stream<QuerySnapshot> _ifhasvalue() {
    return FirebaseFirestore.instance
        .collection("Volunter")
        .doc(userid)
        .collection('Patient')
        .where("firstName", isGreaterThanOrEqualTo: name)
        .snapshots();
  }

  Stream<QuerySnapshot> ifhasnovalue() {
    return FirebaseFirestore.instance
        .collection("Volunter")
        .doc(userid)
        .collection('Patient')
        .snapshots();
  }

  @override
  void initState() {
    this._getNames(); //initialising list of names and state
    super.initState();
  }

  String name = '';
  bool isSearch = false;

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
              accountName: Text(useremail, style: TextStyle(color: textColor)),
              accountEmail: Text(userid, style: TextStyle(color: textColor)),
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
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                    (route) => false);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Visibility(
          visible: isSearch,
          replacement: Text(
            'My Patients',
            style: TextStyle(color: headingColor),
          ),
          child: TextField(
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              hintText: 'Search',
              suffixIcon: IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () => {
                  setState(() {
                    isSearch = false;
                  }),
                },
              ),
            ),
            onChanged: (value) => initiateSearch(value),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => {
              setState(() {
                isSearch = true;
              }),
            },
            icon: Icon(Icons.search),
          ),
        ],
        iconTheme: IconThemeData(color: headingColor),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: name != '' ? _ifhasvalue() : ifhasnovalue(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return new ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return Card(
                    //each patient displayed in a new card
                    color: bgColor,
                    elevation: 1,
                    child: ListTile(
                      tileColor: bgColor,
                      title: Text("Name: ${document['firstName']}",
                          style: TextStyle(color: textColor)),
                      subtitle: Text("Age: ${document['age']}",
                          style: TextStyle(color: textColor)),
                      trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.edit, color: textColor),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HealthForm(document['firstName'])),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.medication, color: textColor),
                              onPressed: () {
                                //TODO: NAVIGATE TO PRESCRIPTIONS PAGE
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.keyboard_arrow_right_sharp,
                                  color: textColor),
                              onPressed: () {
                                //TODO: NAVIGATE TO PERSONAL/HEALTH DETAILS PAGE
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VolunteerTabs(document['firstName'])),
                                );
                              },
                            ),
                          ]),
                    ),
                  );
                }).toList(),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: NAVIGATE TO ADD PATIENT HERE
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PersonalForm()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: yellowTheme,
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
