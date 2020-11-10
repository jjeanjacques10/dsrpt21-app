import 'package:dsrpt21_app/app/models/production_line_model.dart';
import 'package:flutter/material.dart';

class ProductionLineDetailScreen extends StatefulWidget {
  ProductionLineDetailScreen({Key key}) : super(key: key);

  @override
  _ProductionLineDetailScreenState createState() =>
      _ProductionLineDetailScreenState();
}

class _ProductionLineDetailScreenState
    extends State<ProductionLineDetailScreen> {
  @override
  Widget build(BuildContext context) {
    ProductionLineModel productionLineModel =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(productionLineModel.name),
      ),
      body: Text(productionLineModel.name),
    );
  }
}
