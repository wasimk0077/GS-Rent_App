import 'dart:async';

import 'package:authh_app/net/flutterfire.dart';
import 'package:authh_app/ui/ChangePassword.dart';
import 'package:authh_app/ui/Chat.dart';
import 'package:authh_app/ui/Pre_add.dart';
import 'package:authh_app/ui/Property_type_Res.dart';
import 'package:authh_app/ui/Views.dart';
import 'package:authh_app/ui/add_property.dart';
import 'package:authh_app/ui/auth_as_Admin.dart';
import 'package:authh_app/ui/barchart.dart';
import 'package:authh_app/ui/details_view.dart';
import 'package:authh_app/ui/discover_vacant.dart';
import 'package:authh_app/ui/property_types.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Others extends StatefulWidget {
  const Others({Key? key}) : super(key: key);

  @override
  State<Others> createState() => _OthersState();
}

class _OthersState extends State<Others> {
  int n = 0;
  Future check() async {
    final user = FirebaseAuth.instance.currentUser;
    var name;
    int temp = 0;
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(user!.uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      name = data['User_type'];
      print(name);
    }
    if (name == 'Admin') {
      temp = 1;
      n = 1;
    } else
      temp = 0;
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 13,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePass(),
                  ),
                );
              },
              child: Text('Change Password')),
          SizedBox(
            height: MediaQuery.of(context).size.height / 13,
          ),
          Column(
            children: [
              if (n == 1) ...[
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAdminauth(),
                        ),
                      );
                    },
                    child: Text('Add new admin')),
              ] else
                Container(),
            ],
          )
        ],
      ),
    );
  }
}