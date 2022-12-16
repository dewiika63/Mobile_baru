import 'package:coba_login/ayam.dart';
import 'package:coba_login/jadwal.dart';
import 'package:coba_login/login.dart';
import 'package:coba_login/logout.dart';
import 'package:coba_login/telur.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // get icon => null;

  //void main() {
  //runApp(MaterialApp(
  //home: Home(),
  //routes: <String, WidgetBuilder>{
  //'Logout': (Buildcontext) => new LogoutDialog(),
  //},
  //));
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'D A S H B O A R D',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              hoverColor: Colors.transparent,
              splashRadius: 20,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return LogoutPage();
                    });
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.amber[200],
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Jadwal()));
              },
              splashColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/jadwal.png',
                    height: 150,
                  ),
                  const Text("Jadwal", style: TextStyle(fontSize: 15.0)),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Telur()));
              },
              splashColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/telur.png',
                    height: 150,
                  ),
                  const Text("Telur", style: TextStyle(fontSize: 15.0)),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Ayam()));
              },
              splashColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/ayam.png',
                    height: 150,
                  ),
                  const Text("Ayam",
                      style: TextStyle(
                        fontSize: 15.0,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
