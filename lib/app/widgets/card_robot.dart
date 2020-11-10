import 'package:dsrpt21_app/app/models/production_line_model.dart';
import 'package:dsrpt21_app/app/models/robot_model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';

Card cardRobot(BuildContext context, RobotModel robotModel,
    ProductionLineModel productionLine) {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/detail-robot',
                arguments: robotModel);
          },
          child: ListTile(
            leading: GFAvatar(
              size: 40,
              backgroundImage:
                  AssetImage("assets/models/${productionLine.model}.jpg"),
            ),
            title: Text(
              '${robotModel.sku}',
              style: TextStyle(
                fontSize: 15,
                height: 2,
              ),
            ),
            subtitle: Text('${robotModel.profession}'),
          ),
        ),
      ],
    ),
  );
}
