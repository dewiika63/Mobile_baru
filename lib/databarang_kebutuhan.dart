import 'dart:convert';
//import 'dart:ffi';
//import 'package:coba_login/ayam.dart';
import 'package:coba_login/detail_kebutuhan.dart';
import 'package:coba_login/edit_telur.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'env.dart';

class DataBarangKebutuhan extends StatefulWidget {
  const DataBarangKebutuhan({Key? key}) : super(key: key);

  @override
  State<DataBarangKebutuhan> createState() => _DataBarangKebutuhanState();
}

class _DataBarangKebutuhanState extends State<DataBarangKebutuhan> {
  List _listkebutuhan = [];

  Future _getkebutuhan() async {
    String url = "${Env.URL_PERFIX}/api/brg_kbth_ayam.php";
    try {
      final respone = await http.post(
      Uri.parse(url));
      if (respone.statusCode == 200) {
        //  print(respone.body);
        final kebutuhan = jsonDecode(respone.body);
        setState(() {
          _listkebutuhan = kebutuhan;
        });
      }
    } catch (e) {
      //  print(e);
    }
  }

  @override
  void initState() {
    _getkebutuhan();
    // print(_listayam);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DATA BARANG KEBUTUHAN AYAM",
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
        itemCount: _listkebutuhan.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5),
            child:GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context)=> DetailKebutuhan(index: index, list: _listkebutuhan, )
                )),
            child: Card(
              color: Colors.amber[50],
              child: ListTile(
                leading: Icon(Icons.widgets_outlined),
                title: Text("Nama : ${_listkebutuhan[index]['nama_kbth']}"),
                subtitle: Text(
                  "Jumlah : ${_listkebutuhan[index]['jumlah_kbth']}",
                  // semanticsLabel:
                  //     "Jumlah : ${_listkebutuhan[index]['jumlah_kbth']}"
                ),
              ),
            ),
            ),
          );
        },
      ),
    );
  }
}
