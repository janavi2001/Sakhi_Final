import 'package:firebase_authentication_tutorial/Authentication/authentication_service.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 120,
              ),
              Container(
              height:200,
              child:Image.asset('assets/images/logo.png',
              fit:BoxFit.cover),),
              SizedBox(
                height: 30,
              ),
              Text(
                'Sakhi Login',
                style: TextStyle(fontSize: 25, color: Colors.yellow[600]),
              )
            ],
          ),
          SizedBox(
            height: 60.0,
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(fontSize: 20),
              filled: true,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(fontSize: 20),
              filled: true,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: <Widget>[
              ButtonTheme(
                buttonColor: Colors.yellow[600],
                height: 50,
                disabledColor: Colors.yellow[600],
                child: RaisedButton(
                  disabledElevation: 4.0,
                  onPressed: () {
                    context.read<AuthenticationService>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
