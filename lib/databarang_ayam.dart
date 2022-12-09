import 'package:flutter/material.dart';

class DataBarangAyam extends StatelessWidget {
  const DataBarangAyam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Data Barang Ayam'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[Text('Data barang ayam')],
        ),
      ),
    );
  }
}
