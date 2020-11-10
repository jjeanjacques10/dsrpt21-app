import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ProductionLineScreen extends StatefulWidget {
  ProductionLineScreen({Key key}) : super(key: key);

  @override
  _ProductionLineScreenState createState() => _ProductionLineScreenState();
}

List list = [
  "Flutter",
  "React",
  "Ionic",
  "Xamarin",
];

class _ProductionLineScreenState extends State<ProductionLineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linhas de Produção'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            GFSearchBar(
              searchList: list,
              searchQueryBuilder: (query, list) {
                return list
                    .where((item) =>
                        item.toLowerCase().contains(query.toLowerCase()))
                    .toList();
              },
              overlaySearchListItemBuilder: (item) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              },
              onItemSelected: (item) {
                setState(() {
                  print('$item');
                });
              },
            ),
            Text(''),
          ],
        ),
      ),
    );
  }
}
