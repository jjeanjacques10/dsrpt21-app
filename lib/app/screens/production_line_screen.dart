import 'package:dsrpt21_app/app/stores/production_line_store.dart';
import 'package:dsrpt21_app/app/widgets/listview_production_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shimmer/shimmer.dart';

class ProductionLineScreen extends StatefulWidget {
  ProductionLineScreen({Key key}) : super(key: key);

  static const _highLightColor = Color.fromRGBO(64, 75, 96, .1);

  @override
  _ProductionLineScreenState createState() => _ProductionLineScreenState();
}

class _ProductionLineScreenState extends State<ProductionLineScreen> {
  final ProductionLineStore productionLineStore = ProductionLineStore();

  @override
  Widget build(BuildContext context) {
    double containerWidth = 220.0;
    double containerHeight = 10.0;
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
              return Shimmer.fromColors( 
                baseColor: Colors.grey[300], 
                highlightColor: Colors.white,
                child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), 
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                  height: 60.0,
                  width: 80.0,
                  color: Colors.grey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      height: containerHeight,
                      width: containerWidth * 0.75,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5.0),
                      ],
                    )
                  ],
                ),   
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
