import 'package:dsrpt21_app/app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:splashscreen/splashscreen.dart';

class FlashScreen extends StatefulWidget {
  @override
  FlashScreenState createState() => new FlashScreenState();
}

class FlashScreenState extends State<FlashScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new HomeScreen(),
        image: new Image.asset('assets/logos/logo1.png'),
        backgroundColor: Color.fromRGBO(31, 139, 254, 1),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.white);
  }
}