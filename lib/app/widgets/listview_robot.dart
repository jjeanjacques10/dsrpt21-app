import 'package:dsrpt21_app/app/models/production_line_model.dart';
import 'package:dsrpt21_app/app/models/robot_model.dart';
import 'package:dsrpt21_app/app/stores/robot_store.dart';
import 'package:flutter/material.dart';

import 'card_robot.dart';

class RobotListView extends StatelessWidget {
  const RobotListView(
      {Key key,
      @required this.robots,
      @required this.productionLine,
      @required this.robotModelStore})
      : super(key: key);

  final List<RobotModel> robots;
  final ProductionLineModel productionLine;
  final RobotStore robotModelStore;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //shrinkWrap: true,
      itemCount: robots == null ? 0 : robots.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Dismissible(
          onDismissed: (direction) {
            // removendo o item
          },
          key: Key(robots[index].id.toString()),
          child: cardRobot(
              context, robots[index], productionLine, robotModelStore),
          direction: DismissDirection.endToStart,
          background: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
