import 'package:flutter/material.dart';
import 'package:tussle_app/Before/beforeStart.dart';
import 'package:tussle_app/DatabaseHelper.dart';
import 'package:tussle_app/Login/Design/background.dart';
import 'package:tussle_app/PageContent/rounded_button.dart';
import 'package:tussle_app/PageContent//rounded_input_field.dart';
import 'package:tussle_app/PageContent/rounded_password_field.dart';
import 'package:tussle_app/SignUp/Design/AccountCheck.dart';
import 'package:tussle_app/SignUp/signup_screen.dart';
import 'background.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  DatabaseHelper db = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                db.loginData("admin@admin.com", "admin", "Hosam");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BeforeStart();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
