import 'package:flutter/material.dart';

class DataBarangTelur extends StatelessWidget {
  const DataBarangTelur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Data Barang Telur'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[Text('Data barang telur')],
        ),
      ),
    );
  }
}
