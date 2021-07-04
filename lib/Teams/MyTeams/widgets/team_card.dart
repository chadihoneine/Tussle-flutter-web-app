import 'package:flutter/material.dart';
import 'package:tussle_app/Events/widgets/ui_helper.dart';
import 'package:tussle_app/Teams/TeamList/models/team_model.dart';
import 'package:tussle_app/Tournaments/Design/constant/color.dart';
import 'package:tussle_app/Tournaments/Design/constant/text_style.dart';

class TeamCard extends StatelessWidget {
  final Team team;
  final Function onTap;
  TeamCard(this.team, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            buildImage(),
            buildEventInfo(context),
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
          tag: team.image,
          child: Image.network(
            team.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildEventInfo(context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(team.name, style: titleStyle),
          UIHelper.verticalSpace(8),
          Row(
            children: <Widget>[
              Icon(Icons.merge_type, size: 20, color: Theme.of(context).primaryColor),
              UIHelper.horizontalSpace(4),
              Text(team.type.toUpperCase(), style: subtitleStyle),
            ],
          ),
        ],
      ),
    );
  }
}
