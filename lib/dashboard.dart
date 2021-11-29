import 'package:flutter/material.dart';
import 'package:flutterdemo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterdemo/dosen/DashboardDosen.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
          child: ListView(
            children: const <Widget> [
              UserAccountsDrawerHeader(
                accountName: Text("Renaldi S."),
                accountEmail: Text("renaldi.soeryadi@si.ukdw.ac.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "RS",
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
              ListTile(
                title: Text("Data Dosen"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu CRUD Dosen"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRouter(builder: (context) =>
                        DashboardDosen(title: "Data Dosen")),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("Data Mahasiswa"),
                    trailing: Icon(Icons.people),
                    subtitle: Text("Menu CRUD Mahasiswa"),
                    onTap: (){
                    Navigator.pop(context);
                    Navigator.push(
                    context,
                    MaterialPageRouter(builder: (context) =>
                    DashboardMhs(title: "Data Mahasiswa")),
                    );
                    },
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