import 'package:firebase_auth/firebase_auth.dart';
import '/Authentication/authentication_service.dart';
import '/Authentication/sign_in_page.dart';
import '/Screens/doctorscreen.dart';
import '/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/VolunteerPage/VolunteerPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        // ignore: missing_required_param
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        title: 'Sakhi',
        theme: ThemeData.light().copyWith(
          iconTheme: IconThemeData(
            color: textColor,
          ),
          primaryColor: bgColor,
          scaffoldBackgroundColor: bgColor,
          accentColor: yellowTheme,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 72.0,
                fontWeight: FontWeight.bold,
                color: headingColor),
            headline6: TextStyle(
                fontSize: 36.0,
                fontStyle: FontStyle.italic,
                color: headingColor),
            bodyText2: TextStyle(fontSize: 14.0, color: textColor),
            bodyText1: TextStyle(fontSize: 14.0, color: textColor),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(headingColor),
              backgroundColor: MaterialStateProperty.all<Color>(yellowTheme),
            ),
          ),
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return VolunteerPage();
    }
    return SignInPage();
  }
}

/*import 'package:firebase_authentication_tutorial/PersonalDetailsForm/body.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coding with Curry',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: FormScreen(),
    );
  }
}*/
