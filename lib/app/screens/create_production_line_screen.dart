import 'package:dsrpt21_app/app/layout/colors.dart';
import 'package:dsrpt21_app/app/models/production_line_model.dart';
import 'package:flutter/material.dart';

class CreateProductionLine extends StatefulWidget {
  CreateProductionLine({Key key}) : super(key: key);

  @override
  _CreateProductionLineState createState() => _CreateProductionLineState();
}

class _CreateProductionLineState extends State<CreateProductionLine> {
  final _formKey = GlobalKey<FormState>();
  ProductionLineModel productionLineModel = ProductionLineModel();

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
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "UUID",
                  ),
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.phone),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Nome da linha de produção",
                  ),
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.date_range),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Data Inicio",
                  ),
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.date_range),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Data Final",
                  ),
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.save),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Tipo Robô",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigator.pushNamed(context, '/create-production');
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
