import 'dart:io';
import 'package:authh_app/ui/add_property.dart';
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
import './Add_residential_prop.dart';

class PreAdd extends StatefulWidget {
  const PreAdd({Key? key}) : super(key: key);

  @override
  State<PreAdd> createState() => _PreAddState();
}

class _PreAddState extends State<PreAdd> {
  List<String> items = [
    "Residential",
    "Commercial",
    "MNC",
    "Bank",
    "Warehouse"
  ];
  CollectionReference property_main =
      FirebaseFirestore.instance.collection("property_main");
  String? dropdownvalue = null;
  @override
  TextEditingController _nameController = TextEditingController();
  Widget build(BuildContext context) {
    CollectionReference property_main =
        FirebaseFirestore.instance.collection("property_main");
    // if (dropdownvalue == "Residential") {
    //   //     Navigator.push(
    //   //   context,
    //   //   MaterialPageRoute(
    //   //     builder: (context) => Rent_Details(),
    //   //   ),
    //   // );
    //   print(dropdownvalue);
    // } else if (dropdownvalue == "Bank" ||
    //     dropdownvalue == "Commercial" ||
    //     dropdownvalue == "MNC" ||
    //     dropdownvalue == "Warehouse") {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => Addproperty(),
    //     ),
    //   );
    // }
    print(dropdownvalue);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 40.0,
            ),
            child: Text(
              'Select the type of property',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 320,
            margin: const EdgeInsets.only(
              left: 40.0,
            ),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.blueAccent,
              ),
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                dropdownvalue = newValue!;
                switch (dropdownvalue) {
                  case "Warehouse":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Addproperty(dropdownvalue)),
                          
                    );
                  
                    break;
                  case "Residential":
                  print(dropdownvalue);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResidentialView(dropdownvalue)),
                    );
                    break;
                  case "Bank":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Addproperty(dropdownvalue)),
                    );
                    break;
                  case "MNC":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Addproperty(dropdownvalue)),
                    );
                    break;
                  case "Commercial":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Addproperty(dropdownvalue)),
                    );
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
