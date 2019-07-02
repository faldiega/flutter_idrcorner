import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "FORM",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> agama=["Islam","Kristen Katolik","Kristen Protestan","Hindu","Budha"];
  String _agama="Islam";
  String _jk="";

  TextEditingController contNama =TextEditingController();
  TextEditingController contPass =TextEditingController();
  TextEditingController contMoto =TextEditingController();

  void _pilihjk(String value){
    setState(() {
     _jk=value; 
    });
  }

  void _pilihagama(String value){
    setState(() {
     _agama=value; 
    });
  }

  void _kirimData(){
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
            Text("Nama Lengkap : ${contNama.text}"),
            Text("Password : ${contPass.text}"),
            Text("Moto Hidup : ${contMoto.text}"),
            Text("Jenis Kelamin : $_jk"),
            Text("Agama : $_agama"),
            RaisedButton(
              child: Text("OK"),
              onPressed: ()=>Navigator.pop(context), //menghilang ketika ditekan
            ),
          ],
        ),
      ),
    );
    showDialog(context: context,child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Text("Formulir"),
        backgroundColor: Colors.teal,       
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 20.0),),
                TextField(
                  controller: contNama,
                  decoration: InputDecoration(
                    hintText: "Nama Lengkap",
                    labelText: "Nama Lengkap",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                
                Padding(padding: EdgeInsets.only(top: 20.0),),
                TextField(
                  controller: contPass,
                  obscureText: true, // sembunyiin text
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                
                Padding(padding: EdgeInsets.only(top: 20.0),),
                TextField(
                  controller: contMoto,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Moto Hidup",
                    labelText: "Moto Hidup",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                
                Padding(padding: EdgeInsets.only(top: 20.0),),
                RadioListTile(
                  value: "Laki-laki",
                  title: Text("Laki-laki"),
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihjk(value);
                  },
                  activeColor: Colors.teal,
                  subtitle: Text("Pilih ini jika anda laki-laki"), //opsional
                ),
                 RadioListTile(
                  value: "Perempuan",
                  title: Text("Perempuan"),
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihjk(value);
                  },
                  activeColor: Colors.teal[400],
                  subtitle: Text("Pilih ini jika anda perempuan"), //opsional
                ),
                
                Padding(padding: EdgeInsets.only(top: 20.0),),
                Row(
                  children: <Widget>[
                    Text("Pilih Agama", style: TextStyle(fontSize: 20.0, color: Colors.teal),),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: DropdownButton(
                        onChanged: (String value){
                          _pilihagama(value);
                        },
                        value: _agama,
                        items: agama.map((String value){
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                  child: Text("SIMPAN", style: TextStyle(color: Colors.white),),
                  color: Colors.teal[400],
                  onPressed: (){_kirimData();},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
