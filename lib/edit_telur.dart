// ignore_for_file: non_constant_identifier_names

import 'package:coba_login/data_barang.dart';
import 'package:coba_login/databarang_telur.dart';
import 'package:coba_login/utama.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditTelur extends StatefulWidget {
  final List list;
  final int index;
  EditTelur({required this.index, required this.list});

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

  // void editTelur() {
  //   http.post(Uri.parse("http://127.0.0.1/kub/api/edit_telur.php"), body: {
  //     "id_telur": widget.list[widget.index]['id_telur'],
  //     //"id_kbth": id_kbth,
  //     "gread": gread.text,
  //     "berat_telur": berat_telur.text
  //   });
  // }
  _edit() async {
    final respone = await http
        .post(Uri.parse("http://127.0.0.1/kub/api/edit_telur.php"), body: {
      "id_telur": widget.list[widget.index]['id_telur'],
      "gread": gread.text,
      "berat_telur": berat_telur.text,
    });
    var data = json.decode(respone.body);
    //print(data);
    if (data == "Sukses") {
      return true;
    }
    return false;
  }
  // void editTelur() {
  //   //Future _edit() async {
  //   //  var respone = await http
  //   //var url = "http://127.0.0.1/kub/api/edit_telur.php";
  //   //final respone = await http
  //   http.post(Uri.parse("http://127.0.0.1/kub/api/edit_telur.php"), body: {
  //     "id_telur": widget.list[widget.index]['id'],
  //     "gread": gread.text,
  //     "berat_telur": berat_telur.text,
  //   });
  //   // var data = json.decode(respone.body);
  //   // if (data == "Sukses") {
  //   //   return true;
  //   // }
  //   // return false;
  // }

  @override
  Widget build(BuildContext context) {
    // id_telur.text = widget.ListTelut['Id_telur'];
    // gread.text = widget.ListTelut['gread'];
    // berat_telur.text = widget.ListTelut['berat_telur'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data Telur", style: TextStyle(color: Colors.white)),
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
        centerTitle: true,
      ),
      backgroundColor: Colors.amber[200],
      body: ListView(children: <Widget>[
        Form(
          key: formKey,
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: id_telur,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Id Telur Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Masukan Id Telur",
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
                        return "Gread Telur Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Masukan Gread Telur",
                        labelText: "Gread Telur",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: berat_telur,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Berat Telur Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Masukan Berat Telur",
                        labelText: "Berat Telur",
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
                      if (formKey.currentState!.validate()) {
                        _edit().then((value) {
                          if (value) {
                            final snackBar = SnackBar(
                                content: Text("Data Berhasil Di Edit"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            final snackBar =
                                SnackBar(content: Text("Data Gagal Di Edit"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: ((context) => Utama())),
                            (route) => false);
                        // _edit();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => DataBarangTelur()));
                      }
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
