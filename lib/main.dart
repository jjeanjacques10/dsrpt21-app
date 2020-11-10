import 'package:dsrpt21_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GFBottomSheetController _controller = GFBottomSheetController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSRPT21',
      theme: ThemeData(
        primarySwatch: AppColors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: AppColors.orange,
        drawer: GFDrawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              GFDrawerHeader(
                currentAccountPicture: GFAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('user name'),
                    Text('user@userid.com'),
                  ],
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: null,
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: null,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text('Não japones'),
                  ),
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
                  child: Column(
                    children: [
                      GFCard(
                        boxFit: BoxFit.cover,
                        title: GFListTile(
                          avatar: GFAvatar(
                            backgroundImage: NetworkImage(
                                'https://avatars3.githubusercontent.com/u/32225403?s=400&u=9c1a04035cc7b4e8749679fd87d0732c26a3dcd4&v=4'),
                          ),
                          title: Text('Card Title'),
                          //subtitle: Text('Card Sub Title'),
                        ),
                        content: Text(
                            "Some quick example text to build on the card"),
                        buttonBar: GFButtonBar(
                          children: <Widget>[
                            GFButton(
                              onPressed: () {},
                              text: 'Buy',
                              color: AppColors.orange,
                            ),
                            GFButton(
                              onPressed: () {},
                              text: 'Cancel',
                              color: AppColors.orange,
                            ),
                          ],
                        ),
                      ),
                      GFCard(
                        boxFit: BoxFit.cover,
                        title: GFListTile(
                          avatar: GFAvatar(
                            backgroundImage: NetworkImage(
                                'https://avatars3.githubusercontent.com/u/32225403?s=400&u=9c1a04035cc7b4e8749679fd87d0732c26a3dcd4&v=4'),
                          ),
                          title: Text('Card Title'),
                          //subtitle: Text('Card Sub Title'),
                        ),
                        content: Text(
                            "Some quick example text to build on the card"),
                        buttonBar: GFButtonBar(
                          children: <Widget>[
                            GFButton(
                              onPressed: () {},
                              text: 'Buy',
                              color: AppColors.orange,
                            ),
                            GFButton(
                              onPressed: () {},
                              text: 'Cancel',
                              color: AppColors.orange,
                            ),
                          ],
                        ),
                      ),
                      GFCard(
                        boxFit: BoxFit.cover,
                        title: GFListTile(
                          avatar: GFAvatar(
                            backgroundImage: NetworkImage(
                                'https://avatars3.githubusercontent.com/u/32225403?s=400&u=9c1a04035cc7b4e8749679fd87d0732c26a3dcd4&v=4'),
                          ),
                          title: Text('Card Title'),
                          //subtitle: Text('Card Sub Title'),
                        ),
                        content: Text(
                            "Some quick example text to build on the card"),
                        buttonBar: GFButtonBar(
                          children: <Widget>[
                            GFButton(
                              onPressed: () {},
                              text: 'Buy',
                              color: AppColors.orange,
                            ),
                            GFButton(
                              onPressed: () {},
                              text: 'Cancel',
                              color: AppColors.orange,
                            ),
                          ],
                        ),
                      ),
                      GFCard(
                        boxFit: BoxFit.cover,
                        title: GFListTile(
                          avatar: GFAvatar(
                            backgroundImage: NetworkImage(
                                'https://avatars3.githubusercontent.com/u/32225403?s=400&u=9c1a04035cc7b4e8749679fd87d0732c26a3dcd4&v=4'),
                          ),
                          title: Text('Card Title'),
                          //subtitle: Text('Card Sub Title'),
                        ),
                        content: Text(
                            "Some quick example text to build on the card"),
                        buttonBar: GFButtonBar(
                          children: <Widget>[
                            GFButton(
                              onPressed: () {},
                              text: 'Buy',
                              color: AppColors.orange,
                            ),
                            GFButton(
                              onPressed: () {},
                              text: 'Cancel',
                              color: AppColors.orange,
                            ),
                          ],
                        ),
                      ),
                      GFCard(
                        boxFit: BoxFit.cover,
                        title: GFListTile(
                          avatar: GFAvatar(
                            backgroundImage: NetworkImage(
                                'https://avatars3.githubusercontent.com/u/32225403?s=400&u=9c1a04035cc7b4e8749679fd87d0732c26a3dcd4&v=4'),
                          ),
                          title: Text('Card Title'),
                          //subtitle: Text('Card Sub Title'),
                        ),
                        content: Text(
                            "Some quick example text to build on the card"),
                        buttonBar: GFButtonBar(
                          children: <Widget>[
                            GFButton(
                              onPressed: () {},
                              text: 'Buy',
                              color: AppColors.orange,
                            ),
                            GFButton(
                              onPressed: () {},
                              text: 'Cancel',
                              color: AppColors.orange,
                            ),
                          ],
                        ),
                      ),
                      GFCard(
                        boxFit: BoxFit.cover,
                        title: GFListTile(
                          avatar: GFAvatar(
                            backgroundImage: NetworkImage(
                                'https://avatars3.githubusercontent.com/u/32225403?s=400&u=9c1a04035cc7b4e8749679fd87d0732c26a3dcd4&v=4'),
                          ),
                          title: Text('Card Title'),
                          //subtitle: Text('Card Sub Title'),
                        ),
                        content: Text(
                            "Some quick example text to build on the card"),
                        buttonBar: GFButtonBar(
                          children: <Widget>[
                            GFButton(
                              onPressed: () {},
                              text: 'Buy',
                              color: AppColors.orange,
                            ),
                            GFButton(
                              onPressed: () {},
                              text: 'Cancel',
                              color: AppColors.orange,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomSheet: GFBottomSheet(
          controller: _controller,
          maxContentHeight: 150,
          stickyHeaderHeight: 100,
          stickyHeader: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 0)]),
            child: const GFListTile(
              avatar: GFAvatar(
                backgroundImage: NetworkImage(
                    'https://avatars3.githubusercontent.com/u/32225403?s=400&u=9c1a04035cc7b4e8749679fd87d0732c26a3dcd4&v=4'),
              ),
              titleText: 'GetWidget',
              subtitleText: 'Open source UI library',
            ),
          ),
          contentBody: Container(
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: const [
                Center(
                    child: Text(
                  'Getwidget reduces your overall app development time to minimum 30% because of its pre-build clean UI widget that you can use in flutter app development. We have spent more than 1000+ hours to build this library to make flutter developer’s life easy.',
                  style: TextStyle(
                      fontSize: 15, wordSpacing: 0.3, letterSpacing: 0.2),
                ))
              ],
            ),
          ),
          stickyFooter: Container(
            color: GFColors.SUCCESS,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Get in touch',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'info@getwidget.dev',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
          stickyFooterHeight: 50,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: GFColors.SUCCESS,
            child: _controller.isBottomSheetOpened
                ? Icon(Icons.keyboard_arrow_down)
                : Icon(Icons.keyboard_arrow_up),
            onPressed: () {
              _controller.isBottomSheetOpened
                  ? _controller.hideBottomSheet()
                  : _controller.showBottomSheet();
            }),
      ),
    );
  }
}
