import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PendataanKebutuhan extends StatefulWidget {
  const PendataanKebutuhan({Key? key}) : super(key: key);

  @override
  State<PendataanKebutuhan> createState() => _PendataanKebutuhanState();
}

class _PendataanKebutuhanState extends State<PendataanKebutuhan> {
  final formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  TextEditingController id_kbth = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController jumlah = TextEditingController();

  //void tambahTelur() {
  _simpan() async {
    //   var respone = await http
    final respone = await http.post(
        Uri.parse("http://127.0.0.1/kub/api/pengeluaran_kebutuhan.php"),
        body: {
          "id_kbth": id_kbth.text,
          "tanggal": tanggal.text,
          "jumlah": jumlah.text,
        });
    var data = json.decode(respone.body);
    if (data == "Sukses") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data Kebutuhan"),
      ),
      body: ListView(children: <Widget>[
        Form(
          key: formKey,
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: id_kbth,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Masukan Id Kebutuhan";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Id Kebutuhan",
                      labelText: "Id Kebutuhan",
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
                        labelText: "Tanggal",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: jumlah,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Masukan Jumlah";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Jumlah",
                        labelText: "Jumlah",
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
                      // tambahTelur();
                      // Navigator.pop(context, "Simpan");
                      if (formKey.currentState!.validate()) {
                        _simpan().then((value) {
                          if (value) {
                            final snackBar =
                                SnackBar(content: Text("Data Gagal Di Simpan"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            final snackBar = SnackBar(
                                content: Text("Data Berhasil Di Simpan"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                      }
                    },
                    child: Text("Simpan"),
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
