import 'package:dsrpt21_app/app/layout/colors.dart';
import 'package:dsrpt21_app/app/screens/create_production_line_screen.dart';
import 'package:dsrpt21_app/app/screens/home_screen.dart';
import 'package:dsrpt21_app/app/screens/production_line_detail_screen.dart';
import 'package:dsrpt21_app/app/screens/production_line_screen.dart';
import 'package:dsrpt21_app/app/screens/robot_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:
          Color.fromRGBO(31, 139, 254, 1))); // navigation bar color));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.secundary,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => HomeScreen(),
        "/create-production": (context) => CreateProductionLine(),
        "/list-production": (context) => ProductionLineScreen(),
        "/detail-production": (context) => ProductionLineDetailScreen(),
        "/detail-robot": (context) => RobotDetailScreen(),
      },
    );
  }
}
