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
              '${productionLineModel.startDate.year}-${productionLineModel.endDate.year}\nQtd:${productionLineModel.count.toString()}',
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
                  Navigator.pushNamed(context, '/detail-production',
                      arguments: productionLineModel);
                },
                text: 'Completa',
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
