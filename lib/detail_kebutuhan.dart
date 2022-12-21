import 'package:coba_login/edit_kebutuhan.dart';
import 'package:coba_login/edit_telur.dart';
import 'package:flutter/material.dart';

class DetailKebutuhan extends StatefulWidget {
  List list;
  int index;
  DetailKebutuhan({required this.index, required this.list});
  @override
  State<DetailKebutuhan> createState() => _DetailKebutuhanState();
}

class _DetailKebutuhanState extends State<DetailKebutuhan> {
  // final List list;
  // int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.list[widget.index]['nama_kbth']}",
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
      body: Container(
        height: 300,
        padding: EdgeInsets.all(20),
        child: Card(
          color: Colors.amber[50],
          child: Center(
              child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              Text(
                "Id Kebutuhan : ${widget.list[widget.index]['id_kbth']}",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Nama : ${widget.list[widget.index]['nama_kbth']}",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Jumlah : ${widget.list[widget.index]['jumlah_kbth']}",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditKebutuhan()));
                    },
                    child: const Text("EDIT"),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 10),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pop(context, 'HAPUS');
                  //   },
                  //   //style: ButtonStyle(
                  //   // backgroundColor: MaterialStateProperty.all(Colors.orange),
                  //   //    ),
                  //   child: const Text("HAPUS"),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 10),
                  // ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
