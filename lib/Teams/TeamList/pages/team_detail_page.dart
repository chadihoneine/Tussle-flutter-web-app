import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tussle_app/PageContent/rounded_button.dart';
import 'package:tussle_app/Teams/TeamList/models/team_model.dart';
import '../../../constants.dart';

class TeamDetailPage extends StatefulWidget {
  final Team team;
  TeamDetailPage(this.team);
  @override
  _TeamDetailPage createState() => _TeamDetailPage();
}

class _TeamDetailPage extends State<TeamDetailPage>
    with TickerProviderStateMixin {
  Team team;
  AnimationController controller;
  AnimationController bodyScrollAnimationController;
  ScrollController scrollController;
  Animation<double> scale;
  Animation<double> appBarSlide;
  double headerImageSize = 0;
  bool isFavorite = false;

  @override
  void initState() {
    team = widget.team;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1));
    bodyScrollAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1));
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset >= headerImageSize / 2) {
          if (!bodyScrollAnimationController.isCompleted)
            bodyScrollAnimationController.forward();
        } else {
          if (bodyScrollAnimationController.isCompleted)
            bodyScrollAnimationController.reverse();
        }
      });

    appBarSlide = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: bodyScrollAnimationController,
    ));

    scale = Tween(begin: 1.0, end: 0.5).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: controller,
    ));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    bodyScrollAnimationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(team.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Column(
                  children: [
                    Container(
                      child: Container(
                        width: double.infinity,
                        height: 130,
                        child: Container(
                          alignment: Alignment(0.0, 1.5),
                          child: CircleAvatar(
                            backgroundImage: new AssetImage(team.image),
                            radius: 60.0,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      team.name
                      , style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      team.location
                      , style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      team.description
                      , style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Card(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child:
                              Column(
                                children: [
                                  Text("Members",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text("${team.members}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w300
                                    ),),
                                ],
                              ),
                            ),
                            Expanded(
                              child:
                              Column(
                                children: [
                                  Text("Wining Rate",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text("3",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w300
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    RoundedButton(
                      color: kPrimaryColor,
                      text: "Request to join",
                      press: () {

                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
