import 'package:dsrpt21_app/app/models/robot_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class RobotDetailScreen extends StatefulWidget {
  RobotDetailScreen({Key key}) : super(key: key);

  @override
  _RobotDetailScreenState createState() => _RobotDetailScreenState();
}

class _RobotDetailScreenState extends State<RobotDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  ColorSwatch _tempMainColor;
  ColorSwatch _mainColor = Colors.blue;
  String selectedProfession = "Policial";

  @override
  Widget build(BuildContext context) {
    RobotModel robotModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(robotModel.name),
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
      body: ListView(
        children: <Widget>[
          _buildImagemDetalhes('assets/models/${robotModel.model}.jpg'),
          _buildTitle("Profissão: ${robotModel.profession}"),
          SizedBox(
            height: 16,
          ),
          _buildLineDetailIcons(robotModel.color, robotModel.productionLine,
              robotModel.robotParts.length),
          SizedBox(
            height: 16,
          ),
          _buildSubtitle("Peças"),
          SizedBox(
            height: 15,
          ),
          buildList(robotModel.robotParts),
          _buildSubtitle("Configuração"),
          SizedBox(
            height: 15,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                new ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                      "#${_mainColor.value.toRadixString(16).toUpperCase().substring(2)}"),
                  onTap: _openMainColorPicker,
                ),
                new ListTile(
                  leading: const Icon(Icons.eject),
                  title: DropdownButtonFormField<String>(
                    value: selectedProfession,
                    decoration: new InputDecoration(
                      hintText: "profissão",
                    ),
                    onChanged: (value) {
                      selectedProfession = value;
                      //productionLineModel.model = value;
                    },
                    validator: (value) =>
                        value == null ? 'profissão é obrigatória' : null,
                    items: [
                      "Policial",
                      "Medico",
                      "Bombeiro",
                      "Programador",
                      "Auxiliar de fabrica",
                      "Não Definida",
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                new ListTile(
                    leading: const Icon(Icons.party_mode),
                    title: Column(
                      children: [
                        Row(
                          children: [
                            FilterChip(
                              label: Text('esteira'),
                              selected: true,
                              onSelected: (bool value) {},
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FilterChip(
                              label: Text('pernas'),
                              onSelected: (bool value) {},
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FilterChip(
                              label: Text('laser'),
                              selected: true,
                              onSelected: (bool value) {},
                            ),
                          ],
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FilterChip(
                              label: Text('Filter 1'),
                              selected: true,
                              onSelected: (bool value) {},
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FilterChip(
                              label: Text('Filter 2'),
                              onSelected: (bool value) {},
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FilterChip(
                              label: Text('Filter 3'),
                              selected: true,
                              onSelected: (bool value) {},
                            ),
                          ],
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FilterChip(
                              label: Text('Filter 1'),
                              selected: true,
                              onSelected: (bool value) {},
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FilterChip(
                              label: Text('Filter 2'),
                              onSelected: (bool value) {},
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FilterChip(
                              label: Text('Filter 3'),
                              selected: true,
                              onSelected: (bool value) {},
                            ),
                          ],
                        ),
                      ],
                    )),
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
                    child: Text("Atualizar"),
                    onPressed: () async => {},
                  ),
                )
              ],
            ),
          ),
          //_buildTextDetails(robotModel.sku),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  _buildImagemDetalhes(image) {
    return Image.asset(image);
  }

  _buildTitle(titulo) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Text(
          titulo,
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  _buildLineDetailIcons(color, prod, parts) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          buildPokFeature(
              "#${_mainColor.value.toRadixString(16).toUpperCase().substring(2)}",
              "Color"),
          buildPokFeature("$prod", "Produção"),
          buildPokFeature("$parts", "Peças"),
        ],
      ),
    );
  }

  _buildSubtitle(subtitulo) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        subtitulo,
        style: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  _buildTextDetails(texto) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        texto,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 15,
        ),
      ),
    );
  }

  buildPokFeature(String value, String feature) {
    return Expanded(
      child: Container(
        height: 70,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[200],
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              feature,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildList(items) {
    List<Widget> list = [];
    for (var i = 0; i < items.length; i++) {
      list.add(Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          items[i],
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 15,
          ),
        ),
      ));
    }
    return Container(
      height: 80,
      child: Flexible(
        child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: list),
      ),
    );
  }

  void _openMainColorPicker() async {
    _openDialog(
      "Main Color picker",
      MaterialColorPicker(
        selectedColor: _mainColor,
        allowShades: false,
        onMainColorChange: (color) => setState(() => _tempMainColor = color),
      ),
    );
  }

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            FlatButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('SUBMIT'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _mainColor = _tempMainColor);
              },
            ),
          ],
        );
      },
    );
  }
}
