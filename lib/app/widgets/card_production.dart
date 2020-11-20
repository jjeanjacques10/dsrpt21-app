import 'package:dsrpt21_app/app/models/production_line_model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';

Card cardProduction(
    BuildContext context, ProductionLineModel productionLineModel) {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/detail-production',
                arguments: productionLineModel);
          },
          child: ListTile(
            leading: GFAvatar(
              size: 40,
              backgroundImage:
                  AssetImage("assets/models/${productionLineModel.model}.jpg"),
            ),
            title: Text(
              '${productionLineModel.name}',
              style: TextStyle(
                fontSize: 20,
                height: 2,
              ),
            ),
            subtitle: Text(
              '${productionLineModel.startDate.year}-${productionLineModel.endDate.year}\nQuantidade:${productionLineModel.count.toString()}',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: GFButton(
                onPressed: () {
                  if (productionLineModel.status != 'produzindo') {
                    Navigator.pushNamed(context, '/detail-production',
                        arguments: productionLineModel);
                  }
                },
                text: productionLineModel.status,
                color: getColor(productionLineModel.status),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

getColor(String status) {
  switch (status) {
    case 'Completo':
      return Colors.green;
      break;
    case 'Produzindo':
      return Colors.amber[700];
    default:
      return Colors.white;
  }
}
