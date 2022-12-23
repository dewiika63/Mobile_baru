// import 'package:flutter/material.dart';

// class PendataanAyam extends StatelessWidget {
//   const PendataanAyam({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber[200],
//       appBar: AppBar(
//         backgroundColor: Colors.orange,
//         title: const Text('Pendataan Ayam', style: TextStyle(color: Colors.white),),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           hoverColor: Colors.transparent,
//           splashRadius: 20,
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[Text('Data ayam yang ada di kandang')],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'env.dart';

class PendataanAyam extends StatefulWidget {
  @override
  _PendataanAyamState createState() => new _PendataanAyamState();
}

class _PendataanAyamState extends State<PendataanAyam> {
  final formKey = GlobalKey<FormState>();
  // TextEditingController controllerid_pengeluaran_ayam =
  //     new TextEditingController();
  TextEditingController id_ayam = new TextEditingController();
  TextEditingController keterangan = new TextEditingController();
  TextEditingController tanggal = new TextEditingController();
  TextEditingController jumlah = new TextEditingController();

  _simpan() async {
    //   var respone = await http
    final respone = await http.post(
        Uri.parse("http://127.0.0.1/kub/api/pengeluaran_ayam.php"),
        body: {
          "id_ayam": id_ayam.text,
          "keterangan": keterangan.text,
          "tanggal": tanggal.text,
          "jumlah": jumlah.text,
        });
    var data = json.decode(respone.body);
    // print(data);
    if (data == "Sukses") {
      return true;
    }
    return false;
  }

  // void PendataanAyam() {
  //   var evn;
  //   http.post(Uri.parse("http://127.0.0.1/kub/api/pengeluaran_ayam.php"),
  //       body: {
  //         "keterangan": keterangan.text,
  //         "tanggal": tanggal.text,
  //         "jumlah": jumlah.text
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            new Text("Pengeluaran Ayam", 
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
                    controller: keterangan,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Keterangan Tidak Boleh Kosong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Masukan Keterangan",
                      labelText: "Keterangan",
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
                    child: Text("Simpan",
                    style: TextStyle(color: Colors.white),),
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
