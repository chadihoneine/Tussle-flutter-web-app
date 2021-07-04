import 'package:flutter/material.dart';
import 'package:tussle_app/Login/login_screen.dart';
import 'package:tussle_app/PageContent/rounded_input_field.dart';
import 'package:tussle_app/PageContent/rounded_password_field.dart';
import '../../constants.dart';
import 'AccountCheck.dart';
import 'background.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Username",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedPasswordField2(
              onChanged: (value) {},
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  color: kPrimaryColor,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 120.0,
                      maxHeight: 40.0,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Body2(),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  color: kPrimaryColor,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 120.0,
                      maxHeight: 40.0,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            AccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
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

class Body2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Your Information",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                icon: Icons.email,
                hintText: "Email",
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "First name",
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Last name",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    color: kPrimaryColor,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 120.0,
                        maxHeight: 40.0,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Body3(),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    color: kPrimaryColor,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 120.0,
                        maxHeight: 40.0,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
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

class Body3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Your Information",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SizedBox(width: 300.0, height: 50.0, child: MyStatefulWidget()),
              SizedBox(
                height: 40,
              ),
              SizedBox(width: 300.0, height: 50.0, child: DatePicker()),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    color: kPrimaryColor,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 120.0,
                        maxHeight: 40.0,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Body4(),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    color: kPrimaryColor,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 120.0,
                        maxHeight: 40.0,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
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

class Body4 extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Body4> {
  String countryValue;
  String stateValue;
  String cityValue;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: [
                  Text(
                    "Contact Information",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SelectState(
                    style: TextStyle(color: kPrimaryColor),
                    dropdownColor: Colors.white,
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        stateValue = value;
                      });
                    },
                    onCityChanged: (value) {
                      setState(() {
                        cityValue = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                          color: kPrimaryColor,
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 120.0,
                              maxHeight: 40.0,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Back",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                        color: kPrimaryColor,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 120.0,
                            maxHeight: 40.0,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Finish",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: dropdownValue == null
          ? Text('Gender')
          : Text(
              dropdownValue,
              style: TextStyle(color: kPrimaryColor),
            ),
      isExpanded: true,
      iconSize: 30.0,
      value: dropdownValue,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Male', 'Female']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class DatePicker extends StatefulWidget {
  DatePicker({Key key}) : super(key: key);
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final dateController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: TextField(
          readOnly: true,
          controller: dateController,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(hintText: 'Birthday'),
          onTap: () async {
            var date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100));
            dateController.text = date.toString().substring(0, 10);
          },
        ),
      ),
    );
  }
}
