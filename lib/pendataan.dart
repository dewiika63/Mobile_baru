import 'package:coba_login/pendataan_ayam.dart';
import 'package:coba_login/pendataan_kebutuhan.dart';
import 'package:coba_login/pendataan_telur.dart';
import 'package:flutter/material.dart';

class Pendataan extends StatelessWidget {
  const Pendataan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('P E N D A T A A N', style: TextStyle(color: Colors.white),),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PendataanTelur()));
              },
              splashColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/telur.png',
                    height: 150,
                  ),
                  const Text("Pendataan Telur",
                      style: TextStyle(fontSize: 15.0)),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PendataanAyam()));
              },
              splashColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/ayam.png',
                    height: 150,
                  ),
                  const Text("Pendataan Ayam",
                      style: TextStyle(fontSize: 15.0)),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PendataanKebutuhan()));
              },
              splashColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/kebutuhan.png',
                    height: 150,
                  ),
                  const Text("Pendataan Kebutuhan Ayam",
                      style: TextStyle(fontSize: 12.0)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
