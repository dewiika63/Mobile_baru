import 'package:coba_login/databarang_ayam.dart';
import 'package:coba_login/databarang_kebutuhan.dart';
import 'package:coba_login/databarang_telur.dart';
import 'package:flutter/material.dart';

class DataBarang extends StatelessWidget {
  const DataBarang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('DATA BARANG'),
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
                        builder: (context) => const DataBarangTelur()));
              },
              splashColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/telur.png',
                    height: 150,
                  ),
                  const Text("Data Barang Telur",
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
                        builder: (context) => const DataBarangAyam()));
              },
              splashColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/ayam.png',
                    height: 150,
                  ),
                  const Text("Data Barang Ayam",
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
                        builder: (context) => const DataBarangKebutuhan()));
              },
              splashColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/kebutuhan.png',
                    height: 150,
                  ),
                  const Text("Data Barang Kebutuhan Ayam",
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
