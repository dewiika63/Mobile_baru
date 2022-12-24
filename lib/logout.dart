// ignore_for_file: deprecated_member_use

import 'package:coba_login/login.dart';
import 'package:flutter/material.dart';
import 'package:coba_login/home.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor: Colors.amber[100],
      title: const Text("Logout"),
      titleTextStyle: const TextStyle(fontSize: 25),
      content: const Text("Apakah anda yakin untuk keluar?"),
      actions: [
        ElevatedButton(
          // color: Colors.orange,
          onPressed: () {
            Navigator.pop(context, 'Tidak');
          },
          //style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.all(Colors.orange),
          //    ),
          child: const Text("Tidak"),
        ),
        ElevatedButton(
          //   color: Colors.orange,
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const Login()));
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: ((context) => Login())),
                (route) => false);
          },
          child: const Text("Iya"),
        ),
      ],
    );
  }
}
