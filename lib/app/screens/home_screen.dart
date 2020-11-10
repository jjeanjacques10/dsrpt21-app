import 'package:dsrpt21_app/app/layout/colors.dart';
import 'package:dsrpt21_app/app/layout/constants.dart';
import 'package:dsrpt21_app/app/stores/production_line_store.dart';
import 'package:dsrpt21_app/app/widgets/listview_production_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductionLineStore productionLineStore = ProductionLineStore();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
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
                  children: [
                    ListTile(
                      title: Text(
                        'Modelos',
                        style: headline2,
                      ),
                    ),
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
                    ListTile(
                        title: Text(
                          'Linhas de Produção',
                          style: headline2,
                        ),
                        trailing: GestureDetector(
                          // When the child is tapped, show a snackbar.
                          onTap: () {
                            Navigator.pushNamed(context, '/list-production');
                          },
                          // The custom button
                          child: Text(
                            'Ver mais',
                            style: subtitle2,
                          ),
                        )),
                    Observer(
                      builder: (ctx) {
                        if (productionLineStore.isLoading) {
                          return CircularProgressIndicator();
                          //return CursoListViewLoading();
                        } else {
                          return SizedBox(
                            height: 300,
                            child: ProductionLineListView(
                                prodLinesModel: productionLineStore.listaCurso),
                          );
                        }
                      },
                    )
                  ],
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
                onPressed: () {
                  Navigator.pushNamed(context, '/list-production');
                }),
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
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
