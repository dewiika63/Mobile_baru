import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'env.dart';

class Jadwal extends StatefulWidget {
  const Jadwal({Key? key}) : super(key: key);

  @override
  State<Jadwal> createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  List<dynamic> data = [];

  void getData() async {
    String url = "${Env.URL_PERFIX}/api/home_jadwal.php";
    var respone = await http.post(
      Uri.parse(url),
    );

    setState(() {
      data = jsonDecode(respone.body);
    });
    print(data[0]['jam']);
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
          'Jadwal',
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
      body: ListView(
        //scrollDirection: Axis.horizontal,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
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
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Memberi Pakan",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text("Pakan Pagi"),
                    Container(
                        margin: const EdgeInsets.all(10),
                        height: 17,
                        width: 115,
                        child: Center(
                          child: Text('Pakan Pagi'),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        )),
                    // Text("Pakan Siang"),
                    Container(
                        margin: const EdgeInsets.all(10),
                        height: 17,
                        width: 115,
                        child: Center(
                          child: Text('Pakan Siang'),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        )),
                    // Text("Pakan Sore"),
                    Container(
                        margin: const EdgeInsets.all(10),
                        height: 17,
                        width: 115,
                        child: Center(
                          child: Text('Pakan Sore'),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        )),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text("Pakan Pagi"),
                    Container(
                        margin: const EdgeInsets.all(10),
                        height: 30,
                        width: 115,
                        child: Center(
                          child: Text(data[0]['jam']),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        )),
                    // Text("Pakan Siang"),
                    Container(
                        margin: const EdgeInsets.all(10),
                        height: 30,
                        width: 115,
                        child: Center(
                          child: Text(data[1]['jam']),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        )),
                    // Text("Pakan Sore"),
                    Container(
                        margin: const EdgeInsets.all(10),
                        height: 30,
                        width: 115,
                        child: Center(
                          child: Text(data[2]['jam']),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
//Mengambil Telur
              Container(
                margin: const EdgeInsets.all(15),
                color: Colors.transparent,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Mengambil Telur",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text("Pakan Pagi"),
                    Container(
                        margin: const EdgeInsets.all(10),
                        height: 17,
                        width: 115,
                        child: Center(
                          child: Text('Ambil Telur Pagi'),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        )),
                    // Text("Pakan Siang"),
                    Container(
                        margin: const EdgeInsets.all(10),
                        height: 17,
                        width: 115,
                        child: Center(
                          child: Text('Ambil Telur Siang'),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        )),
                    // Text("Pakan Sore"),
                    Container(
                        margin: const EdgeInsets.all(10),
                        height: 17,
                        width: 115,
                        child: Center(
                          child: Text('Ambil Telur Sore'),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        )),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text("Pakan Pagi"),
                    Container(
                        margin: const EdgeInsets.all(10),
                        height: 30,
                        width: 115,
                        child: Center(
                          child: Text(data[3]['jam']),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        )),
                    // Text("Pakan Siang"),
                    Container(
                        margin: const EdgeInsets.all(10),
                        height: 30,
                        width: 115,
                        child: Center(
                          child: Text(data[4]['jam']),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        )),
                    // Text("Pakan Sore"),
                    Container(
                        margin: const EdgeInsets.all(10),
                        height: 30,
                        width: 115,
                        child: Center(
                          child: Text(data[5]['jam']),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
//Memberi Vaksin
              Container(
                margin: const EdgeInsets.all(15),
                color: Colors.transparent,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Memberi Vaksin",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text("Pakan Pagi"),
                    Container(
                        margin: const EdgeInsets.all(10),
                        height: 30,
                        width: 115,
                        child: Center(
                          child: Text(data[6]['tanggal']),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
