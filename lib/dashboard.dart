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
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardDosen(title: "Dashboard Dosen")),
                    );
                  },
                ),
              Divider(
                color: Colors.black,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                title: Text("Data Mahasiswa"),
                trailing: Icon(Icons.people),
                subtitle: Text("Menu CRUD Mahasiswa"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardMhs(title: "Dashboard Mahasiswa")),
                  );
                },
              ),
              ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.exit_to_app),
                onTap: () async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setInt("is_login", 0);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage(title: "Keluar")),
                  );
                },
                    ),
                  ],
                ),
      )
          ),
        );
      }
    }