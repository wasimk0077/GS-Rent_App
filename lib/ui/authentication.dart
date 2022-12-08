import 'package:authh_app/net/flutterfire.dart';
import 'package:authh_app/ui/BottomNavbar.dart';
import 'package:authh_app/ui/ChangePassword.dart';
import 'package:authh_app/ui/home_view.dart';
import 'package:authh_app/ui/starting_page.dart';
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
// import 'package:firebase_showcase/pages/home.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
// import 'package:firebase/auth/getAuth';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  


  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  TextEditingController _nameField = TextEditingController();
  TextEditingController _mobileField = TextEditingController();
  List<String> items = ["Employee", "Admin"];
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
     return  WillPopScope(
        onWillPop: null, child: Scaffold(
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
                  ('Register'),
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
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _nameField,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      // hintText: "something@gmail.com",
                      // hintStyle: TextStyle(color: Colors.white),
                      labelText: "User name",
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
                    controller: _mobileField,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      // hintText: "something@gmail.com",
                      // hintStyle: TextStyle(color: Colors.white),
                      labelText: "Mobile number",
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.8,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text('Already registered?')),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((15.0)),
                      color: Colors.green),
                  child: MaterialButton(
                    onPressed: () async {
                      bool shouldnavigate =
                          await register(_emailField.text, _passwordField.text);
                      if (shouldnavigate) {
                        {
                          final user = FirebaseAuth.instance.currentUser;
                          var collection =
                              FirebaseFirestore.instance.collection('users');
                          collection.doc(user!.uid) // <-- Document ID
                              .set({
                            'User_email': _emailField.text,
                            'User_password': _passwordField.text,
                            'User_type': 'Employee',
                            'User_name': _nameField.text,
                            'User_mobile': _mobileField.text,
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyNavigationBar(),
                            ),
                          );
                        }
                      }
                    },
                    child: Text(
                      "Register",
                      style: new TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    textColor: Colors.white,
                  ),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height / 35),
                // Container(
                //   width: MediaQuery.of(context).size.width / 1.4,
                //   height: 45,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular((15.0)),
                //       color: Colors.green),
                //   child: MaterialButton(
                //     onPressed: () async {
                //       bool shouldnavigate =
                //           await signIn(_emailField.text, _passwordField.text);
                //       if (shouldnavigate) {
                //         final user = FirebaseAuth.instance.currentUser;
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => LoginPage(),
                //           ),
                //         );
                //         print(user!.email);
                //       }
                //     },
                //     child: Text(
                //       "Login",
                //       style: new TextStyle(
                //         fontSize: 15.0,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 40,
                // ),
              ],
            ),
          ),
        )
        ));
  }
}