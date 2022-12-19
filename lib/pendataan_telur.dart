import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class PendataanTelur extends StatefulWidget {
  const PendataanTelur({Key? key}) : super(key: key);

  @override
  State<PendataanTelur> createState() => _PendataanTelurState();
}

class _PendataanTelurState extends State<PendataanTelur> {
  final formKey = GlobalKey<FormState>();
  TextEditingController id_telur = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController berat = TextEditingController();
  _simpan() async {
    final respone = await http
        .post(Uri.parse("http://127.0.0.1/kub/api/brg_ayam.php"), body: {
      "id_telur": id_telur.text,
      "tanggal": tanggal.text,
      "berat": berat.text,
    });
    if (respone.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data Telur"),
      ),
      body: Form(
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
                        return "Masukan Id Telur";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Id Telur",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: tanggal,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Masukan Tanggal";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Tanggal",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: berat,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Masukan Berat";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Berat",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        _simpan().then((value) {
                          if (value) {
                            final snackBar = SnackBar(
                                content: Text("Data Berhasil Di Simpann"));
                          } else {
                            final snackBar = SnackBar(
                                content: Text("Data Gagal Di Simpann"));
                          }
                        });
                      }
                    },
                    child: Text("Simpan"),
                  )
                ],
              ))),
    );
  }
}
