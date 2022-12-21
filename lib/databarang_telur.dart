import 'dart:convert';
//import 'dart:ffi';
//import 'package:coba_login/ayam.dart';
import 'package:coba_login/detail_telur.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class DataBarangTelur extends StatefulWidget {
  const DataBarangTelur({Key? key}) : super(key: key);

  @override
  State<DataBarangTelur> createState() => _DataBarangTelurState();
}

class _DataBarangTelurState extends State<DataBarangTelur> {
  List _listtelur = [];

  Future _gettelur() async {
    try {
      final respone =
          await http.get(Uri.parse("http://127.0.0.1/kub/api/brg_telur.php"));
      if (respone.statusCode == 200) {
        //  print(respone.body);
        final telur = jsonDecode(respone.body);
        setState(() {
          _listtelur = telur;
        });
      }
    } catch (e) {
      //  print(e);
    }
  }

  @override
  void initState() {
    _gettelur();
    // print(_listtelur);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "DATA BARANG TELUR",
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
        body: _barangAyam(context));
  }

  Widget _barangAyam(BuildContext context) {
    return ListView.builder(
      itemCount: _listtelur.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(5),
          child:GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context)=> DetailTelur(index: index, list: _listtelur, )
                )),
          
            child: Card(
            color: Colors.amber[50],
            child: ListTile(
              leading: Icon(Icons.widgets_outlined),
              title: Text("Gread : ${_listtelur[index]['gread']}"),
              subtitle: Text("Berat : ${_listtelur[index]['berat_telur']}"),
            ),
          ),
        ),
        );
      },
    );
  }
}
