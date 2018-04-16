import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "News API",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("My App"),
        ),
        body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("This is Simple NEWS APP")
              ],
            ),
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new ListTile(
                title: new Text("Home"),
              ),
              new ListTile(
                title: new Text("Settings"),
              ),

            ],
          ),
        ),
      ),
      theme: new ThemeData(
        primarySwatch: Colors.red
      ),
    );
  }
}