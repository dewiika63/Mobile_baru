import 'package:coba_login/edit_telur.dart';
import 'package:flutter/material.dart';

class DetailTelur extends StatefulWidget {
  List list;
  int index;
  DetailTelur({required this.index, required this.list});
  @override
  State<DetailTelur> createState() => _DetailTelurState();
}

class _DetailTelurState extends State<DetailTelur> {
  // final List list;
  // int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Telur Gread : ${widget.list[widget.index]['gread']}",
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
                "Id Telur : ${widget.list[widget.index]['id_telur']}",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Gread Telur : ${widget.list[widget.index]['gread']}",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Berat Telur : ${widget.list[widget.index]['berat_telur']}",
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
                              builder: (context) => EditTelur(list: widget.list, index: widget.index)));
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
