

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddAgreement extends StatefulWidget {
  // const AddAgreement({Key? key}) : super(key: key);


  @override
  State<AddAgreement> createState() => _AddAgreementState();
}

class _AddAgreementState extends State<AddAgreement> {
  TextEditingController _Tenant_name = TextEditingController();
  TextEditingController _Mobile = TextEditingController();
  TextEditingController _Age = TextEditingController();
  // TextEditingController _ = TextEditingController();
  // TextEditingController _Tenant = TextEditingController();
  @override
  Widget build(BuildContext context) {
     CollectionReference property_main=FirebaseFirestore.instance.collection("property_main");
    
    return Scaffold(
      body: Container(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:30.0),
        child: new SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            
            // SizedBox(height: 60),

            
            SizedBox(height: 85),
            Text(
                            ('Update Details View'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
            
            Column(


              
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                   
                   Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _Tenant_name,
              decoration: InputDecoration(
                  hintText: "Tenant Name",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Tenant Name",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),

                
               

              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _Age,
              decoration: InputDecoration(
                  hintText: "in years",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "in years",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),
            Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _Mobile,
              decoration: InputDecoration(
                  hintText: "10 digits",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "10 digits",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),
            
            
          ]
        ),
        )
        )
      )
    );

    // TODO: implement build
 
  }

}