import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "Meet the team",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "Chadi Honeine",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                     // Image.asset('assets/images/chadiimage.jpg'),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: new Column(
                          children: <Widget>[
                            new Text(
                              "Chadi is a BAU student who fled dentistry to begin a career in computer science. Loves videogames, anime and is easily scared of socializing.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "Mohammad Sonji",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Image.asset('assets/images/sonji.jfif'),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: new Column(
                          children: <Widget>[
                            new Text(
                              "Future google designer,developer, engineer, astronaut and doctor. Loves Dota, crossfit and volunteering, he likes to participate in events, like LCPC.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "Jad Rawas",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                     // Image.asset('assets/images/penguinquestionmark.jpg'),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: new Column(
                          children: <Widget>[
                            new Text(
                              "Anime master, hacker, and developer who invested all his stats in his sleeping skills. He lives at night and have the bad habit of being productive only at the last minute.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "Hosam Abed Al Latif",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                     // Image.asset("assets/images/hosam.jpg"),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: new Column(
                          children: <Widget>[
                            new Text(
                              "Bau student, soon to be a google CEO, often distracted by football. Loves videogames, where there is no doubt that he will soon be a video game developer.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
