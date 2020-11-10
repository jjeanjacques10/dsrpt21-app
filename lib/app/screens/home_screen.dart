import 'package:dsrpt21_app/app/layout/colors.dart';
import 'package:dsrpt21_app/app/layout/constants.dart';
import 'package:dsrpt21_app/app/widgets/card_production.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GFBottomSheetController _controller = GFBottomSheetController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var homeItems = [
      ListTile(
          title: Text(
            'Linhas de Produção',
            style: headline2,
          ),
          trailing: GestureDetector(
            // When the child is tapped, show a snackbar.
            onTap: () {},
            // The custom button
            child: Text(
              'Ver mais',
              style: subtitle2,
            ),
          )),
      carProduction(),
      carProduction(),
      ListTile(
          title: Text(
            'Modelos',
            style: headline2,
          ),
          trailing: GestureDetector(
            // When the child is tapped, show a snackbar.
            onTap: () {},
            // The custom button
            child: Text(
              'Ver mais',
              style: subtitle2,
            ),
          )),
      Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Center(
              child: Image.asset('assets/models/model1.jpg'),
            ),
            SizedBox(
              width: 10,
            ),
            Center(
              child: Image.asset('assets/models/model2.jpg'),
            ),
            SizedBox(
              width: 10,
            ),
            Center(
              child: Image.asset('assets/models/model3.jpg'),
            ),
          ],
        ),
      ),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DSRPT21',
      theme: ThemeData(
        primarySwatch: AppColors.orange,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: AppColors.orange,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Asimov Factory',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    children: homeItems,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColors.orange,
          child: Row(
            children: [
              Spacer(),
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/create-production');
          },
          label: Container(
            width: 70,
            child: Text(
              'Linha de produção',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.ltr,
              maxLines: 2,
            ),
          ),
          icon: Icon(Icons.add),
          foregroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(1, 11, 15, 1),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
