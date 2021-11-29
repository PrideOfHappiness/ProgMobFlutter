import 'package:flutter/material.dart';
import 'package:flutterdemo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


  class Pertemuan1 extends StatefulWidget {
  const Pertemuan1({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Pertemuan1> createState() => _Pertemuan1State();
}

  class _Pertemuan1State extends State<Pertemuan1> {
    final _formkey = GlobalKey<FormState>();

    @override
    void initState(){
      super.initState();
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
          children: [
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Nama Lengkap",
                  hintText: "Contoh: Renaldi Soeryadi",
                    icon: Icon(Icons.people),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
              ),
                    validator: (value){
                  if (value!.isEmpty){
                    return("Nama tidak boleh kosong!");
                    }
                  return null;
                  },
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                )
              ),
            ),
            RaisedButton(
              focusColor: Colors.blue,
              color: Colors.blueGrey,
              onPressed: () {
                if(_formkey.currentState!.validate()) {}
              },
              child: const Text(
                "Submit",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
             RaisedButton(
              focusColor: Colors.blue,
              color: Colors.blueGrey,
               onPressed: () async{
                 SharedPreferences prefs = await SharedPreferences.getInstance();
                 await prefs.setInt("is_login", 0);
                 Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(
                     builder: (context) => const MyHomePage(title: "Keluar")),
                 );
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
            )
          ],
        ),
      ),
      ),
    );
  }
}