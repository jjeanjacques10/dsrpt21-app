import 'package:dsrpt21_app/app/models/production_line_model.dart';
import 'package:dsrpt21_app/app/stores/robot_store.dart';
import 'package:dsrpt21_app/app/widgets/card_robot_shimmer.dart';
import 'package:dsrpt21_app/app/widgets/listview_robot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductionLineDetailScreen extends StatefulWidget {
  ProductionLineDetailScreen({Key key}) : super(key: key);

  @override
  _ProductionLineDetailScreenState createState() =>
      _ProductionLineDetailScreenState();
}

class _ProductionLineDetailScreenState
    extends State<ProductionLineDetailScreen> {
  final RobotStore robotModelStore = RobotStore();

  @override
  Widget build(BuildContext context) {
    double containerWidth = 220.0;
    double containerHeight = 10.0;
    ProductionLineModel productionLineModel =
        ModalRoute.of(context).settings.arguments;

    robotModelStore.setFilter(productionLineModel.id);

    return Scaffold(
        appBar: AppBar(
          title: Text(productionLineModel.name),
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
            if (robotModelStore.isLoading) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 30, right: 30, top: 30, bottom: 20),
                      child: Column(
                        children: [
                          Text(
                            'Modelo: -          ',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Quantidade: - ',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Data Inicio: 00/00/0000",
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Data Final: 00/00/0000",
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    cardRobotShimmer(),
                    cardRobotShimmer(),
                    cardRobotShimmer(),
                    cardRobotShimmer(),
                    cardRobotShimmer(),
                    cardRobotShimmer(),
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
                    child: Column(
                      children: [
                        Text(
                          'Modelo: ${productionLineModel.model}',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Quantidade: ${productionLineModel.count}',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Data Inicio: ${productionLineModel.startDate.day.toString()}/${productionLineModel.startDate.month.toString().padLeft(2, '0')}/${productionLineModel.startDate.year.toString().padLeft(2, '0')}",
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Data Final: ${productionLineModel.endDate.day.toString()}/${productionLineModel.endDate.month.toString().padLeft(2, '0')}/${productionLineModel.endDate.year.toString().padLeft(2, '0')}",
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        robotModelStore.setFilter(productionLineModel.id);
                        robotModelStore.init();
                      },
                      child: RobotListView(
                          robots: robotModelStore.filtered,
                          productionLine: productionLineModel),
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}
