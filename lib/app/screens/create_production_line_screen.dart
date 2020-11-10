import 'package:dsrpt21_app/app/layout/colors.dart';
import 'package:dsrpt21_app/app/models/production_line_model.dart';
import 'package:dsrpt21_app/app/services/production_line_service.dart';
import 'package:dsrpt21_app/app/widgets/show_alert_dialog.dart';
import 'package:flutter/material.dart';

class CreateProductionLine extends StatefulWidget {
  CreateProductionLine({Key key}) : super(key: key);

  @override
  _CreateProductionLineState createState() => _CreateProductionLineState();
}

class _CreateProductionLineState extends State<CreateProductionLine> {
  final _formKey = GlobalKey<FormState>();
  ProductionLineModel productionLineModel = ProductionLineModel();
  ProductionLineService productionLineService = ProductionLineService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Linha de produção'),
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
                    hintText: "UUID",
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
                leading: const Icon(Icons.phone),
                title: new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Nome da linha de produção",
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
                leading: const Icon(Icons.save),
                title: new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Tipo Robô",
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
        backgroundColor: AppColors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
