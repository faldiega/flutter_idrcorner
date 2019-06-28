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
        title: Center(child: new Text("Idr Corner")),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Icon(Icons.search),
          )
        ],
      ),
      body: new Container(
				child: new Column(
					children: <Widget>[
						new Row(
							children: <Widget>[
								new Icon(Icons.check_circle,size: 50.0,color: Colors.pink,),
							],
						),
					
						new Row(
							children: <Widget>[
								new Icon(Icons.donut_large,size: 50.0,color: Colors.pink,),
								new Icon(Icons.donut_large,size: 50.0,color: Colors.pink,),
							],
						),

						new Row(
							children: <Widget>[
								new Icon(Icons.fast_forward,size: 50.0,color: Colors.pink,),
								new Icon(Icons.fast_forward,size: 50.0,color: Colors.pink,),
								new Icon(Icons.fast_forward,size: 50.0,color: Colors.pink,),
							],
						),
						
					],
				),
			),
    );
  }
}

