import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(MaterialApp(
    title: "PAGE VIEW",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> gambar=["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg"];
  @override
  Widget build(BuildContext context) {
    timeDilation=2.0;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topRight,
            end: FractionalOffset.bottomLeft,
            colors: [
              Colors.purple,
              Colors.blue,
            ]
          )
        ),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: gambar.length,
          itemBuilder: (BuildContext context, int i){
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 50.0,
              ),
              child: Material(
                borderRadius: BorderRadius.circular(15.0),
                elevation: 20.0,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Hero(
                      tag: gambar[i],
                      child: Material(
                        child: InkWell(
                          onTap: ()=> Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context)=> Halamandua(gambar: gambar[i],),
                          )),
                          child: Image.asset("img/${gambar[i]}", fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Halamandua extends StatefulWidget {
  Halamandua({this.gambar});
  final String gambar;

  @override
  _HalamanduaState createState() => _HalamanduaState();
}

class _HalamanduaState extends State<Halamandua> {
  Color warna=Colors.grey;
  void _pilihannya(Pilihan pilihan){
    setState(() {
     warna=pilihan.warna;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dota Hero"),
        backgroundColor: Colors.grey,
        actions: <Widget>[
          PopupMenuButton<Pilihan>(
            onSelected: _pilihannya,
            itemBuilder: (BuildContext context){
              return listPilihan.map((Pilihan x){
                return PopupMenuItem<Pilihan>(
                  child: Text(x.teks),
                  value: x,
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                colors: [
                  Colors.blue,
                  warna,
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
          Center(
            child: Hero(
              tag: widget.gambar,
              child: ClipOval(
                child: SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: Material(
                    child: InkWell(
                      onTap: ()=> Navigator.of(context).pop(),
                      child: Image.asset("img/${widget.gambar}",fit: BoxFit.cover,),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ), 
    );
  }
}

class Pilihan{
  const Pilihan({this.teks,this.warna});
  final String teks;
  final Color warna;
}

List<Pilihan> listPilihan = const <Pilihan>[
  const Pilihan(teks: "Strength", warna: Colors.red),
  const Pilihan(teks: "Agility", warna: Colors.green),
  const Pilihan(teks: "Intelligence", warna: Colors.blue),
];
