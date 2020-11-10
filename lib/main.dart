import 'package:carousel_slider/carousel_slider.dart';
import 'package:dsrpt21_app/app/layout/colors.dart';
import 'package:dsrpt21_app/app/screens/create_production_line.dart';
import 'package:dsrpt21_app/app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.orange,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => HomeScreen(),
        "/create-production": (context) => CreateProductionLine(),
      },
    );
  }
}
