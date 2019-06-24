import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "idrcorner",
    home: new HalamanSatu(),
  ));
}

class HalamanSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Card & Parsing"),
      ),
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new CardSaya(icon: Icons.home, teks: "Home", warnaIcon: Colors.indigo, warnaTeks: Colors.indigo,),
            new CardSaya(icon: Icons.favorite, teks: "Favorite", warnaIcon: Colors.pink, warnaTeks: Colors.pink,),
            new CardSaya(icon: Icons.place, teks: "Location", warnaIcon: Colors.red, warnaTeks: Colors.red,),
            new CardSaya(icon: Icons.settings, teks: "Setting", warnaIcon: Colors.black, warnaTeks: Colors.black,),
          ],
        ),
      ),
    );
  }
}

class CardSaya extends StatelessWidget {
  CardSaya({this.icon,this.warnaIcon,this.teks,this.warnaTeks});
  
  final IconData icon;
  final Color warnaIcon;
  final String teks;
  final Color warnaTeks;
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Container(
        child: new Card(
            child: new Column(
          children: <Widget>[
            new Icon(icon, size: 50.0, color: warnaIcon,),
            new Text(
              teks,
              style: new TextStyle(fontSize: 20.0, color: warnaTeks,),
            )
          ],
        )),
      ),
    );
  }
}
