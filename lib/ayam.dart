import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Ayam extends StatefulWidget {
  const Ayam({Key? key}) : super(key: key);

  @override
  State<Ayam> createState() => _AyamState();
}

class _AyamState extends State<Ayam> {
  List<dynamic> data = [];

  void getData() async {
    var respone = await http.get(
      Uri.parse('http://127.0.0.1/kub/api/home_ayam.php'),
    );

    setState(() {
      data = jsonDecode(respone.body);
    });
    // print(data[2]['penjualan_telur']);
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
          'Ayam',
          style: TextStyle(color: Colors.white),
        ),
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
                      const TextStyle(color: Colors.black, fontSize: 20),
                  amPmDigitTextStyle: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          Row(
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
          Container(
            margin: const EdgeInsets.all(15),
            color: Colors.transparent,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "A Y A M",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ],
            ),
          ),
          const Text("Ayam Terjual"),
          Container(
            margin: const EdgeInsets.all(15),
            height: 50,
            width: 300,
            child: Center(child: Text(data[1]['ayam_terjual'])),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          const Text("Ayam Mati"),
          Container(
            margin: const EdgeInsets.all(15),
            height: 50,
            width: 300,
            child: Center(child: Text(data[2]['ayam_mati'])),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          const Text("Ayam Tersedia"),
          Container(
            margin: const EdgeInsets.all(15),
            height: 50,
            width: 300,
            child: Center(child: Text(data[0]['stok_ayam'])),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          )
        ])
      ]),
    );
  }
}
