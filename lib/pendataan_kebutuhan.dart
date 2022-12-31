import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'env.dart';

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
    String url = "${Env.URL_PERFIX}/api/pengeluaran_kebutuhan.php";
    //   var respone = await http
    final respone = await http.post(
      Uri.parse(url),
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
  void initState() {
    tanggal.text = "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengeluaran Kebutuhan Ayam",
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
                    controller: id_kbth,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Id Kebutuhan Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Masukan Id Kebutuhan",
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
                        return "Tanggal Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Masukan Tanggal",
                        labelText: "Tanggal",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                            readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1999),
                        lastDate: DateTime(2050),
                      );
                      if (pickedDate != null) {
                        String formatDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          tanggal.text = formatDate;
                        });
                      } else {}
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: jumlah,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Jumlah Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Masukan Jumlah",
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
                    }
                    // tambahTelur();
                    // Navigator.pop(context, "Simpan");
                    // if (formKey.currentState!.validate()) {
                    //   _simpan().then((value) {
                    //     if (value) {
                    //       final snackBar =
                    //           SnackBar(content: Text("Data Gagal Di Simpan"));
                    //       ScaffoldMessenger.of(context)
                    //           .showSnackBar(snackBar);
                    //     } else {
                    //       final snackBar = SnackBar(
                    //           content: Text("Data Berhasil Di Simpan"));
                    //       ScaffoldMessenger.of(context)
                    //           .showSnackBar(snackBar);
                    //     }
                    //   });
                    // }
                    ,
                    child:
                        Text("Simpan", style: TextStyle(color: Colors.white)),
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
