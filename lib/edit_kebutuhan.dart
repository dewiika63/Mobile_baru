import 'package:coba_login/databarang_kebutuhan.dart';
import 'package:coba_login/utama.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditKebutuhan extends StatefulWidget {
  final List list;
  final int index;
  EditKebutuhan({required this.list, required this.index});
//  const EditKebutuhan({Key? key}) : super(key: key);

  @override
  State<EditKebutuhan> createState() => _EditKebutuhanState();
}

class _EditKebutuhanState extends State<EditKebutuhan> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController id_kbth;
  late TextEditingController nama_kbth;
  late TextEditingController jumlah_kbth;

  _edit() async {
    final respone = await http
        .post(Uri.parse("http://127.0.0.1/kub/api/edit_kbth_ayam.php"), body: {
      "id_kbth": widget.list[widget.index]['id_kbth'],
      //"id_kbth": id_kbth,
      "nama_kbth": nama_kbth.text,
      "jumlah_kbth": jumlah_kbth.text
    });
    var data = json.decode(respone.body);
    //print(data);
    if (data == "Sukses") {
      return true;
    }
    return false;
  }
  // void editKebutuhan() {
  //   http.post(Uri.parse("http://127.0.0.1/kub/api/edit_kbth_ayam.php"), body: {
  //     "id_kbth": widget.list[widget.index]['id_kbth'],
  //     //"id_kbth": id_kbth,
  //     "nama_kbth": nama_kbth.text,
  //     "jumlah_kbth": jumlah_kbth.text
  //   });
  // }

  @override
  void initState() {
    id_kbth = TextEditingController(text: widget.list[widget.index]['id_kbth']);
    nama_kbth =
        TextEditingController(text: widget.list[widget.index]['nama_kbth']);
    jumlah_kbth =
        TextEditingController(text: widget.list[widget.index]['jumlah_kbth']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Edit Kebutuhan Ayam", style: TextStyle(color: Colors.white)),
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
                    controller: nama_kbth,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nama Kebutuhan Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Masukan Nama Kebutuhan",
                        labelText: "Nama Kebutuhan",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: jumlah_kbth,
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
                      // editKebutuhan();
                      // Navigator.pop(context);
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
                        //   _edit();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => DataBarangKebutuhan()));
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
