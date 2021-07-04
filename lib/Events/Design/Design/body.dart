import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tussle_app/Before/beforeStart.dart';
import 'package:tussle_app/PageContent/rounded_button.dart';
import 'package:tussle_app/PageContent/rounded_input_field.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Body> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  File _image;
  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

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
        title: new Text("Create Event"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 40, top: 10, right: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                            child: Image.file(_image,
                                width: 155, height: 155, fit: BoxFit.fill),
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
                height: 15,
              ),
              RoundedInputField(
                icon: Icons.title_rounded,
                hintText: "Name",
                onChanged: (value) {},
              ),
              RoundedInputField(
                icon: (Icons.location_on_outlined),
                hintText: "Location",
                onChanged: (value) {},
              ),
              RoundedInputField(
                icon: (Icons.info),
                hintText: "Description",
                onChanged: (value) {},
              ),
              SizedBox(width: 300.0, height: 50.0, child: DatePicker()),
              SizedBox(
                height: 10,
              ),
              RoundedButton(
                color: kPrimaryLightColor,
                text: "Select time",
                textColor: Colors.black,
                press: () {
                  _selectTime();
                },
              ),
              SizedBox(height: 10),
              Text(
                'Selected time: ${_time.format(context)}',
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
                          "Cancel",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: RaisedButton(
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
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            letterSpacing: 2.0,
                          ),
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
        decoration: InputDecoration(hintText: 'Select Date'),
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
