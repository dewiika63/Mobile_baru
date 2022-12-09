import 'package:flutter/material.dart';

class DataBarangKebutuhan extends StatelessWidget {
  const DataBarangKebutuhan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Data Barang Kebutuhann Ayam'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[Text('Data barang kebutuhan ayam')],
        ),
      ),
    );
  }
}
