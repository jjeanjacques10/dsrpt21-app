import 'dart:convert';
import 'dart:math';

import 'package:dsrpt21_app/app/models/production_line_model.dart';
import 'package:dsrpt21_app/app/models/robot_model.dart';
import 'package:dsrpt21_app/app/services/production_line_service.dart';
import 'package:dsrpt21_app/app/services/robot_service.dart';
import 'package:dsrpt21_app/app/widgets/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crypto/crypto.dart';

class CreateProductionLine extends StatefulWidget {
  CreateProductionLine({Key key}) : super(key: key);

  @override
  _CreateProductionLineState createState() => _CreateProductionLineState();
}

class _CreateProductionLineState extends State<CreateProductionLine> {
  TextEditingController dateStartCtl = TextEditingController();
  TextEditingController dateEndCtl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ProductionLineModel productionLineModel = ProductionLineModel();
  ProductionLineService productionLineService = ProductionLineService();
  String selectedModel = "model1";

  var _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Linha de produção'),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              new ListTile(
                leading: const Icon(Icons.person),
                title: new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Descrição",
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Descrição é obrigatório';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productionLineModel.description = value;
                  },
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.date_range),
                title: new TextFormField(
                  controller: dateStartCtl,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "Data Inicio",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'A data de inicio é obrigatória.';
                    }
                    return null;
                  },
                  onTap: () async {
                    DateTime date;
                    FocusScope.of(context).requestFocus(new FocusNode());

                    DateTime today = DateTime.now();

                    date = await showDatePicker(
                        context: context,
                        initialDate: today,
                        firstDate: today,
                        lastDate: today.add(Duration(days: 30)));

                    String dateSlug =
                        "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

                    String dateScreen =
                        "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString()}";

                    dateStartCtl.text = dateScreen;
                    productionLineModel.startDate = dateSlug != null
                        ? DateTime.parse(dateSlug)
                        : new DateTime.now();
                  },
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.date_range),
                title: new TextFormField(
                  controller: dateEndCtl,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "Data Final",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'A data final é obrigatória.';
                    }
                    return null;
                  },
                  onTap: () async {
                    DateTime date;
                    FocusScope.of(context).requestFocus(new FocusNode());

                    DateTime today = DateTime.now();

                    date = await showDatePicker(
                        context: context,
                        initialDate: today,
                        firstDate: today,
                        lastDate: today.add(Duration(days: 7300)));

                    String dateSlug =
                        "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

                    String dateScreen =
                        "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString()}";

                    dateEndCtl.text = dateScreen;
                    productionLineModel.endDate = dateSlug != null
                        ? DateTime.parse(dateSlug)
                        : new DateTime.now();
                  },
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.model_training),
                title: DropdownButtonFormField<String>(
                  value: selectedModel,
                  decoration: new InputDecoration(
                    hintText: "Modelo",
                  ),
                  onChanged: (value) {
                    selectedModel = value;
                    productionLineModel.model = value;
                  },
                  validator: (value) =>
                      value == null ? 'Modelo é obrigatória' : null,
                  items: [
                    "model1",
                    "model2",
                    "model3",
                    "model4",
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.save),
                title: new TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    hintText: "Quantidade",
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Quantidade é obrigatório';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productionLineModel.count = int.tryParse(value);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        const Color(0xFF3366FF),
                        const Color(0xFF00CCFF),
                      ]),
                ),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.transparent,
                  child: Text("Enviar Template"),
                  onPressed: () async => {},
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          try {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();

              productionLineModel.name = 'Produção | ${getRandomString(3)}';
              productionLineModel.status = 'Produzindo';

              productionLineService
                  .create(productionLineModel)
                  .then((productionLine) {
                createBots(productionLineModel.count, productionLine);

                Navigator.pop(context);
                showAlertDialog(
                    context, "Criado com sucesso!", Icon(Icons.check));
              }).catchError((onError) {
                SnackBar snackBar = SnackBar(
                  content: Text('Cadastro criado com sucesso!'),
                  action: SnackBarAction(
                    label: 'Ok',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
                Scaffold.of(context).showSnackBar(snackBar);
              });
            }
          } on Exception catch (e, s) {
            print(s);
          }
        },
        label: Container(
          width: 100,
          child: Text(
            'Enviar para produção',
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.ltr,
            maxLines: 2,
          ),
        ),
        icon: Icon(Icons.save),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  createBots(qtd, ProductionLineModel productionLineModel) async {
    RobotService robotService = RobotService();
    for (var i = 0; i < qtd; i++) {
      var randomNumber = getRandomString(5);

      RobotModel robotModel = RobotModel(
          name: 'Robot ${randomNumber + i.toString()}',
          profession: 'Não Definida',
          color: '#FFFFFF',
          productionLine: productionLineModel.id,
          robotParts: ['Corpo'],
          sku: getRandomString(4),
          model: productionLineModel.model);

      robotService.create(robotModel).then((robot) {
        print(robot);
      }).catchError((onError) {
        print(onError);
      });
    }
    Future.delayed(const Duration(seconds: 80), () {
      productionLineModel.status = 'Completo';
      productionLineService.update(productionLineModel).then((value) => null);
    });
  }
}
