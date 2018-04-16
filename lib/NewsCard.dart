import 'package:flutter/material.dart';
class NewsCard extends StatelessWidget{
  final String name,urlToImage,url,title, author, description;
  NewsCard({this.name,this.title,this.urlToImage,this.description,this.author,this.url});

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 4.0,
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right:16.0),
                child: new Image.network(urlToImage,width: 80.0,),
              ),
              new Expanded(child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(title,style: TextStyle(fontSize: 20.0),),
                  new Text(description),
                  new Row(
                    children: <Widget>[
                      new Text(name+" : "),
                      new Text(author),
                    ],
                  )
                ],
              ))
            ],
          )
        ),
      );
  }
}