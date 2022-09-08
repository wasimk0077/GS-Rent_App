// import 'dart:html';

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

class Addproperty extends StatefulWidget {
  const Addproperty({ Key? key }) : super(key: key);

  @override
  State<Addproperty> createState() => _AddpropertyState();
}

class _AddpropertyState extends State<Addproperty> {
  var imageName;

  TextEditingController _CarpetArea = TextEditingController();
  TextEditingController _PropertyName = TextEditingController();
  TextEditingController _Floor = TextEditingController();
  TextEditingController _Firm = TextEditingController();
  TextEditingController _Tenant = TextEditingController();
  TextEditingController _Rent = TextEditingController();
  TextEditingController _AssetValue = TextEditingController();
  TextEditingController _ImageValue = TextEditingController();
  TextEditingController _Yeild = TextEditingController();
  CollectionReference property_main=FirebaseFirestore.instance.collection("property_main");
  File? selectedImage;
  String _fullName = '';
  String _imageurl = '';
  // int count = 0;
  // void _addImages() {
  //   var storage = FirebaseStorage.instance;
  //   List<String> listOfImage = [
  //     'assets/images/avatar.png',
      
  //   ];
  //   listOfImage.forEach((img) async {
  //     String imageName = img
  //         .substring(img.lastIndexOf("/"), img.lastIndexOf("."))
  //         .replaceAll("/", "");

  //     String path = img.substring(img.indexOf("/") + 1, img.lastIndexOf("/"));

  //     final Directory systemTempDir = Directory.systemTemp;
  //     final byteData = await rootBundle.load(img);
  //     final file = File('${systemTempDir.path}/$imageName.jpeg');
  //     await file.writeAsBytes(byteData.buffer
  //         .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  //     TaskSnapshot taskSnapshot =
  //         await storage.ref('$path/$imageName').putFile(file);
  //     final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  //     await 
  //         property_main.add({"url": downloadUrl, "name": imageName});
  //     count++;
  //     print(count);
  //   });
  //   print('finished.............');
  // }

















  Future getImage() async{
  final _firebaseStorage = FirebaseStorage.instance;
  final  pickedImage=await ImagePicker().getImage(source: ImageSource.gallery);
  selectedImage=File(pickedImage!.path);
  
   if (pickedImage != null){
        //Upload to Firebase
        print('$imageName.png');
        var snapshot = await _firebaseStorage.ref()
        .child('$imageName.png')
        
        .putFile(selectedImage!);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          _imageurl = downloadUrl;
        });
      } else {
        print('No Image Path Received');
      }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  // final ref = FirebaseStorage.instance
  //             .ref().child("");
              
              
              
  //         await ref.putFile(selectedImage!);
          
  //         final url = (await ref.getDownloadURL());
          
  //         _imageurl=url.toString();
  //         print(_imageurl);
          
          
  // setState(() {
  
  // });
  // uploadImage();
  // await Future.delayed(Duration(seconds: 2));
  // speak(message);
  
}

  @override
    TextEditingController _nameController=TextEditingController();
  Widget build(BuildContext context) {
    
    CollectionReference property_main=FirebaseFirestore.instance.collection("property_main");
    
    return Scaffold(
      body: Container(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:30.0),child: new SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            
            // SizedBox(height: 60),
            
            SizedBox(height: 85),
            
            
            Column(


              
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                   
                   Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _PropertyName,
              decoration: InputDecoration(
                  hintText: "Property Name",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Property Name",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),

                
               

              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _CarpetArea,
              decoration: InputDecoration(
                  hintText: "in sq.ft",
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
                  hintText: "Floor",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Floor",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),
             Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _Firm,
              decoration: InputDecoration(
                  hintText: "Name of Company",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Firm Name",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),
            Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _Tenant,
              decoration: InputDecoration(
                  hintText: "Name of Tenant",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Tenant Name",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),
             Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _Rent,
              decoration: InputDecoration(
                  hintText: "in Rs",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Rent Value",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),
             Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _AssetValue,
              decoration: InputDecoration(
                  hintText: "in Rs",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Asset Value",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),
             Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _Yeild,
              decoration: InputDecoration(
                  hintText: "Rate of Yield",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Rate",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),
            
Column(
              
              // mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Container(
                  //  margin: EdgeInsets.only(right: 30),
                  // padding: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/ 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((15.0)),
                      
                      ),
                  child: TextFormField(
                      controller: _ImageValue,
                      decoration: InputDecoration(
                  hintText: "image name",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Image",
                  labelStyle: TextStyle(color: Colors.black)),
                      onChanged:(value){
                        imageName=value;
                        print(imageName);
                      },
                      
                      
                      
                      
                      )
            ),
               ],
             ),
           SizedBox(height:20),
              Row(
              
              mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Container(
                   margin: EdgeInsets.only(right: 30),

                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.height/ 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((15.0)),
                      
                      color: Colors.blueAccent),
                  child: MaterialButton(
                    onPressed: (() => 
                    
                    getImage()),
                    
                    
                    child: Text("ADD A PHOTO"),
                    textColor:Colors.white,
                  ),
            ),
               ],
             ),
             
           SizedBox(height:20),
             Row(
              
              mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Container(
                   margin: EdgeInsets.only(right: 30),

                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.height/ 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((15.0)),
                      
                      color: Colors.blueAccent),
                  child: MaterialButton(
                    onPressed: (() {
                      property_main.add({'Property_Details':{'Carpet_Area':_CarpetArea.text,'Firm':_Firm.text,'Floor':_Floor.text,'Property_name':_PropertyName.text,'Tenant':_Tenant.text,'Yield':_Yeild.text,'imageurl': {'image1':_imageurl.toString(),'image2':_imageurl.toString(),'image3':_imageurl.toString(),'image4':_imageurl.toString()}}}).then((value)=>print("User Added")).catchError((error)=>print("failed to add"));
                      
                      Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                    
                    
                    }
                    
                    ),
                    
                    child: Text("ADD"),
                    textColor:Colors.white,
                  ),
            ),
               ],
             ),
            // SizedBox(height:40),
           
           
            //  SizedBox(height:10),
             
          ],

        ),
      ),










      ),
    ));;
  }
}



 // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //       iconSize: 80,
            //       icon: Icon(Icons.search,color:Colors.black),
            //       onPressed: (){
            //         print("name"+ _nameController.text);
            //       }
            //     ),
             
               

            //   ],
              
            // ),