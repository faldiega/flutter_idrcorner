import 'package:flutter/material.dart';

class Radio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            Padding(padding: new EdgeInsets.all(20.0),),
            new Text("RADIO", style: new TextStyle(fontSize: 30.0),),
            Padding(padding: new EdgeInsets.all(20.0),),
            new Image(image: new NetworkImage("http://pngimg.com/uploads/radio/radio_PNG19281.png"),width: 225.0,),
          ],
        ),
      ),
    );
  }
}