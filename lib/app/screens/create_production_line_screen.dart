import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:dsrpt21_app/app/layout/colors.dart';
import 'package:dsrpt21_app/app/models/production_line_model.dart';
import 'package:dsrpt21_app/app/services/production_line_service.dart';
import 'package:dsrpt21_app/app/widgets/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class CreateProductionLine extends StatefulWidget {
  CreateProductionLine({Key key}) : super(key: key);

  @override
  _CreateProductionLineState createState() => _CreateProductionLineState();
}

class _CreateProductionLineState extends State<CreateProductionLine> {
  final _formKey = GlobalKey<FormState>();
  ProductionLineModel productionLineModel = ProductionLineModel();
  ProductionLineService productionLineService = ProductionLineService();
  String selectedModel = "model1";

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
                    hintText: "Nome",
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Nome é obrigatório';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productionLineModel.name = value;
                  },
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.date_range),
                title: new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Data Inicio",
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Nome é obrigatório';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productionLineModel.name = value;
                  },
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.date_range),
                title: new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Data Final",
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Nome é obrigatório';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productionLineModel.name = value;
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
                  onChanged: (city) {
                    selectedModel = city;
                    productionLineModel.model = city;
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
              RaisedButton(onPressed: () async => {})
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          try {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();

              productionLineService
                  .create(productionLineModel)
                  .then((userCreated) {
                SnackBar snackBar = SnackBar(
                  content: Text('Cadastro atualizado com sucesso!'),
                  action: SnackBarAction(
                    label: 'Ok',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
                Navigator.pop(context);
                showAlertDialog(
                    context, "Criado com sucesso", Icon(Icons.check));
                Scaffold.of(context).showSnackBar(snackBar);
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
}
