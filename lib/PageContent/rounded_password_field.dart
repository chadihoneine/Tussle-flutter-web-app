import 'package:flutter/material.dart';
import 'package:tussle_app/PageContent/text_field_container.dart';

import '../constants.dart';

class RoundedPasswordField extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
  static const IconData visibility = IconData(0xeac9, fontFamily: 'MaterialIcons');
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

}

class _HomeScreenState extends State<RoundedPasswordField> {
  get onChanged => onChanged;
  bool ishidden  = true;
  void visibility() {
    setState(() {
      ishidden = !ishidden;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: ishidden,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: visibility,
            icon: ishidden? Icon(Icons.visibility_off) : Icon(Icons.visibility) ,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
class RoundedPasswordField2 extends StatefulWidget {
  _HomeScreenState2 createState() => _HomeScreenState2();
  static const IconData visibility = IconData(0xeac9, fontFamily: 'MaterialIcons');
  final ValueChanged<String> onChanged;
  const RoundedPasswordField2({
    Key key,
    this.onChanged,
  }) : super(key: key);

}

class _HomeScreenState2 extends State<RoundedPasswordField2> {
  get onChanged => onChanged;
  bool ishidden  = true;
  void visibility() {
    setState(() {
      ishidden = !ishidden;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: ishidden,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Repeat Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: visibility,
            icon: ishidden? Icon(Icons.visibility_off) : Icon(Icons.visibility) ,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}