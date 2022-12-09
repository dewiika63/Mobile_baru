import 'package:flutter/material.dart';

class PendataanKebutuhan extends StatelessWidget {
  const PendataanKebutuhan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Pendataan Kebutuhann Ayam'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[Text('Data kebutuhan ayam yang digunaka')],
        ),
      ),
    );
  }
}
