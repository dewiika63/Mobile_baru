import 'dart:convert';

import 'package:coba_login/home.dart';
import 'package:coba_login/utama.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'env.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _secureText = true;
  showhide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  String alert = "Login";
  late String email, password;
  // String email = "Dewi";
  // String password = "123456";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailInput = TextEditingController();
  TextEditingController passowrdInput = TextEditingController();

  // Future login() async {
  //   var response =
  //       await http.post(Uri.parse("http://127.0.0.1/kub/api/login.php"), body: {
  //     "email": email.text,
  //     "password": passowrd.text,
  //   });
  //   var data = json.decode(response.body);
  //   if (data == "Succes") {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Utama()));
  //   } else {
  //     alert = "Email atau password salah";
  //   }
  // }
  void prosesLogin() async {
    String url = "${Env.URL_PERFIX}/api/login.php";
    if (_formKey.currentState!.validate()) {
      final response = await http.post(Uri.parse(url), body: {
        "email": emailInput.text,
        "password": passowrdInput.text,
      });
      var data = json.decode(response.body);
      if (data.length < 1) {
        setState(() {
          alert = "Akun tidak ditemukan, silahkan cek email dan password anda";
          //alert = "Silahkan cek email dan password anda";
        });
      } else {
        setState(() {
          email = data[0]["email"];
          password = data[0]["password"];
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Utama()));
      }
      // if (data == "Sukses") {
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => Utama()));
      // } else {
      //   alert = "email atau Password Salah";
      // }

      // if (emailInput.text == email && passowrdInput.text == password) {
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => Utama()));
      // } else {
      //   setState(() {
      //     alert = "email atau Password Salah";
      //   });
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30),
        //color: Colors.amber[600],
        child: ListView(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.amber[800], shape: BoxShape.circle),
                child: const Center(
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Selamat Datang Di KUB",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(alert),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: emailInput,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Masukan Email Anda";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: 30,
                          ),
                          hintText: "Masukan Email",
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passowrdInput,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Masukan Password Anda";
                        }
                        return null;
                      },
                      obscureText: _secureText,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        prefixIcon: const Icon(
                          Icons.lock,
                          size: 30,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_secureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            showhide();
                          },
                        ),
                        hintText: "Masukan Password",
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        prosesLogin();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                    // Card(
                    //   color: Colors.amber[800],
                    //   elevation: 5,
                    //   child: SizedBox(
                    //     height: 40,
                    //     width: 100,
                    //     child: InkWell(
                    //       splashColor: Colors.white,
                    //       onTap: () => prosesLogin(),
                    //       child: const Center(
                    //           child: Text(
                    //         "Login",
                    //         style: TextStyle(fontSize: 20, color: Colors.white),
                    //       )),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
