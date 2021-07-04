import 'package:flutter/material.dart';
import 'package:tussle_app/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Hosam Abed Al Latif"),
        automaticallyImplyLeading: true,
      ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    child: Container(
                      alignment: Alignment(0.0,2.5),
                      child: CircleAvatar(
                        backgroundImage: new AssetImage("assets/images/Empty.jpg"),
                        radius: 60.0,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 60,
                ),
                Text(
                  "Hosam Abed Al Latif"
                  ,style: TextStyle(
                    fontSize: 25.0,
                    color:Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400
                ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Lebanon"
                  ,style: TextStyle(
                    fontSize: 18.0,
                    color:Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300
                ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Computer Science Student"
                  ,style: TextStyle(
                    fontSize: 15.0,
                    color:Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300
                ),

                ),
                SizedBox(
                  height: 20,
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
                  margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text("Events",
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
                                ),)
                            ],
                          ),
                        ),
                        Expanded(
                          child:
                          Column(
                            children: [
                              Text("Tournaments",
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
                                ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: (){
                      },
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),

                    ),
                      color: kPrimaryColor,
                      child: Container(
                      constraints: BoxConstraints(maxWidth: 200.0,maxHeight: 40.0,),
                      alignment: Alignment.center,
                      child: Text(
                        "Request",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}