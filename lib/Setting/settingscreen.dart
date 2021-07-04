import 'package:flutter/material.dart';
import 'Design/body.dart';
class SettingScreen extends StatelessWidget {
   String currentUserId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingOnePage(currentUserId),
    );
  }
}
