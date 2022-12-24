import 'package:coba_login/databarang_ayam.dart';
import 'package:coba_login/utama.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditAyam extends StatefulWidget {
  final List list;
  final int index;
  EditAyam({required this.list, required this.index});

  @override
  State<EditAyam> createState() => _EditAyamState();
}

class _EditAyamState extends State<EditAyam> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController id_ayam;
  late TextEditingController jumlah_ayam;

  @override
  void initState() {
    id_ayam = TextEditingController(text: widget.list[widget.index]['id_ayam']);
    jumlah_ayam =
        TextEditingController(text: widget.list[widget.index]['jumlah_ayam']);
    super.initState();
  }

  _edit() async {
    final respone = await http
        .post(Uri.parse("http://127.0.0.1/kub/api/edit_ayam.php"), body: {
      "id_ayam": widget.list[widget.index]['id_ayam'],
      "jumlah_ayam": jumlah_ayam.text,
    });
    var data = json.decode(respone.body);
    //print(data);
    if (data == "Sukses") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Ayam",
          style: TextStyle(color: Colors.white),
        ),
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
                    controller: id_ayam,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Id Ayam Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Masukan Id Ayam",
                      labelText: "Id Ayam",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: jumlah_ayam,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Jumlah Ayam Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Masukan Jumlah Ayam",
                        labelText: "Jumlah Ayam",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  // Padding(padding: EdgeInsets.all(10)),
                  // TextFormField(
                  //   controller: berat_telur,
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return "Masukan Berat";
                  //     }
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(
                  //       hintText: "Berat",
                  //       labelText: "Berat",
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(15))),
                  // ),
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
                        //         builder: (context) => DataBarangAyam()));
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
