// ignore_for_file: non_constant_identifier_names

import 'package:coba_login/databarang_telur.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditTelur extends StatefulWidget {
  final List list;
  final int index;
  EditTelur({required this.index, required this.list});
  // const EditTelur({Key? key}) : super(key: key);
  // final Map ListTelut;
  // EditTelur({required this.ListTelut});

  @override
  State<EditTelur> createState() => _EditTelurState();
}

class _EditTelurState extends State<EditTelur> {
  final formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  late TextEditingController id_telur;
  late TextEditingController gread;
  late TextEditingController berat_telur;

  // void editData() {

  // }

  @override
  void initState() {
    id_telur =
        TextEditingController(text: widget.list[widget.index]['id_telur']);
    gread = TextEditingController(text: widget.list[widget.index]['gread']);
    berat_telur =
        TextEditingController(text: widget.list[widget.index]['berat_telur']);
    super.initState();
  }

  void editTelur() {
    //Future _edit() async {
    //  var respone = await http
    //var url = "http://127.0.0.1/kub/api/edit_telur.php";
    //final respone = await http
    http.post(Uri.parse("http://127.0.0.1/kub/api/edit_telur.php"), body: {
      "id_telur": widget.list[widget.index]['id'],
      "gread": gread.text,
      "berat_telur": berat_telur.text,
    });
    // var data = json.decode(respone.body);
    // if (data == "Sukses") {
    //   return true;
    // }
    // return false;
  }

  @override
  Widget build(BuildContext context) {
    // id_telur.text = widget.ListTelut['Id_telur'];
    // gread.text = widget.ListTelut['gread'];
    // berat_telur.text = widget.ListTelut['berat_telur'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data Telur"),
      ),
      body: ListView(children: <Widget>[
        Form(
          //  key: formKey,
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: id_telur,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Masukan Id Telur";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Id Telur",
                      labelText: "Id Telur",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: gread,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Masukan Gread";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Gread",
                        labelText: "Gread",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: berat_telur,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Masukan Berat";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Berat",
                        labelText: "Berat",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      //  _edit();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DataBarangTelur()));
                      // Navigator.pop(context, "Simpan");
                      // if (formKey.currentState!.validate()) {
                      //   _edit().then((value) {
                      //     if (value) {
                      //       final snackBar = SnackBar(
                      //           content: Text("Data Berhasil Di Edit"));
                      //       ScaffoldMessenger.of(context)
                      //           .showSnackBar(snackBar);
                      //     } else {
                      //       final snackBar =
                      //           SnackBar(content: Text("Data Gagal Di Edit"));
                      //       ScaffoldMessenger.of(context)
                      //           .showSnackBar(snackBar);
                      //     }
                      //   });
                      // }
                    },
                    child: Text("Edit"),
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
