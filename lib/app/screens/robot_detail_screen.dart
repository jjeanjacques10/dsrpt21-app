import 'package:dsrpt21_app/app/models/robot_model.dart';
import 'package:dsrpt21_app/app/services/robot_service.dart';
import 'package:dsrpt21_app/app/widgets/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
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
  String selectedProfession = "Neutro";
  RobotService robotService = RobotService();
  bool selectedColor = false;
  double progressInteligence = 0.0;

  var isSelected = {
    "Laser": false,
    "Visão Noturna": false,
    "Esteira": false,
    "Braço": false,
    "Proteção IP68": false,
    "Blindagem": false,
    "Hélice": false,
    "Jetpack": false,
    "Visão Térmica": false,
    "GPS": false
  };

  @override
  Widget build(BuildContext context) {
    RobotModel robotModel = ModalRoute.of(context).settings.arguments;

    for (String k in isSelected.keys) {
      setState(() {
        if (robotModel.robotParts.contains(k)) {
          isSelected[k] = true;
        }
      });
    }

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
        actions: [
          IconButton(
            icon: Icon(MdiIcons.contentCopy),
            onPressed: () {
              robotService.create(robotModel).then((value) {
                robotModel.id = value.toString();
                AlertDialog alert = AlertDialog(
                  title: Icon(MdiIcons.robot),
                  content: Column(
                    children: [
                      Text('Robô Clonado'),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/detail-robot',
                                    arguments: robotModel);
                              },
                              child: ListTile(
                                leading: GFAvatar(
                                  size: 40,
                                  backgroundImage: AssetImage(
                                      "assets/models/${robotModel.model}.jpg"),
                                ),
                                title: Text(
                                  '${robotModel.name}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 2,
                                  ),
                                ),
                                subtitle: Text('${robotModel.profession}'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ); // show the dialog
                showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    Future.delayed(Duration(seconds: 3), () {});
                    return alert;
                  },
                );
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('assets/models/${robotModel.model}.jpg'),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 22),
            child: Center(
              child: Text(
                "$selectedProfession ${robotModel.sku}",
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                buildPokFeature(
                    selectedColor == false
                        ? '#${robotModel.color}'
                        : '#${_mainColor.value.toRadixString(16).toUpperCase().substring(2)}',
                    "Cor"),
                buildPokFeature("Nº ${robotModel.productionLine}", "Produção"),
                buildPokFeature("${robotModel.robotParts.length}", "Peças"),
              ],
            ),
          ),

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(onPressed: () {
                for (var i = 0; i < 10; i++) {
                  Future.delayed(
                      Duration(seconds: 10),
                      () => setState(() {
                            progressInteligence = i / 10;
                          }));
                }
              }),
              Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/logos/loading.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: GFProgressBar(
              padding: EdgeInsets.only(left: 18, right: 18),
              percentage: progressInteligence,
              lineHeight: 20,
              alignment: MainAxisAlignment.spaceBetween,
              child: Text(
                '${(progressInteligence * 100.0)}%',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              leading:
                  Icon(Icons.sentiment_dissatisfied, color: GFColors.DANGER),
              trailing:
                  Icon(Icons.sentiment_satisfied, color: GFColors.SUCCESS),
              backgroundColor: Colors.black26,
              progressBarColor: GFColors.PRIMARY,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                new ListTile(
                  leading: Icon(
                    MdiIcons.square,
                    color: selectedColor == false
                        ? Color(hexToColor('#${robotModel.color}'))
                        : Color(hexToColor(
                            '#${_mainColor.value.toRadixString(16).toUpperCase().substring(2)}')),
                  ),
                  title: Text(
                      "#${_mainColor.value.toRadixString(16).toUpperCase().substring(2)}"),
                  onTap: () {
                    setState(() {
                      robotModel.color =
                          "${_mainColor.value.toRadixString(16).toUpperCase().substring(2)}";
                    });
                    _openMainColorPicker();
                  },
                ),
                new ListTile(
                  leading: const Icon(MdiIcons.briefcaseVariant),
                  title: DropdownButtonFormField<String>(
                    value: selectedProfession,
                    decoration: new InputDecoration(
                      hintText: "profissão",
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedProfession = value;
                        robotModel.profession = value;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'profissão é obrigatória' : null,
                    items: [
                      "Vigilante",
                      "Médico",
                      "Bombeiro",
                      "Psicólogo",
                      "Auxiliar de fábrica",
                      "Neutro",
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
                                  color: isSelected['Laser']
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected['Laser'],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected['Laser'] = !isSelected['Laser'];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                            FilterChip(
                              label: Text('Visão Noturna'),
                              labelStyle: TextStyle(
                                  color: isSelected['Visão Noturna']
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected['Visão Noturna'],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected['Visão Noturna'] =
                                      !isSelected['Visão Noturna'];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                            FilterChip(
                              label: Text('Proteção IP68'),
                              labelStyle: TextStyle(
                                  color: isSelected['Proteção IP68']
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected['Proteção IP68'],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected['Proteção IP68'] =
                                      !isSelected['Proteção IP68'];
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
                                  color: isSelected['Esteira']
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected['Esteira'],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected['Esteira'] =
                                      !isSelected['Esteira'];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                            FilterChip(
                              label: Text('Braço'),
                              labelStyle: TextStyle(
                                  color: isSelected['Braço']
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected['Braço'],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected['Braço'] = !isSelected['Braço'];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                            FilterChip(
                              label: Text('Blindagem'),
                              labelStyle: TextStyle(
                                  color: isSelected['Blindagem']
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected['Blindagem'],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected['Blindagem'] =
                                      !isSelected['Blindagem'];
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
                              label: Text('GPS'),
                              labelStyle: TextStyle(
                                  color: isSelected['GPS']
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected['GPS'],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected['GPS'] = !isSelected['GPS'];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                            FilterChip(
                              label: Text('Hélice'),
                              labelStyle: TextStyle(
                                  color: isSelected['Hélice']
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected['Hélice'],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected['Hélice'] = !isSelected['Hélice'];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                            FilterChip(
                              label: Text('Jetpack'),
                              labelStyle: TextStyle(
                                  color: isSelected['Jetpack']
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected['Jetpack'],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected['Jetpack'] =
                                      !isSelected['Jetpack'];
                                });
                              },
                              selectedColor: Theme.of(context).accentColor,
                              checkmarkColor: Colors.white,
                            ),
                            FilterChip(
                              label: Text('Visão Térmica'),
                              labelStyle: TextStyle(
                                  color: isSelected['Visão Térmica']
                                      ? Colors.white
                                      : Colors.grey[600]),
                              selected: isSelected['Visão Térmica'],
                              onSelected: (bool selected) {
                                setState(() {
                                  isSelected['Visão Térmica'] =
                                      !isSelected['Visão Térmica'];
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
                  onPressed: () async {
                    robotModel.robotParts = [];
                    robotModel.color =
                        "${_mainColor.value.toRadixString(16).toUpperCase().substring(2)}";

                    setState(() {
                      for (String k in isSelected.keys) {
                        if (isSelected[k]) {
                          robotModel.robotParts.add(k);
                        }
                      }
                    });

                    robotService.update(robotModel);
                    //Navigator.pop(context);
                    showAlertDialog(
                        context, "Atualizado com sucesso!", Icon(Icons.check));
                  },
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
        onMainColorChange: (color) => setState(() {
          selectedColor = true;
          _tempMainColor = color;
        }),
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
