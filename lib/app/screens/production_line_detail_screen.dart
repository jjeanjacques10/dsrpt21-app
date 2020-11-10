import 'package:dsrpt21_app/app/models/production_line_model.dart';
import 'package:dsrpt21_app/app/stores/robot_store.dart';
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
    ProductionLineModel productionLineModel =
        ModalRoute.of(context).settings.arguments;

    robotModelStore.setFilter(int.tryParse(productionLineModel.id));

    return Scaffold(
        appBar: AppBar(
          title: Text(productionLineModel.name),
        ),
        body: Observer(
          builder: (ctx) {
            if (robotModelStore.isLoading) {
              return CircularProgressIndicator();
              //return CursoListViewLoading();
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
                        Text('Modelo: ${productionLineModel.model}'),
                        Text('Quantidade: ${productionLineModel.count}'),
                        Text(
                            "Data Inicio: ${productionLineModel.startDate.day.toString()}/${productionLineModel.startDate.month.toString().padLeft(2, '0')}/${productionLineModel.startDate.year.toString().padLeft(2, '0')}"),
                        Text(
                            "Data Final: ${productionLineModel.endDate.day.toString()}/${productionLineModel.endDate.month.toString().padLeft(2, '0')}/${productionLineModel.endDate.year.toString().padLeft(2, '0')}"),
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
