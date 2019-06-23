import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new HalamanSatu(),
  ));
}

class HalamanSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: new Container(
          color: Colors.purple[800],
          width: 200.0,
          height: 100.0,
          child: Center(
              // child: new Text(
              //   "Tutorial idr_corner!",
              //   style: new TextStyle(
              //       color: Colors.white, fontFamily: "Serif", fontSize: 20.0),
              // ),
              child: new Icon(Icons.android, color: Colors.green, size: 30.0,)
          ),
        ),
      ),
    );
  }
}
