import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Contact Us"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tussle@hotmail.com",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Facebook",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "With the name of Tussle",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Instagram:",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "With the name of Tussle",
                        style: TextStyle(
                            color: Colors.black, fontSize: 14, height: 1.5),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
