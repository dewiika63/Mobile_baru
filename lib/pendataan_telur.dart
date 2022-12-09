import 'package:flutter/material.dart';

class PendataanTelur extends StatelessWidget {
  const PendataanTelur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Pendataan Telur'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[Text('Data telur yang sudah di panen')],
        ),
      ),
    );
  }
}
