import 'package:flutter/material.dart';

class PendataanAyam extends StatelessWidget {
  const PendataanAyam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Pendataan Ayam'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[Text('Data ayam yang ada di kandang')],
        ),
      ),
    );
  }
}
