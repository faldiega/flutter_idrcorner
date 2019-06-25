import 'package:flutter/material.dart';

class Smartphone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            Padding(padding: new EdgeInsets.all(20.0),),
            new Text("SMARTPHONE", style: new TextStyle(fontSize: 30.0),),
            Padding(padding: new EdgeInsets.all(20.0),),
            new Image(image: new NetworkImage("https://i.dlpng.com/static/png/97044_preview.png"),width: 250.0,),
          ],
        ),
      ),
    );
  }
}