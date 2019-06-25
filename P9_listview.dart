import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "List View",
    home: new Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red[700],
        title: new Text("List View"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTutorial(gambar:"http://idrcorner.com/images/tutorial/html.jpg", judul: "HTML",),
          new ListTutorial(gambar:"http://idrcorner.com/images/tutorial/css.jpg", judul: "CSS",),
          new ListTutorial(gambar:"http://idrcorner.com/images/tutorial/js.jpg", judul: "Javascript",),
          new ListTutorial(gambar:"http://idrcorner.com/images/tutorial/php.jpg", judul: "PHP",),
          new ListTutorial(gambar:"http://idrcorner.com/images/tutorial/canvas.jpg", judul: "Canvas",),
          new ListTutorial(gambar:"http://idrcorner.com/images/tutorial/boots.jpg", judul: "Bootstrap",),
          new ListTutorial(gambar:"http://idrcorner.com/images/tutorial/ci.jpg", judul: "Code Igniter",),
          new ListTutorial(gambar:"http://idrcorner.com/images/tutorial/game.jpg", judul: "Game",),
          new ListTutorial(gambar:"http://idrcorner.com/images/tutorial/ai.jpg", judul: "Illustrator",),
          new ListTutorial(gambar:"http://idrcorner.com/images/tutorial/flutter1.jpg", judul: "Flutter",),
        ],
      ),
    );
  }
}

class ListTutorial extends StatelessWidget {
  ListTutorial({this.gambar,this.judul});

  final String gambar;
  final String judul;
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Center(
        child: new Row(
          children: <Widget>[
            new Image(image: new NetworkImage(gambar),width:75.0,),

            new Container(
              padding: new EdgeInsets.all(15.0),
              child: new Center(
                child: new Column(
                  children: <Widget>[
                    new Text(judul,style: new TextStyle(fontSize:25.0),),
                    new Text("Ini adalah deskripsi tutorial..", style: new TextStyle(fontSize: 15.0, color: Colors.grey),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )
  }
}
