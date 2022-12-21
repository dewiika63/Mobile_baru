import 'package:flutter/material.dart';

class EditKebutuhan extends StatefulWidget {
  const EditKebutuhan({Key? key}) : super(key: key);

  @override
  State<EditKebutuhan> createState() => _EditKebutuhanState();
}

class _EditKebutuhanState extends State<EditKebutuhan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Telur"),
      ),
    );
  }
}
