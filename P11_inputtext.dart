import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Input, Alert, & Snackbar",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String teks = "";
  TextEditingController controllerInput = TextEditingController();
  TextEditingController controllerAlert = TextEditingController();
  TextEditingController controllerSnackbar = TextEditingController();
  
  void _alertdialog(String str) {
    if (str.isEmpty) return;

    AlertDialog alertDialog = AlertDialog(
      content: Text(
        str,
        style: TextStyle(fontSize: 20.0),
      ),
      actions: <Widget>[
        RaisedButton(
          color: Colors.purple,
          child: Text("OK", style: TextStyle(color:Colors.white)),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(context: context, child: alertDialog);
  }
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  void _snackbar(String str){
    if(str.isEmpty) return;

    _scaffoldState.currentState.showSnackBar(SnackBar(
      content: Text(str, style: TextStyle(fontSize: 20.0)),
      duration: Duration(seconds: 5),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("INPUT TEXT, ALERT DIALOG & SNACKBAR"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField( // Untuk Input
              controller: controllerInput,
              decoration: InputDecoration(hintText: "Tulis disini"), //placeholder
              //onChange = langsung berubah
              //onSubmitted = tekan tombol dulu baru berubah
              onSubmitted: (String str) {
                setState(() {
                  teks = str + '\n' + teks;
                  controllerInput.text = "";
                });
              },
            ),
            Text(teks, style: TextStyle(fontSize: 20.0)),
            TextField( // Untuk Alert
              controller: controllerAlert,
              decoration: InputDecoration(hintText: "Tulis untuk alert.."), //placeholder
              //onChange = langsung berubah
              //onSubmitted = tekan tombol dulu baru berubah
              onSubmitted: (String str) {
                _alertdialog(str);
                controllerAlert.text="";
              },
            ),
            TextField( // Untuk Snackbar
              controller: controllerSnackbar,
              decoration: InputDecoration(hintText: "Tulis untuk Snackbar.."), //placeholder
              //onChange = langsung berubah
              //onSubmitted = tekan tombol dulu baru berubah
              onSubmitted: (String str) {
                _snackbar(str);
                controllerSnackbar.text="";
              },
            ),
          ],
        ),
      )
    );
  }
}
