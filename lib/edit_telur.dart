import 'package:flutter/material.dart';

class EditTelur extends StatefulWidget {
  const EditTelur({Key? key}) : super(key: key);

  @override
  State<EditTelur> createState() => _EditTelurState();
}

class _EditTelurState extends State<EditTelur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Telur"),
      ),
    );
  }
}
