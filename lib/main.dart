import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/mine/SecondScreen.dart';
import 'package:flutter_app/mine/ThirdScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/second': (context) {
            return SecondScreen('哈哈哈哈');
          },
          '/third': (context) {
            return ThirdScreen('一线蓝光');
          }
        },
        home: FlowerApp(),);
  }
}

