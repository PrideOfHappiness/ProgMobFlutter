import 'package:flutter/material.dart';
import 'package:flutterdemo/pertemuan1.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Pertemuan1(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;



  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void navigateLogin() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? isLogin = pref.getInt("is_login");
    if(isLogin == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const Pertemuan1(title: "Hello!")),
      );
    }
  }

  void initState(){
    navigateLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
             RaisedButton(
              child: const Text(
                'Login'
              ),
              onPressed: () async{
                SharedPreferences pref= await SharedPreferences.getInstance();
                await pref.setInt("is_login", 1);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Pertemuan1(title: "Hello!")),
                );
              }
             ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
