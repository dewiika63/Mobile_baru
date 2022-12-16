import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class Jadwal extends StatelessWidget {
  const Jadwal({Key? key}) : super(key: key);

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
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "J A D W A L",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const Text("Memberi Pakan"),
              Container(
                margin: const EdgeInsets.all(15),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
              const Text("Mengambil Telur"),
              Container(
                margin: const EdgeInsets.all(15),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
              const Text("Memberi Vaksin"),
              Container(
                margin: const EdgeInsets.all(15),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
