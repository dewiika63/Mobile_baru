import 'package:flutter/material.dart';

class EditAyam extends StatefulWidget {
  const EditAyam({Key? key}) : super(key: key);

  @override
  State<EditAyam> createState() => _EditAyamState();
}

class _EditAyamState extends State<EditAyam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Telur"),
      ),
    );
  }
}
