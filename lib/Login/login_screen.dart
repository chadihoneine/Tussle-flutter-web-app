import 'package:flutter/material.dart';
import 'package:tussle_app/Login/Design/body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }

  // on clicking the submit button, call the login function in the databasehelper class to get an authorization token

}
