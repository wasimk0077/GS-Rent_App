import 'package:authh_app/net/flutterfire.dart';
import 'package:authh_app/ui/BottomNavbar.dart';
import 'package:authh_app/ui/ChangePassword.dart';
import 'package:authh_app/ui/home_view.dart';
// import 'package:authh_app/ui/tenant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:authh_app/ui/home_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

import 'package:authh_app/net/flutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_auth/local_auth.dart';
// import 'package:firebase_showcase/pages/home.dart';
import 'package:flutter/material.dart';
// import 'package:firebase/auth/getAuth';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final auth = LocalAuthentication();
  String authorized = " not authorized";
  bool _canCheckBiometric = false;
  late List<BiometricType> _availableBiometric;

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: "Scan your finger to authenticate",
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      authorized =
          authenticated ? "Authorized success" : "Failed to authenticate";
      print(authorized);
    });
  }

  Future<void> _checkBiometric() async {
    bool canCheckBiometric = false;

    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future _getAvailableBiometric() async {
    List<BiometricType> availableBiometric = [];

    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  @override
  void initState() {
    _checkBiometric();
    _getAvailableBiometric();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x121212),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // decoration: BoxDecoration(color: Color.fromARGB(255, 5, 72, 108)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ('Login'),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _emailField,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: "something@gmail.com",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Gmail id",
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _passwordField,
                    obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        // hintText: "Password",
                        // hintStyle: TextStyle(
                        //   color: Colors.white,
                        // ),
                        labelText: "Password",
                        labelStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: MediaQuery.of(context).size.height / 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((15.0)),
                      color: Colors.green),
                  child: MaterialButton(
                    onPressed: () async {
                      bool shouldnavigate =
                          await signIn(_emailField.text, _passwordField.text);
                      if (shouldnavigate) {
                        final user = FirebaseAuth.instance.currentUser;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyNavigationBar(),
                          ),
                        );
                        print(user!.email);
                      }
                      else{
                        showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          icon: Icon( // <-- Icon
    Icons.error,
    size: 24.0,
  ),
                                          iconColor: Colors.red,
                                          title: const Text(" Error "),
                                          content: Text(
                                              'The password entered is incorrect.'),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text("OK"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                
     
                                              },
                                            )
                                          ],
                                        ));
                      }
                    },
                    child: FittedBox(
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                //  Container(
                //     margin: const EdgeInsets.symmetric(vertical: 15.0),
                //     width:  MediaQuery.of(context).size.width / 1.4,
                //     child: FloatingActionButton(
                //       onPressed: _authenticate,
                //       elevation: 0.0,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(30.0),
                //       ),
                //       child: const Padding(
                //         padding: EdgeInsets.symmetric(
                //             horizontal: 24.0, vertical: 14.0),
                //         child: Text(
                //           "Authenticate",
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       ),
                //     ),
                //   )
              ],
            ),
          ),
        ));
  }
}