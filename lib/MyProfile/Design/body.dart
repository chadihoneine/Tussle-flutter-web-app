import 'package:flutter/material.dart';
import 'package:tussle_app/About/about_us_screen.dart';
import 'package:tussle_app/Notifications/search_screen.dart';
import 'package:tussle_app/Setting/Design/General%20Setting.dart';
import 'package:tussle_app/Setting/settingscreen.dart';
import 'package:tussle_app/Teams/CreateTeam/create_team.dart';
import 'package:tussle_app/Teams/MyTeams/pages/home_page.dart';
import 'package:tussle_app/Teams/TeamList/pages/home_page.dart';
import 'package:tussle_app/Welcome/WelcomeScreen.dart';
import 'package:tussle_app/constants.dart';

class Body extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Body> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: new Text("Hosam Abed Al Latif"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 1.0),
            child: new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: new Drawer(
        elevation: 20.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text('Hosam Abed Al Latif'),
                accountEmail: Text('Team: Lucifers'),
                currentAccountPicture: CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/Empty.jpg'),
                  ),
                )),
            new ListTile(
              leading: Icon(Icons.group),
              title: new Text('My Teams'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyTeamScreen();
                    },
                  ),
                );
              },
            ),
            new ListTile(
              leading: Icon(Icons.notifications),
              title: new Text("Notifications"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NotificationScreen();
                    },
                  ),
                );
              },
            ),
            new ListTile(
              leading: Icon(Icons.add),
              title: new Text('Create Team'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Create_Team();
                    },
                  ),
                );
              },
            ),
            new ListTile(
              leading: Icon(Icons.people_alt_outlined),
              title: new Text('Join Team'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TeamScreen();
                    },
                  ),
                );
              },
            ),
            _buildDivider(),
            new ListTile(
              leading: Icon(Icons.settings),
              title: new Text('Account Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SettingScreen();
                    },
                  ),
                );
              },
            ),
            new ListTile(
              leading: Icon(Icons.settings),
              title: new Text('General Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GeneralSetting();
                    },
                  ),
                );
              },
            ),
            new ListTile(
              leading: Icon(Icons.info_outline),
              title: new Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return About();
                    },
                  ),
                );
              },
            ),
            _buildDivider(),
            new ListTile(
              leading: Icon(Icons.logout),
              title: new Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Container(
                  width: double.infinity,
                  height: 150,
                  child: Container(
                    alignment: Alignment(0.0, 2.5),
                    child: CircleAvatar(
                      backgroundImage:
                          new AssetImage("assets/images/Empty.jpg"),
                      radius: 60.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Hosam Abed Al Latif",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  letterSpacing: 2.0,
                fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Lebanon",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Computer Science Student",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  color: Colors.white,
                  elevation: 2.0,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      child: Text(
                        "Skills",
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2.0,
                            ),
                      ))),
              SizedBox(
                height: 15,
              ),
              Text(
                "Football player, Programmer",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    letterSpacing: 2.0,
                ),              ),
              SizedBox(height: 30),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Events",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "3",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Tournaments",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "4",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
}
