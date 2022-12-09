import 'package:coba_login/home.dart';
import 'package:coba_login/data_barang.dart';
import 'package:coba_login/login.dart';
import 'package:coba_login/logout.dart';
import 'package:coba_login/pendataan.dart';
import 'package:flutter/material.dart';

class Utama extends StatefulWidget {
  const Utama({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UtamaState createState() => _UtamaState();
}

class _UtamaState extends State<Utama> {
  int _bottom = 0;

  final List<Widget> _page = [
    const Home(),
    const Pendataan(),
    const DataBarang(),
    // const Logout()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _bottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KUB App',
      home: Scaffold(
        body: Center(child: _page[_bottom]),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.amber[300],
          currentIndex: _bottom,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.orange[600],
          onTap: _onTabTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home, size: 30,
                  //  color: Colors.black,
                ),
                label: 'Dashboard',
                tooltip: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.note_add_sharp, size: 30,
                  //color: Colors.orange,
                ),
                label: 'Pendataan',
                tooltip: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart, size: 30,
                  //  color: Colors.orange,
                ),
                label: 'Data Barang',
                tooltip: ''),
            //  BottomNavigationBarItem(
            //    icon: Icon(
            //    Icons.close, size: 30,
            //  color: Colors.orange,
            //),
            //label: 'Logout',
            //tooltip: ''),
          ],
        ),
      ),
    );
  }
}
