import 'package:dsrpt21_app/app/models/production_line_model.dart';
import 'package:dsrpt21_app/app/widgets/card_production.dart';
import 'package:flutter/material.dart';

class ProductionLineListView extends StatelessWidget {
  const ProductionLineListView({
    Key key,
    @required this.prodLinesModel,
  }) : super(key: key);

  final List<ProductionLineModel> prodLinesModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //shrinkWrap: true,
      itemCount: prodLinesModel == null ? 0 : prodLinesModel.length,
      itemBuilder: (BuildContext ctx, int index) {
        return cardProduction(context, prodLinesModel[index]);
      },
    );
  }
}
