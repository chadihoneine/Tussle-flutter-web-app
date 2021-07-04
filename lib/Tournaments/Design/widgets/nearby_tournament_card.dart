
import 'package:flutter/material.dart';
import 'package:tussle_app/Tournaments/Design/constant/color.dart';
import 'package:tussle_app/Tournaments/Design/constant/text_style.dart';
import 'package:tussle_app/Tournaments/Design/models/tournament_model.dart';
import 'package:tussle_app/Tournaments/Design/utils/datetime_utils.dart';
import 'package:tussle_app/Tournaments/Design/widgets/ui_helper.dart';


class NearbyTournamentCard extends StatelessWidget {
  final Tournament tournament;
  final Function onTap;
  NearbyTournamentCard(this.tournament, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            buildImage(),
            buildTournamentInfo(context),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: imgBG,
        width: 80,
        height: 100,
        child: Hero(
          tag: tournament.image,
          child: Image.network(
            tournament.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildTournamentInfo(context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(DateTimeUtils.getFullDate(tournament.date), style: monthStyle),
          UIHelper.verticalSpace(8),
          Text(tournament.name, style: titleStyle),
          UIHelper.verticalSpace(8),
          Row(
            children: <Widget>[
              Icon(Icons.location_on, size: 16, color: Theme.of(context).primaryColor),
              UIHelper.horizontalSpace(4),
              Text(tournament.location.toUpperCase(), style: subtitleStyle),
            ],
          ),
        ],
      ),
    );
  }
}
