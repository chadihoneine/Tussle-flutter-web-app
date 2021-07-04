import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tussle_app/Events/Design/createEvent.dart';
import 'package:tussle_app/Events/models/event_model.dart';
import 'package:tussle_app/Events/utils/app_utils.dart';
import 'package:tussle_app/Events/widgets/nearby_event_card.dart';
import 'package:tussle_app/Search/Design/body.dart';
import 'event_detail_page.dart';

class EventScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<EventScreen>
    with TickerProviderStateMixin {
  ScrollController scrollController;
  AnimationController controller;
  AnimationController opacityController;
  Animation<double> opacity;

  void viewEventDetail(Event event) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (BuildContext context, animation, __) {
          return FadeTransition(
            opacity: animation,
            child: EventDetailPage(event),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward();
    opacityController =
        AnimationController(vsync: this, duration: Duration(microseconds: 300));
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
        title: new Text("Events"),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 1.0),
            child: new IconButton(
              icon: new Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(context: context, delegate: Events());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 1.0),
            child: new IconButton(
              icon: new Icon(
                Icons.add,
                color: Colors.white,
                size: 31,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => create_event()),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Have a nice day with our Events",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Let's see what’s happening nearby",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 11,
                              ),
                              buildNearbyEvents(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNearbyEvents() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 12,
          ),
          ListView.builder(
            itemCount: nearbyEvents.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              final event = nearbyEvents[index];
              var animation = Tween<double>(begin: 800.0, end: 0.0).animate(
                CurvedAnimation(
                  parent: controller,
                  curve: Interval((1 / nearbyEvents.length) * index, 1.0,
                      curve: Curves.decelerate),
                ),
              );
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) => Transform.translate(
                  offset: Offset(animation.value, 0.0),
                  child: NearbyEventCard(
                    event,
                    onTap: () => viewEventDetail(event),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
