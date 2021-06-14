import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_tutorial/Authentication/authentication_service.dart';
import 'package:firebase_authentication_tutorial/Authentication/home_page.dart';
import 'package:firebase_authentication_tutorial/VolunteerPage/VolunteerPage.dart';
import 'package:firebase_authentication_tutorial/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          RaisedButton(
            onPressed: () {
              context.read<AuthenticationService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
            },
            child: Text("Sign in"),
          )
        ],
      ),
    );
  }
}*/

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            Expanded(flex: 5, child: Image.asset('assets/images/logo.png')),
            Expanded(
              flex: 2,
              child: Text(
                'Login',
                style: TextStyle(fontSize: 25, color: headingColor),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              flex: 2,
              child: TextField(
                style: TextStyle(color: textColor),
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 20, color: textColor),
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              flex: 2,
              child: TextField(
                style: TextStyle(color: textColor),
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 20),
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                child: Text('Login',
                    style: TextStyle(fontSize: 18, color: headingColor)),
                onPressed: () {
                  String currentlyLoggedIn = emailController.text.trim();
                  print(currentlyLoggedIn);
                  AuthenticationService(_firebaseAuth)
                      .signIn(
                          email: currentlyLoggedIn,
                          password: passwordController.text.trim())
                      .then((value) {
                    if (value == "Signed in") {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VolunteerPage()),
                          (route) => false);
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    }
                  });
                  // context.read<AuthenticationService>().signIn(
                  //       email: emailController.text.trim(),
                  //       password: passwordController.text.trim(),
                  //     );
                },
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: yellowTheme,
                    textStyle: TextStyle(fontSize: 18, color: headingColor)),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
