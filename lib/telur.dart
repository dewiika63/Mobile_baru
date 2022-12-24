import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:http/http.dart' as http;

class Telur extends StatefulWidget {
  const Telur({Key? key}) : super(key: key);

  @override
  State<Telur> createState() => _TelurState();
}

class _TelurState extends State<Telur> {
  List<dynamic> data = [];

  void getData() async {
    var respone = await http.get(
      Uri.parse('http://127.0.0.1/kub/api/home_telur.php'),
    );

    setState(() {
      data = jsonDecode(respone.body);
    });
    print(data[2]['penjualan_telur']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Telur',
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
      body: ListView(children: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DigitalClock(
                  digitAnimationStyle: Curves.easeIn,
                  is24HourTimeFormat: true,
                  areaHeight: 40,
                  areaWidth: 100,
                  areaDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent,
                  ),
                  hourMinuteDigitTextStyle:
                      TextStyle(color: Colors.black, fontSize: 20),
                  amPmDigitTextStyle: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 20,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('dd-MM-yyyy').format(DateTime.now()),
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            color: Colors.transparent,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "T E L U R",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ],
            ),
          ),
          const Text("Telur Dipanen"),
          Container(
            margin: const EdgeInsets.all(15),
            height: 50,
            width: 300,
            child: Center(child: Text(data[1]['pendapatan_telur'])),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          const Text("Stok Telur"),
          Container(
            margin: const EdgeInsets.all(15),
            height: 50,
            width: 300,
            child: Center(child: Text(data[0]['stok_telur'])),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          const Text("Telur Terjual"),
          Container(
            margin: const EdgeInsets.all(15),
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(child: Text(data[2]['penjualan_telur'])),
          )
        ])
      ]),
    );
  }
}
