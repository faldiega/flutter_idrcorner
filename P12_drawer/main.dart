import 'package:flutter/material.dart';
import './detail.dart';

void main() {
  runApp(MaterialApp(
    title: "Sidebar",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        title: Text("Demo Sidebar (Drawer)"),
        backgroundColor: Colors.purple[600],
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
                    builder: (BuildContext context)=> Detail(nama: nama1, gambar: gambar1)
                  ));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(gambar1),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWcS0F9Iy9Z8Su7zJT_vBHrKmbin2f1wMeZUq5wjs1jsbmsMez"),
                      fit: BoxFit.cover)),
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
            )
          ],
        ),
      ),
      body: Container(),
    );
  }
}
