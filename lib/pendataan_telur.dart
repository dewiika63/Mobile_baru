import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PendataanTelur extends StatefulWidget {
  const PendataanTelur({Key? key}) : super(key: key);

  @override
  State<PendataanTelur> createState() => _PendataanTelurState();
}

class _PendataanTelurState extends State<PendataanTelur> {
  final formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  TextEditingController id_telur = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController berat = TextEditingController();

  //void tambahTelur() {
  _simpan() async {
    //   var respone = await http
    final respone = await http
        .post(Uri.parse("http://127.0.0.1/kub/api/tambah_telur.php"), body: {
      "id_telur": id_telur.text,
      "tanggal": tanggal.text,
      "berat": berat.text,
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
        title: Text("Tambah Data Telur",
        style: TextStyle(color: Colors.white)),
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
                    controller: tanggal,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Tanggal Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Masukan Tanggal",
                        labelText: "Tanggal",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: berat,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Berat Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Masukan Berat",
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
                      // tambahTelur();
                      // Navigator.pop(context, "Simpan");
                      if (formKey.currentState!.validate()) {
                        _simpan().then((value) {
                          if (value) {
                            final snackBar = SnackBar(
                                content: Text("Data Berhasil Di Simpan"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            final snackBar =
                                SnackBar(content: Text("Data Gagal Di Simpan"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                      }
                    },
                    child: Text("Simpan",style: TextStyle(color: Colors.white)),
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
