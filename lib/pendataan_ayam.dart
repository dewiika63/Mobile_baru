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
// import 'env.dart';

class PendataanAyam extends StatefulWidget {
  @override
  _PendataanAyamState createState() => new _PendataanAyamState();
}

class _PendataanAyamState extends State<PendataanAyam> {
  TextEditingController controllerid_pengeluaran_ayam =
      new TextEditingController();
  TextEditingController controllerid_ayam = new TextEditingController();
  TextEditingController controllerketerangan = new TextEditingController();
  TextEditingController controllertanggal = new TextEditingController();
  TextEditingController controllerjumlah = new TextEditingController();

  void PendataanAyam() {
    var evn;
    http.post(Uri.parse("http://127.0.0.1/kub/api/pengeluaran_ayam.php"),
        body: {
          "keterangan": controllerketerangan.text,
          "tanggal": controllertanggal.text,
          "jumlah": controllerjumlah.text
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("TAMBAH DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerketerangan,
                  decoration: new InputDecoration(
                      hintText: "keterangan", labelText: "keterangan"),
                ),
                new TextField(
                  controller: controllertanggal,
                  decoration: new InputDecoration(
                      hintText: "tanggal", labelText: "tanggal"),
                ),
                new TextField(
                  controller: controllerjumlah,
                  decoration: new InputDecoration(
                      hintText: "jumlah", labelText: "jumlah"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    PendataanAyam();
                    Navigator.pop(context, "Simpan");
                    // if (formKey.currentState!.validate()) {
                    //   _simpan().then((value) {
                    //     if (value) {
                    //       final snackBar = SnackBar(
                    //           content: Text("Data Berhasil Di Simpann"));
                    //     } else {
                    //       final snackBar = SnackBar(
                    //           content: Text("Data Gagal Di Simpann"));
                    //     }
                    //   });
                    // }
                  },
                  child: Text("Simpan"),
                ),
                // new RaisedButton(
                //     child: new Text("TAMBAH"),
                //     Color: Colors.orange,
                //     onPressed: () {
                //       PendataanAyam();
                //       Navigator.pop(context);
                //     })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
