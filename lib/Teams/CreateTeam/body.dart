import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tussle_app/Before/beforeStart.dart';
import 'package:tussle_app/PageContent/rounded_input_field.dart';
import 'package:tussle_app/constants.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Body();
}

class _Body extends State<Body> {
  File _image;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Create Team"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
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
                              width: 155,
                              height: 155,
                              fit: BoxFit.fitHeight,
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
              SizedBox(
                height: 20,
              ),
              RoundedInputField(
                icon: Icons.drive_file_rename_outline,
                hintText: "Team  Name",
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Location",
                icon: (Icons.location_on_outlined),
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Description",
                icon: (Icons.description),
                onChanged: (value) {},
              ),
              SizedBox(width: 300.0, height: 50.0, child: MyStatefulWidget()),
              SizedBox(
                height: 20,
              ),
              SizedBox(width: 300.0, height: 50.0, child: MyStatefulWidget2()),
              SizedBox(
                height: 30,
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
                          builder: (context) => BeforeStart(),
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
          ),
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
          ? Text('Category')
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
      items: <String>['Gaming', 'Sports', 'Technology']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class MyStatefulWidget2 extends StatefulWidget {
  MyStatefulWidget2({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState2 createState() => _MyStatefulWidgetState2();
}

class _MyStatefulWidgetState2 extends State<MyStatefulWidget2> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: dropdownValue == null
          ? Text('Team Type')
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
      items: <String>['Competitive', 'Chill']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
