import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tussle_app/Tournaments/Design/constant/color.dart';
import 'package:tussle_app/Tournaments/Design/constant/text_style.dart';
import 'package:tussle_app/Tournaments/Design/models/tournament_model.dart';
import 'package:tussle_app/Tournaments/Design/utils/datetime_utils.dart';
import 'package:tussle_app/Tournaments/Design/widgets/ui_helper.dart';

class TournamentDetailPage extends StatefulWidget {
  final Tournament tournament;
  TournamentDetailPage(this.tournament);
  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<TournamentDetailPage>
    with TickerProviderStateMixin {
  Tournament tournament;
  AnimationController controller;
  AnimationController bodyScrollAnimationController;
  ScrollController scrollController;
  Animation<double> scale;
  Animation<double> appBarSlide;
  double headerImageSize = 0;
  bool isFavorite = false;

  @override
  void initState() {
    tournament = widget.tournament;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    bodyScrollAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
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

  @override
  Widget build(BuildContext context) {
    headerImageSize = MediaQuery.of(context).size.height / 2.5;
    return ScaleTransition(
      scale: scale,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildHeaderImage(),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          buildTournamentTitle(),
                          UIHelper.verticalSpace(16),
                          buildTournamentDate(),
                          UIHelper.verticalSpace(16),
                          buildOrganizeInfo(),
                          UIHelper.verticalSpace(24),
                          buildAboutTournament(),
                          UIHelper.verticalSpace(16),
                          buildLocationTournament(),
                          UIHelper.verticalSpace(16),
                          buildCriteriaTournament(),
                          UIHelper.verticalSpace(16),
                          buildCategoryTournament(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedBuilder(
                animation: appBarSlide,
                builder: (context, snapshot) {
                  return Transform.translate(
                    offset: Offset(0.0, -1000 * (1 - appBarSlide.value)),
                    child: Material(
                      elevation: 2,
                      color: Theme.of(context).primaryColor,
                      child: buildHeaderButton(hasTitle: true),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeaderImage() {
    double maxHeight = MediaQuery.of(context).size.height;
    double minimumScale = 0.8;
    return GestureDetector(
      onVerticalDragUpdate: (detail) {
        controller.value += detail.primaryDelta / maxHeight * 2;
      },
      onVerticalDragEnd: (detail) {
        if (scale.value > minimumScale) {
          controller.reverse();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: headerImageSize,
            child: Hero(
              tag: tournament.image,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(32)),
                child: Image.network(
                  tournament.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          buildHeaderButton(),
        ],
      ),
    );
  }

  Widget buildHeaderButton({bool hasTitle = false}) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 0,
              child: InkWell(
                onTap: () {
                  if (bodyScrollAnimationController.isCompleted)
                    bodyScrollAnimationController.reverse();
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: hasTitle ? Colors.white : Colors.black,
                  ),
                ),
              ),
              color: hasTitle ? Theme.of(context).primaryColor : Colors.white,
            ),
            if (hasTitle)
              Text(tournament.name,
                  style: titleStyle.copyWith(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget buildTournamentTitle() {
    return Container(
      child: Text(
        tournament.name,
        style: headerStyle.copyWith(fontSize: 32),
      ),
    );
  }

  Widget buildTournamentDate() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: primaryLight,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("${DateTimeUtils.getMonth(tournament.date)}",
                    style: monthStyle),
                Text("${DateTimeUtils.getDayOfMonth(tournament.date)}",
                    style: titleStyle),
              ],
            ),
          ),
          UIHelper.horizontalSpace(12),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(DateTimeUtils.getDayOfWeek(tournament.date),
                  style: titleStyle),
              UIHelper.verticalSpace(4),
              Text("10:00 - 12:00 PM", style: subtitleStyle),
            ],
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.all(2),
            decoration:
                ShapeDecoration(shape: StadiumBorder(), color: primaryLight),
            child: Row(
              children: <Widget>[
                UIHelper.horizontalSpace(8),
                Text("Unjoin",
                    style: subtitleStyle.copyWith(
                        color: Theme.of(context).primaryColor)),
                FloatingActionButton(
                  mini: true,
                  onPressed: () {},
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAboutTournament() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("About", style: headerStyle),
        UIHelper.verticalSpace(),
        Text(tournament.description, style: subtitleStyle),
        UIHelper.verticalSpace(8),
      ],
    );
  }

  Widget buildLocationTournament() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Loaction", style: headerStyle),
        UIHelper.verticalSpace(),
        Text(tournament.location, style: subtitleStyle),
        UIHelper.verticalSpace(8),
      ],
    );
  }

  Widget buildCriteriaTournament() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Criteria", style: headerStyle),
        UIHelper.verticalSpace(),
        Text(tournament.criteria, style: subtitleStyle),
        UIHelper.verticalSpace(8),
      ],
    );
  }

  Widget buildCategoryTournament() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Category", style: headerStyle),
        UIHelper.verticalSpace(),
        Text(tournament.category, style: subtitleStyle),
        UIHelper.verticalSpace(8),
      ],
    );
  }

  Widget buildOrganizeInfo() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          child: Text(tournament.organizer[0]),
        ),
        UIHelper.horizontalSpace(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(tournament.organizer, style: titleStyle),
            UIHelper.verticalSpace(4),
            Text("Organizer", style: subtitleStyle),
          ],
        ),
        Spacer(),
      ],
    );
  }
}
