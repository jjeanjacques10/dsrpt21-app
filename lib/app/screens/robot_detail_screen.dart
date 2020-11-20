import 'package:dsrpt21_app/app/models/robot_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RobotDetailScreen extends StatefulWidget {
  RobotDetailScreen({Key key}) : super(key: key);

  @override
  _RobotDetailScreenState createState() => _RobotDetailScreenState();
}

class _RobotDetailScreenState extends State<RobotDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  ColorSwatch _tempMainColor;
  ColorSwatch _mainColor = Colors.blue;
  String selectedProfession = "Não Definida";
  var isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    RobotModel robotModel = ModalRoute.of(context).settings.arguments;
    setState(() {
      selectedProfession = robotModel.profession;
    });
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
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 22),
            child: Center(
              child: Text(
                "Profissão: $selectedProfession",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
          ),
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
                  leading: Icon(
                    MdiIcons.square,
                    color: Color(hexToColor(
                        '#${_mainColor.value.toRadixString(16).toUpperCase().substring(2)}')),
                  ),
                  title: Text(
                      "#${_mainColor.value.toRadixString(16).toUpperCase().substring(2)}"),
                  onTap: () {
                    setState(() {
                      robotModel.color = _mainColor.value
                          .toRadixString(16)
                          .toUpperCase()
                          .substring(2);
                    });
                    _openMainColorPicker();
                  },
                ),
                new ListTile(
                  leading: const Icon(MdiIcons.briefcase),
                  title: DropdownButtonFormField<String>(
                    value: selectedProfession,
                    decoration: new InputDecoration(
                      hintText: "profissão",
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedProfession = value;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'profissão é obrigatória' : null,
                    items: [
                      "Vigilante",
                      "Medico",
                      "Bombeiro",
                      "Psicólogo",
                      "Auxiliar de fábrica",
                      "Não Definida",
                    ].map<DropdownMenuItem<String>>((String value) {
                      setState(() {
                        selectedProfession = value;
                      });
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                new ListTile(
                    leading: const Icon(MdiIcons.robotIndustrial),
                    title: Column(
                      children: [
                        Wrap(
                          children: [
                            FilterChip(
                              label: Text('Laser'),
                              labelStyle: TextStyle(
                                  color: isSelected[0]
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected[0],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected[0] = !isSelected[0];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                            FilterChip(
                              label: Text('Visão Noturna'),
                              labelStyle: TextStyle(
                                  color: isSelected[1]
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected[1],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected[1] = !isSelected[1];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                            FilterChip(
                              label: Text('Proteção IP68'),
                              labelStyle: TextStyle(
                                  color: isSelected[2]
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected[2],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected[2] = !isSelected[2];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            FilterChip(
                              label: Text('Esteira'),
                              labelStyle: TextStyle(
                                  color: isSelected[3]
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected[3],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected[3] = !isSelected[3];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                            FilterChip(
                              label: Text('Braço'),
                              labelStyle: TextStyle(
                                  color: isSelected[4]
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected[4],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected[4] = !isSelected[4];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                            FilterChip(
                              label: Text('Blindagem'),
                              labelStyle: TextStyle(
                                  color: isSelected[5]
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected[5],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected[5] = !isSelected[5];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            FilterChip(
                              label: Text('Hélice'),
                              labelStyle: TextStyle(
                                  color: isSelected[6]
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected[6],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected[6] = !isSelected[6];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                            FilterChip(
                              label: Text('Jetpack'),
                              labelStyle: TextStyle(
                                  color: isSelected[7]
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected[7],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected[7] = !isSelected[7];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                            FilterChip(
                              label: Text('Visão Térmica'),
                              labelStyle: TextStyle(
                                  color: isSelected[8]
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected[8],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected[8] = !isSelected[8];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                RaisedButton.icon(
                  textColor: Colors.white,
                  color: Colors.blue,
                  icon: Icon(MdiIcons.refreshCircle),
                  label: Text("Atualizar Robô"),
                  onPressed: () async {},
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
          padding: EdgeInsets.only(left: 5),
          child: Wrap(
            children: [
              FilterChip(
                label: Text(
                  items[i],
                ),
                selected: false,
                onSelected: (bool selected) {
                  setState(() {});
                },
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )));
    }
    return Container(
      height: 80,
      child: Flexible(
        child: ListView(
            padding: EdgeInsets.only(left: 30),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: list),
      ),
    );
  }

  void _openMainColorPicker() async {
    _openDialog(
      "Selecionar Cor do Robô",
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
              child: Text('Cancelar'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('Selecionar'),
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

  int hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return int.parse(hexString.replaceFirst('#', '0x$alphaChannel'));
  }
}
