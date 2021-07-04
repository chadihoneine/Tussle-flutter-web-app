import 'package:flutter/material.dart';

import '../../constants.dart';

class GeneralSetting extends StatefulWidget {
  @override
  _SettingsOnePageState createState() => _SettingsOnePageState();
}

class _SettingsOnePageState extends State<GeneralSetting> {
  bool _dark;
  bool _light1;
  bool _light2;
  bool _light3;
  @override
  void initState() {
    super.initState();
    _dark = false;
    _light1 = false;
    _light2 = false;
    _light3 = false;
  }

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      isMaterialAppTheme: true,
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          brightness: _getBrightness(),
          iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.white),
          backgroundColor: kPrimaryColor,
          title: Text(
            'General Settings',
            style: TextStyle(color: _dark ? Colors.white : Colors.white),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  Text(
                    "Notification Setting",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: const EdgeInsets.all(0),
                    value: _light1, //if its true, aut turn off others
                    title: Text("All Notifications "),
                    onChanged: (val) {
                      setState(() {
                        _light1 = !_light1;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: const EdgeInsets.all(0),
                    value: _light2,
                    title: Text("Events Notifications"),
                    onChanged: (val) {
                      setState(() {
                        _light2 = !_light2;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: const EdgeInsets.all(0),
                    value: _light3,
                    title: Text("Tournaments Notifications"),
                    onChanged: (bool val) {
                      setState(() {
                        _light3 = !_light3;
                      });
                    },
                  ),
                  _buildDivider(),
                  const SizedBox(height: 20.0),
                  Text(
                    "Appearances",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    contentPadding: const EdgeInsets.all(0),
                    value: _dark,
                    title: Text("Dark Theme"),
                    onChanged: (val) {
                      setState(() {
                        _dark = !_dark;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container _buildDivider() {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 8.0,
    ),
    width: double.infinity,
    height: 1.0,
    color: Colors.grey.shade400,
  );
}
