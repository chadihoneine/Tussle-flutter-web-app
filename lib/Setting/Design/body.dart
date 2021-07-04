import 'dart:io';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tussle_app/MyProfile/EditProfile/models/user.dart';
import 'package:tussle_app/SignUp/Design/body.dart';
import 'package:tussle_app/constants.dart';

class SettingOnePage extends StatefulWidget {
  final String currentUserId;
  SettingOnePage(this.currentUserId);
  @override
  _SettingsOnePageState createState() => _SettingsOnePageState();
}

class _SettingsOnePageState extends State<SettingOnePage> {
  String countryValue;
  String stateValue;
  String cityValue;
  File _image;
  User currentUser;
  TextEditingController displayFirstNameController = TextEditingController();
  TextEditingController displayLastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  User user;

  _imgFromGallery() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }

  Column buildDisplayFirstNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: displayFirstNameController,
          decoration: InputDecoration(
            hintText: "First Name",
          ),
        ),
      ],
    );
  }

  Column buildDisplayLastNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: displayLastNameController,
          decoration: InputDecoration(
            hintText: "Last Name",
          ),
        ),
      ],
    );
  }

  Column buildUsernameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
            hintText: "Username",
          ),
        ),
      ],
    );
  }

  Column buildBioField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: bioController,
          decoration: InputDecoration(
            hintText: "Bio",
          ),
        ),
      ],
    );
  }

  Column buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: "Email",
          ),
        ),
      ],
    );
  }

  Column buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          obscureText: true,
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Settings"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 1.0),
            child: new IconButton(
              onPressed: () {},
              icon: Icon(Icons.done),
            ),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: kPrimaryColor,
                      child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(78),
                              child: Image.file(
                                _image,
                                  width:155 ,
                                  height: 155,
                                  fit:BoxFit.fill
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(78)),
                              width: 155,
                              height: 155,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey[800],
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Account Settings",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      buildUsernameField(),
                      SizedBox(
                        height: 10,
                      ),
                      buildPasswordField(),
                      SizedBox(
                        height: 10,
                      ),
                      buildEmailField(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "User Settings",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      buildDisplayFirstNameField(),
                      SizedBox(
                        height: 10,
                      ),
                      buildDisplayLastNameField(),
                      SizedBox(
                        height: 10,
                      ),
                      buildBioField(),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: 400.0,
                          height: 50.0,
                          child: MyStatefulWidget()),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(width: 400.0, height: 40.0, child: DatePicker()),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Contact Settings",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SelectState(
                        style: TextStyle(color: Colors.black),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
        decoration: InputDecoration(hintText: 'Birthday'),
        onTap: () async {
          var date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100));
          dateController.text = date.toString().substring(0, 10);
        },
      )),
    );
  }
}
