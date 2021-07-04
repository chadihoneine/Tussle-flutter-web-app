import 'package:flutter/material.dart';
import 'package:tussle_app/Tournaments/Design/constant/color.dart';
import 'package:tussle_app/Tournaments/Design/constant/text_style.dart';
import 'package:tussle_app/Tournaments/Design/models/tournament_model.dart';
import 'package:tussle_app/Tournaments/Design/utils/datetime_utils.dart';
import 'package:tussle_app/Tournaments/Design/widgets/ui_helper.dart';

class TournamentsCard extends StatelessWidget {
  final Tournament tournament;
  final Function onTap;
  TournamentsCard(this.tournament, {this.onTap});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: <Widget>[
          Expanded(child: buildImage()),
          UIHelper.verticalSpace(24),
          buildEventInfo(context),
        ],
      ),
    );
  }

  Widget buildImage() {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: imgBG,
          width: double.infinity,
          child: Hero(
            tag: tournament.image,
            child: Image.network(
              tournament.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEventInfo(BuildContext context) {
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
                Text("${DateTimeUtils.getMonth(tournament.date)}", style: monthStyle),
                Text("${DateTimeUtils.getDayOfMonth(tournament.date)}", style: titleStyle),
              ],
            ),
          ),
          UIHelper.horizontalSpace(16),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(tournament.name, style: titleStyle),
              UIHelper.verticalSpace(4),
              Row(
                children: <Widget>[
                  Icon(Icons.location_on, size: 16, color: Theme.of(context).primaryColor),
                  UIHelper.horizontalSpace(4),
                  Text(tournament.location.toUpperCase(), style: subtitleStyle),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
