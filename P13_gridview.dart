import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "GRID & HERO",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarSuperhero = List();
  var karakter=[
    {"nama":"Aquaman", "gambar":"aquaman.jpg"},
    {"nama":"Batman", "gambar":"batman.jpg"},
    {"nama":"Captain", "gambar":"captain.jpg"},
    {"nama":"Catwoman", "gambar":"catwoman.jpg"},
    {"nama":"The Flash", "gambar":"flash.jpg"},
    {"nama":"Hulk", "gambar":"hulk.jpg"},
    {"nama":"Ironman", "gambar":"ironman.jpg"},
    {"nama":"Spiderman", "gambar":"spiderman.jpg"},
    {"nama":"Superman", "gambar":"superman.jpg"},
    {"nama":"Venom", "gambar":"venom.jpg"},
  ];
  _buatList()async{
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya['gambar'];

      daftarSuperhero.add(
        Container(
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Column(
              children: <Widget>[
                Hero(
                  tag: karakternya['nama'],
                  child: Material(
                    child: InkWell(
                      onTap: ()=> Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Detail(nama: karakternya['nama'], gambar: gambar,),
                      )),
                      child: Image.asset("img/$gambar", fit: BoxFit.cover,),
                    ),
                  ),
                ),
                
                Padding(padding: EdgeInsets.all(10.0),),
                Text(karakternya["nama"], style: TextStyle(fontSize: 18.0),)
              ],
            )
          )
        )
      );
    }
  }
  @override
  void initState() {
    _buatList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Super Hero", style: TextStyle(color: Colors.white),),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: daftarSuperhero,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama,this.gambar});
  final String nama;
  final String gambar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Container(
          height: 240.0,
          child: 
          Hero(
            tag: nama,
            child: Material(
              child: InkWell(
                child: Image.asset("img/$gambar", fit: BoxFit.cover,),
              ),
            ),
          ),
        ),

        BagianNama(nama: nama),
        BagianIcon(),
        Keterangan(),
      ],),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    var icon = Icon(Icons.star, size: 30.0, color: Colors.amber);
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(nama, style: TextStyle(fontSize: 20.0, color: Colors.blue),),
                Text(
                  "$nama\@gmail.com", style: TextStyle(fontSize: 17.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              icon,
              Text("21", style: TextStyle(fontSize: 18.0),),
            ],
          ),
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Iconteks(icon: Icons.call, teks: "Call",),
          Iconteks(icon: Icons.message, teks: "Message",),
          Iconteks(icon: Icons.photo, teks: "Photo",),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({this.icon,this.teks});
  final IconData icon;
  final String teks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Column(
        children: <Widget>[
          Icon(icon, size: 50, color: Colors.blue,),
          Text(teks, style: TextStyle(fontSize: 18.0),),
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus at sapien velit. Proin et fermentum elit. Donec tincidunt tellus magna, ac congue ipsum consequat ut. Nulla id justo sit amet metus aliquet vestibulum. Praesent placerat elit leo, sit amet rhoncus dui laoreet nec. Sed sollicitudin mi eu ultrices luctus. Ut ex felis, venenatis sed nibh at, eleifend vehicula magna. Donec consequat dolor nec tellus tristique mollis non sit amet ipsum. Vestibulum imperdiet lorem ac mauris ultrices convallis. Mauris tincidunt velit magna, non maximus libero eleifend eget. Nulla porta velit sit amet turpis viverra cursus. Morbi eu nulla non enim elementum cursus eget in nisi. Cras faucibus nulla ac est suscipit, nec sodales nulla viverra.", 
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
