import 'package:flutter/material.dart';

class CreateProductionLine extends StatefulWidget {
  CreateProductionLine({Key key}) : super(key: key);

  @override
  _CreateProductionLineState createState() => _CreateProductionLineState();
}

class _CreateProductionLineState extends State<CreateProductionLine> {
  final _formKey = GlobalKey<FormState>();

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
    );
  }
}
