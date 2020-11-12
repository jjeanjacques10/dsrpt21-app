import 'package:dsrpt21_app/app/models/production_line_model.dart';
import 'package:dsrpt21_app/app/widgets/card_production.dart';
import 'package:flutter/material.dart';

class ProductionLineListView extends StatelessWidget {
  const ProductionLineListView({
    Key key,
    @required this.prodLinesModel,
    this.qtd,
  }) : super(key: key);

  final List<ProductionLineModel> prodLinesModel;
  final int qtd;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //shrinkWrap: true,
      itemCount: qtd == null || qtd > prodLinesModel.length
          ? prodLinesModel == null ? 0 : prodLinesModel.length
          : qtd,
      itemBuilder: (BuildContext ctx, int index) {
        return cardProduction(context, prodLinesModel[index]);
      },
    );
  }
}
