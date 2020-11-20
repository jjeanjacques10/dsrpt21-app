import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/getwidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
            height: 10,
          ),
          cardGroup(
              'Jean Jacques Barros',
              'Back-end Developer',
              'https://avatars3.githubusercontent.com/u/32225403?s=400&u=9c1a04035cc7b4e8749679fd87d0732c26a3dcd4&v=4',
              'https://www.linkedin.com/in/jjean-jacques10/',
              'https://github.com/jjeanjacques10',
              'mailto:jjean.jacques10@gmail.com'),
          cardGroup(
              'Vinicius Mota',
              'Production Line Manager',
              'https://avatars2.githubusercontent.com/u/48091834?s=400&u=93e2b5701c31a7c794286f5a1f6eef324c1c091c&v=4',
              'https://www.linkedin.com/in/vinicius-mota-pereira-silva/',
              'https://github.com/ViniciuMota',
              'mailto:vinimota44@gmail.com'),
          cardGroup(
              'Gabriel Petillo',
              'Product Owner',
              'https://media-exp1.licdn.com/dms/image/C4D03AQG0nF7BqQzPKw/profile-displayphoto-shrink_200_200/0/1582063529353?e=1611187200&v=beta&t=fUi69gvL-vfR-lP7sni3w0KWsLo46fCCKKUtW8qxSao',
              'https://www.linkedin.com/in/gabrielpetillo/',
              'https://github.com/gspetillo',
              'mailto:gspetillo@gmail.com'),
          cardGroup(
              'Vitor Rico',
              'Robot Designer',
              'https://avatars2.githubusercontent.com/u/61835701?s=400&u=2b206f28207efe977c6629138b8fd9addd1abc7f&v=4',
              'https://www.linkedin.com/in/rvitoor/',
              'https://github.com/rvitoor/',
              'mailto:vitor.rico@gmail.com'),
          cardGroup(
              'Matheus Toledo',
              'Mobile Developer',
              'https://media-exp1.licdn.com/dms/image/C4D03AQFEV0y0LZXkAw/profile-displayphoto-shrink_200_200/0?e=1611187200&v=beta&t=8Jk1dJGoDuk_GMkTLiPxMY74pkgPMziQ3PwHnMHO8Ts',
              'https://www.linkedin.com/in/matheusdtoledo/',
              'https://github.com/MaToledo07',
              'matheustoledo1710@gmail.com'),
        ]),
      ),
    );
  }
}

GFCard cardGroup(name, profession, image, linkedin, github, email) {
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
      padding: EdgeInsets.only(bottom: 30),
      children: <Widget>[
        GestureDetector(
          onTap: () async {
            if (await canLaunch(linkedin)) {
              await launch(linkedin);
            } else {
              throw 'Could not launch $linkedin';
            }
          },
          child: GFAvatar(
            size: 25,
            backgroundColor: Color.fromRGBO(0, 119, 181, 1),
            child: Icon(
              MdiIcons.linkedin,
              color: Colors.white,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (await canLaunch(github)) {
              await launch(github);
            } else {
              throw 'Could not launch $github';
            }
          },
          child: GFAvatar(
            size: 25,
            backgroundColor: Colors.black,
            child: Icon(
              MdiIcons.github,
              color: Colors.white,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (await canLaunch(email)) {
              await launch(email);
            } else {
              throw 'Could not launch $email';
            }
          },
          child: GFAvatar(
            size: 25,
            backgroundColor: Colors.red,
            child: Icon(
              Icons.email,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
