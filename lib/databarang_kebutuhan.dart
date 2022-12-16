import 'package:flutter/material.dart';

class DataBarangKebutuhan extends StatelessWidget {
  const DataBarangKebutuhan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Data Barang Kebutuhann Ayam', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          hoverColor: Colors.transparent,
          splashRadius: 20,
        ),
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
