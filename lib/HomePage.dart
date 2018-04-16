import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/NewsCard.dart';

final String API_KEY = "YOUR_KEY";
final String end_point = "https://newsapi.org/v2/";
String apiURL(){
  String url = end_point+"top-headlines?sources=the-hindu&apiKey="+API_KEY;
  return url;
}
class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() {
    return new _HomePageState();
  }
}
class _HomePageState extends State<HomePage> {
  final List<NewsCard> _news = <NewsCard>[];
  var resBody;
  getUserInfo() async {
    var res = await http
        .get(
        Uri.encodeFull(apiURL()),
        headers: {"Accept": "application/json"}
    );
    resBody = json.decode(res.body);
    if(resBody['status'] == 'ok'){
      _news.clear();
      print(resBody['articles']);
      for(var data in resBody['articles']){
        print(data);
        _news.add(new NewsCard(
          title:data['title'],
          author: data['author'],
          description: data['description'],
          name: data['source']['name'],
          url: data['url'],
          urlToImage: data['urlToImage'],
        ));
      }
      setState(() {
        print("Loaded Data");
      });
    }else{
      print("Something Went Wrong");
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("News API App"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
                onPressed: getUserInfo,
                child: new Text("Get data")
            ),
            new Flexible(
                child: new ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _news[index],
                  itemCount: _news.length,
                )
            ),
          ],
        )
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
    );
  }
}