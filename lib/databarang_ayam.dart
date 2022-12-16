import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataBarangAyam extends StatefulWidget {
  const DataBarangAyam({Key? key}) : super(key: key);

  @override
  State<DataBarangAyam> createState() => _DataBarangAyamState();
}

class _DataBarangAyamState extends State<DataBarangAyam> {
  late List barang;
  Future<String> getbarangayam() async {
    var response = await http
        .post(Uri.http("127.0.0.1", '/kub/api/brg_ayam.php', {'q': '{http}'}));
    setState(() {
      barang = json.decode(response.body);
    });
    return "Success!";
  }

  @override
  // ignore: must_call_super
  void initState() {
    getbarangayam();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[200],
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'Data Barang Ayam',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            hoverColor: Colors.transparent,
            splashRadius: 20,
          ),
        ),
        body: Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          DataTable(columns: [
            DataColumn(label: Text("Id_ayam")),
            DataColumn(label: Text("Jumlah_ayam")),
          ], rows: [
            DataRow(cells: [DataCell(Text("1")), DataCell(Text("20"))])
          ]),
        ]

                // body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                //   FutureBuilder(
                //       future: getbarangayam(),
                //       builder: (context, AsyncSnapshot snapshot) {
                //         if (snapshot.hasData) {
                //           return ListView.builder(
                //               // ignore: unnecessary_null_comparison
                //               itemCount: barang == null ? 0 : barang.length,
                //               //  scrollDirection: Axis.vertical,
                //               itemBuilder: (context, index) {
                //                 return Card(
                //                   clipBehavior: Clip.antiAlias,
                //                   child: Column(
                //                     children: [
                //                       ListTile(
                //                         leading: null,
                //                         title: Text(
                //                           barang[index]["id_ayam"],
                //                           style: const TextStyle(
                //                               color: Colors.deepOrangeAccent,
                //                               fontSize: 20),
                //                         ),
                //                         subtitle: Text(
                //                           barang[index]["jumlah_ayam"],
                //                           style: const TextStyle(
                //                               color: Colors.black, fontSize: 15),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 );
                //               });
                //         } else {
                //           return Center(
                //             child: Container(),
                //           );
                //         }
                //       })
                // ])
                // ListView(children: [
                //   DataTable(columns: [
                //     DataColumn(label: Text("Id_ayam")),
                //     DataColumn(label: Text("Jumlah_ayam")),
                //   ], rows: [
                //     DataRow(cells: [DataCell(Text(barang[index])), DataCell(Text("20"))])
                //   ]),
                //]
                )));
  }
}
