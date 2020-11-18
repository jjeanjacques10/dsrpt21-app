import 'package:dsrpt21_app/app/models/robot_model.dart';
import 'package:flutter/material.dart';

class RobotDetailScreen extends StatefulWidget {
  RobotDetailScreen({Key key}) : super(key: key);

  @override
  _RobotDetailScreenState createState() => _RobotDetailScreenState();
}

class _RobotDetailScreenState extends State<RobotDetailScreen> {
  final _formKey = GlobalKey<FormState>();

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
                  title: new TextFormField(
                    initialValue: robotModel.color,
                    decoration: new InputDecoration(
                      hintText: "Cor",
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Cor é obrigatória';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      robotModel.color = value;
                    },
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.eject),
                  title: new TextFormField(
                    initialValue: robotModel.profession,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "Profissão",
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Profissão é obrigatório';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      robotModel.color = value;
                    },
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.party_mode),
                  title: new TextFormField(
                    initialValue: robotModel.robotParts.toString(),
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "Partes",
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Partes é obrigatório';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      robotModel.color = value;
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
          buildPokFeature(color, "Color"),
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
}
