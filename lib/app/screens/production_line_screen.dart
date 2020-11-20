import 'package:dsrpt21_app/app/stores/production_line_store.dart';
import 'package:dsrpt21_app/app/widgets/card_production_shimmer.dart';
import 'package:dsrpt21_app/app/widgets/listview_production_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductionLineScreen extends StatefulWidget {
  ProductionLineScreen({Key key}) : super(key: key);

  @override
  _ProductionLineScreenState createState() => _ProductionLineScreenState();
}

class _ProductionLineScreenState extends State<ProductionLineScreen> {
  final ProductionLineStore productionLineStore = ProductionLineStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Linhas de Produção'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    const Color(0xFF3366FF),
                    const Color(0xFF00CCFF),
                  ]),
            ),
          ),
        ),
        body: Observer(
          builder: (ctx) {
            if (productionLineStore.isLoading) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: 'Pesquisar',
                          hintStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          contentPadding: EdgeInsets.only(
                            right: 30,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 16.0, left: 24.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    cardProductionShimmer(),
                    cardProductionShimmer(),
                    cardProductionShimmer(),
                    cardProductionShimmer(),
                    cardProductionShimmer(),
                  ],
                ),
              );
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: TextField(
                      onChanged: productionLineStore.setFilter,
                      decoration: InputDecoration(
                        hintText: 'Pesquisar',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.only(
                          right: 30,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 16.0, left: 24.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        productionLineStore.init();
                      },
                      child: ProductionLineListView(
                          prodLinesModel: productionLineStore.filtered),
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}
