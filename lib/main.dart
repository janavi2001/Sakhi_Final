import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_tutorial/Authentication/authentication_service.dart';
import 'package:firebase_authentication_tutorial/Authentication/sign_in_page.dart';
import 'package:firebase_authentication_tutorial/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_authentication_tutorial/VolunteerPage/VolunteerPage.dart';

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
          appBarTheme: AppBarTheme(
            color: yellowTheme,
          ),
          scaffoldBackgroundColor: bgColor,
          accentColor: yellowTheme,
          visualDensity: VisualDensity.adaptivePlatformDensity,
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
