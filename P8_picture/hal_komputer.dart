import 'package:flutter/material.dart';

class Komputer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            Padding(padding: new EdgeInsets.all(20.0),),
            new Text("KOMPUTER", style: new TextStyle(fontSize: 30.0),),
            Padding(padding: new EdgeInsets.all(20.0),),
            new Image.asset("img/komputer.png", width: 300.0,),
          ],
        ),
      ),
    );
  }
}