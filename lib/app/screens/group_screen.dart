import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/getwidget.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipe Asimov'),
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
        child: Column(children: [
          SizedBox(
            height: 15,
          ),
          cardGroup('Jean Jacques Barros', 'Programador de IA',
              'https://avatars3.githubusercontent.com/u/32225403?s=400&u=9c1a04035cc7b4e8749679fd87d0732c26a3dcd4&v=4'),
          cardGroup('Vinicius Mota', 'Gerente de Linha de produção',
              'https://avatars2.githubusercontent.com/u/48091834?s=400&u=93e2b5701c31a7c794286f5a1f6eef324c1c091c&v=4'),
          cardGroup('Gabriel Petillo', 'Coordenador de Processos',
              'https://avatars0.githubusercontent.com/u/32914162?s=400&u=0bef186cdd234d40c65329a45f69616a82c1763b&v=4'),
          cardGroup('Vitor Rico', 'Design de Robôs',
              'https://avatars2.githubusercontent.com/u/61835701?s=400&u=2b206f28207efe977c6629138b8fd9addd1abc7f&v=4'),
          cardGroup('Matheus Toledo', 'Programador',
              'https://avatars3.githubusercontent.com/u/42592783?s=400&u=c432d451425544a640033304ae5e871a5d0ba446&v=4'),
        ]),
      ),
    );
  }
}

GFCard cardGroup(name, profession, image) {
  return GFCard(
    boxFit: BoxFit.cover,
    titlePosition: GFPosition.start,
    title: GFListTile(
      avatar: GFAvatar(
        backgroundImage: NetworkImage(image),
      ),
      titleText: name,
      subtitleText: profession,
    ),
    buttonBar: GFButtonBar(
      children: <Widget>[
        GFAvatar(
          backgroundColor: GFColors.PRIMARY,
          child: Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
        GFAvatar(
          backgroundColor: GFColors.SECONDARY,
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        GFAvatar(
          backgroundColor: GFColors.SUCCESS,
          child: Icon(
            Icons.phone,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
