import 'package:flutter/material.dart';
import '../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Lucifers"),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            itemBuilder: (BuildContext context) {
              return choices.skip(0).map((Choice choice) {
                return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title)
                );
              }).toList();
            },
          ),
        ],
      ),
      body:  SingleChildScrollView(
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
                            backgroundImage: new AssetImage("assets/images/Empty.jpg"),
                            radius: 60.0,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height:40,
                    ),
                    Text(
                      "Lucifers Team"
                      , style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.blueGrey,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400
                    ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lebanon"
                      , style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black45,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300
                    ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description: bla bla bla bla bla"
                      , style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black45,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300
                    ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
                                  Text("4",
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
                    Text(
                      "Team Members",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: 5.0,),
                    Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              color: kPrimaryColor,
                            ),
                            title: Text("Hosam Abed Al Latif"),
                            onTap: () {
                              //open change password
                            },
                            trailing: IconButton(
                              icon: Icon(Icons.chat),
                              color: kPrimaryColor,
                              onPressed: (){

                              },
                            ),
                          ),
                          _buildDivider(),
                          ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              color: kPrimaryColor,
                            ),
                            title: Text("Mohammad Sonji"),
                            onTap: () {
                              //open change password
                            },
                            trailing: IconButton(
                              icon: Icon(Icons.chat),
                              color: kPrimaryColor,
                              onPressed: (){

                              },
                            ),
                          ),
                          _buildDivider(),
                          ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              color: kPrimaryColor,
                            ),
                            title: Text("Chadi Honeine"),
                            onTap: () {
                              //open change password
                            },
                            trailing: IconButton(
                              icon: Icon(Icons.chat),
                              color: kPrimaryColor,
                              onPressed: (){

                              },
                            ),
                          ),
                          _buildDivider(),
                          ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              color: kPrimaryColor,
                            ),
                            title: Text("Jad Rawas"),
                            onTap: () {
                              //open change password
                            },
                            trailing: IconButton(
                              icon: Icon(Icons.chat),
                              color: kPrimaryColor,
                              onPressed: (){

                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                  ]),
            ),
          ],
        ),
      ),
    );
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

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Add User'),
  const Choice(title: 'Send Request'),
  const Choice(title: 'Chat',),
  const Choice(title: 'Leave '),
];
