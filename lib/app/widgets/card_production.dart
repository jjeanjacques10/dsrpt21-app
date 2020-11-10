import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';

Card carProduction() {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        ListTile(
          leading: GFAvatar(
            size: 40,
            backgroundImage: AssetImage("assets/models/model1.jpg"),
          ),
          title: const Text(
            'Nome linha de produção',
            style: TextStyle(
              fontSize: 20,
              height: 2,
            ),
          ),
          subtitle: Text(
            '2020-2026\nQtd:100',
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: GFButton(
                onPressed: () {},
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
