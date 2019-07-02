import 'package:flutter/material.dart';
import './detail.dart';

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
    showDialog(context: context, child: alertDialog);
  }

  String gambar1 =
      "https://scontent-sin6-2.xx.fbcdn.net/v/t1.0-9/48429631_2269545759723608_2551193441199456256_n.jpg?_nc_cat=110&_nc_oc=AQmEiJbug-CP2b-DdzasCEQtAcMrAarIiLcKhJvwYGYkKOHlETEC3EUOQBRRe_v5lbo&_nc_ht=scontent-sin6-2.xx&oh=2362756930249998ff6e4012f51f0542&oe=5DB567E4";
  String gambar2 =
      "https://scontent-sin6-2.xx.fbcdn.net/v/t1.0-9/52369230_2252687748115595_5726682734177288192_n.jpg?_nc_cat=103&_nc_oc=AQmnRK-3G7BXIuCcuYhNYIrRg0YFBTvbQWp2UbIK7jLm_kG_n1LJzXEepuZ570Mkk-4&_nc_ht=scontent-sin6-2.xx&oh=6708870c9343b8feae67a9bd9715d054&oe=5D7EC668";
  String tempGambar;

  String nama1 = "Naufaldi Egaputra";
  String email1 = "faldiega@gmail.com";
  String nama2 = "Prastika Risqi Putri";
  String email2 = "prastikaputri98@gmail.com";
  String tempNama;
  String tempEmail;

  void gantiUser() {
    this.setState(() {
      tempGambar = gambar1;
      gambar1 = gambar2;
      gambar2 = tempGambar;

      tempNama = nama1;
      nama1 = nama2;
      nama2 = tempNama;

      tempEmail = email1;
      email1 = email2;
      email2 = tempEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulir"),
        backgroundColor: Colors.teal,       
      ),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(nama1),
              accountEmail: Text(email1),
              currentAccountPicture: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context)=> Detail(nama: nama1, gambar: gambar1),
                  ));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(gambar1),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.bottomLeft,
                  colors: [
                    Colors.teal,
                    Colors.cyan,
                    ],
                ),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                    onTap: () => gantiUser(),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(gambar2),
                    )),
              ],
            ),
            ListTile(
              title: Text("Setting"),
              trailing: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: (){
                Navigator.of(context).pop();
              },
            )
            ],
        ),
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