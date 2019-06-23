import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "idrcorner Application",
    home: new HalamanSatu(),
  ));
}

class HalamanSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: new AppBar(
        backgroundColor: Colors.blue[900],
        leading: new Icon(Icons.home),
        title: Center(
          child: new Text("Idr Corner")
        ),
        actions: <Widget>[
          new Icon(Icons.search)
        ],
      ),
    );
  }
}
