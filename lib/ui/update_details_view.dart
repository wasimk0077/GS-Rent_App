

import 'package:authh_app/ui/details_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateDetailsViews extends StatefulWidget {
  // const UpdateDetailsViews({Key? key}) : super(key: key);
  final String docID;//if you have multiple values add here
  UpdateDetailsViews(this.docID, {Key? key}): super(key: key);

  @override
  State<UpdateDetailsViews> createState() => _UpdateDetailsViewsState();
}

class _UpdateDetailsViewsState extends State<UpdateDetailsViews> {
  TextEditingController _CarpetArea = TextEditingController();
  TextEditingController _Floor = TextEditingController();
  TextEditingController _Firm = TextEditingController();
  TextEditingController _Tenant= TextEditingController();
 
  

  @override
  Widget build(BuildContext context) {
     CollectionReference property_main=FirebaseFirestore.instance.collection("property_main");
    
    return Scaffold(
      body: Container(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:30.0),child: new SingleChildScrollView(
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
              controller: _CarpetArea,
              decoration: InputDecoration(
                  hintText: "Carpet Area",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Carpet Area",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),

                Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _Floor,
              decoration: InputDecoration(
                  hintText: "in number",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "in number",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),

Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _Firm,
              decoration: InputDecoration(
                  hintText: "Firm name",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Firm name",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),

Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _Tenant,
              decoration: InputDecoration(
                  hintText: "Tenant name",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Tenant name",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),


               

              ],
            ),
            
            MaterialButton(
                    onPressed: (() {
                      final DocUser=property_main.doc(widget.docID);
                      // print(_Tenant_name.text);
                      DocUser.update({
                        'Property_Details.Property_name':_CarpetArea.text.toString(),
                        'Property_Details.Floor':_Floor.text.toString(),
                        'Property_Details.Firm':_Firm.text.toString(),
                        'Property_Details.Tenant':_Tenant.text.toString(),
                        
                      });
                      Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsView(widget.docID),
                      ),
                    );
                    
                    
                    }
                    
                    ),
                    
                    child: Text("update"),
                    textColor:Colors.black,
                  ),
            
            
            
          ]
        ),
        )
        )
      )
    );
    }}