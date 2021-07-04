import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tussle_app/Events/models/event_model.dart';
import 'package:tussle_app/Events/utils/app_utils.dart';
import 'package:tussle_app/Events/widgets/ui_helper.dart';
import 'package:tussle_app/Notifications/search_screen.dart';
import 'package:tussle_app/Search/Design/body.dart';
import 'package:tussle_app/Tournaments/Design/constant/text_style.dart';
import 'package:tussle_app/Tournaments/Design/models/tournament_model.dart';
import 'package:tussle_app/StartScreen/details.dart';
import 'package:tussle_app/Tournaments/Design/widgets/upcoming_tournament_card.dart';
import 'eventdetails.dart';
import 'eventsCard.dart';

class FirstScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FirstScreen> with TickerProviderStateMixin {

  ScrollController scrollController;
  AnimationController controller;
  AnimationController opacityController;
  Animation<double> opacity;

  void viewTournamentDetail(Tournament tournament) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (BuildContext context, animation, __) {
          return FadeTransition(
            opacity: animation,
            child: TournamentDetailPage(tournament),
          );
        },
      ),
    );
  }
  void viewEventDetail(Event event) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (BuildContext context, animation, __) {
          return FadeTransition(
            opacity: animation,
            child: EventDetailspage(event),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    scrollController = ScrollController();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward();
    opacityController =
        AnimationController(vsync: this, duration: Duration(microseconds: 1));
    opacity = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: opacityController,
    ));
    scrollController.addListener(() {
      opacityController.value = offsetToOpacity(
          currentOffset: scrollController.offset,
          maxOffset: scrollController.position.maxScrollExtent / 2);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Tussle"),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 1.0),
            child:  new IconButton(
              icon: new Icon(Icons.notifications,color: Colors.white,),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildUpComingTournamentList(),
                UIHelper.verticalSpace(20),
                buildUpComingEventsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUpComingTournamentList() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("My Tournaments",
              style: headerStyle.copyWith(color: Colors.black)),
          UIHelper.verticalSpace(5),
          Container(
            height: 250,
            child: ListView.builder(
              itemCount: nearbyTournaments.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final t = nearbyTournaments[index];
                return TournamentsCard(t,
                    onTap: () => viewTournamentDetail(t));
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget buildUpComingEventsList() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("My Events",
              style: headerStyle.copyWith(color: Colors.black)),
          UIHelper.verticalSpace(5),
          Container(
            height: 250,
            child: ListView.builder(
              itemCount: nearbyEvents.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final e = nearbyEvents[index];
                return EventsCard(e,
                    onTap: () => viewEventDetail(e));
              },
            ),
          ),
        ],
      ),
    );
  }
}
