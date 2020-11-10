import 'package:dsrpt21_app/app/models/robot_model.dart';
import 'package:flutter/material.dart';

class RobotDetailScreen extends StatefulWidget {
  RobotDetailScreen({Key key}) : super(key: key);

  @override
  _RobotDetailScreenState createState() => _RobotDetailScreenState();
}

class _RobotDetailScreenState extends State<RobotDetailScreen> {
  @override
  Widget build(BuildContext context) {
    RobotModel robotModel = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(robotModel.sku),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 15),
        child: Column(children: [Text(robotModel.toJson().toString())]),
      ),
    );
  }
}
