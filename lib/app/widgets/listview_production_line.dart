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
        return Dismissible(
          onDismissed: (direction) {
            // removendo o item
          },
          key: Key(prodLinesModel[index].id.toString()),
          child: cardProduction(context, prodLinesModel[index]),
          direction: DismissDirection.endToStart,
          background: Padding(
            padding: const EdgeInsets.all(88.0),
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
