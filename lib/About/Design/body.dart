import 'package:flutter/material.dart';
import 'package:tussle_app/About/Design/aboutTussle.dart';
import 'package:tussle_app/About/Design/contactUs.dart';
import 'package:tussle_app/About/Design/faq.dart';
import 'package:tussle_app/About/Design/privacyPolicy.dart';
import 'package:tussle_app/About/Design/termsAndConditions.dart';

import 'AboutUs.dart';

class Body extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("About"),
      ),
      body: Card(
        elevation: 10.0,
        margin: const EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 16.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("About Tussle"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AboutTussle();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Privacy Policy"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PrivacyPolicy();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text("FAQ"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FAQ();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Terms and Conditions"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Terms();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text("About us"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AboutUs();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Contact Us"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ContactUs();
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
