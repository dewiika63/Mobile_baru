import 'dart:convert';
//import 'dart:ffi';
//import 'package:coba_login/ayam.dart';
import 'package:coba_login/detail_ayam.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'edit_telur.dart';

class DataBarangAyam extends StatefulWidget {
  const DataBarangAyam({Key? key}) : super(key: key);

  @override
  State<DataBarangAyam> createState() => _DataBarangAyamState();
}

class _DataBarangAyamState extends State<DataBarangAyam> {
  List _listayam = [];

  Future _getayam() async {
    try {
      final respone =
          await http.get(Uri.parse("http://127.0.0.1/kub/api/brg_ayam.php"));
      if (respone.statusCode == 200) {
        //  print(respone.body);
        final ayam = jsonDecode(respone.body);
        setState(() {
          _listayam = ayam;
        });
      }
    } catch (e) {
      //  print(e);
    }
  }

  @override
  void initState() {
    _getayam();
    // print(_listayam);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "DATA BARANG AYAM",
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
        body: ListView.builder(
            itemCount: _listayam.length,
            itemBuilder: (context, index) {
              return Container(
                  padding: EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailAyam(
                              index: index,
                              list: _listayam,
                            ))),
                    // child: GestureDetector(
                    //   onTap: () => Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) =>  DetailAyam())),
                    child: Card(
                      color: Colors.amber[50],
                      child: ListTile(
                        leading: Icon(Icons.widgets_outlined),
                        title: Text(
                          "Id Ayam : ${_listayam[index]['id_ayam']}",
                          style: TextStyle(fontSize: 15),
                        ),
                        subtitle:
                            Text("Jumlah : ${_listayam[index]['jumlah_ayam']}"),
                      ),
                    ),
                  ));
            }));
  }
}
