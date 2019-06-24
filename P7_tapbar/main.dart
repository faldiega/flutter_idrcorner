import 'package:flutter/material.dart';
import './hal_komputer.dart' as pc;
import './hal_headset.dart' as hs;
import './hal_radio.dart' as rdo;
import './hal_smartphone.dart' as hp;

void main() {
  runApp(new MaterialApp(
    title: "Tap Bar",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  TabController controller;
@override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber,
        title: new Text("Daftar Elektronik"),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.computer),text: "Komputer",),
            new Tab(icon: new Icon(Icons.headset),text: "Headset",),
            new Tab(icon: new Icon(Icons.radio),text: "Radio",),
            new Tab(icon: new Icon(Icons.smartphone),text: "Smartphone",),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new pc.Komputer(),
          new hs.Headset(),
          new rdo.Radio(),
          new hp.Smartphone(),
        ],
      ),

      bottomNavigationBar: new Material(
        color: Colors.amber,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.computer),),
            new Tab(icon: new Icon(Icons.headset),),
            new Tab(icon: new Icon(Icons.radio),),
            new Tab(icon: new Icon(Icons.smartphone),),
          ],
        ),
      ),
    );
  }
}
