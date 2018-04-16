import 'package:flutter/material.dart';
import 'package:news_app/HomePage.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "News API",
      home: new HomePage(),
      theme: new ThemeData(
        primarySwatch: Colors.red
      ),
    );
  }
}