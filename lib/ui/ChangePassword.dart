import 'package:authh_app/net/flutterfire.dart';
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
// import 'package:firebase_showcase/pages/home.dart';
import 'package:flutter/material.dart';
// import 'package:firebase/auth/getAuth';

class ChangePass extends StatelessWidget {
  const ChangePass({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController newpass = TextEditingController();

    void fun() async {
      var user = await FirebaseAuth.instance.currentUser;

      //Pass in the password to updatePassword.
      user?.updatePassword(newpass.text).then((_) {
        print("Successfully changed password");
      }).catchError((error) {
        print("Password can't be changed" + error.toString());
        //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      );
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            'Enter the new password',
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              controller: newpass,
              decoration: InputDecoration(
                  hintText: "New password",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "New password",
                  labelStyle: TextStyle(color: Colors.black)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: fun,
            child: Text('Change password'),
          ),
        ],
      ),
    );
  }
}