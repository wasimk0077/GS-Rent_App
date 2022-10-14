import 'package:flutter/material.dart';
// import 'dart:html';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import 'dart:io';
import 'dart:math';
import 'package:authh_app/ui/home_view.dart';
import 'package:authh_app/ui/pdf_viewer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:path/path.dart' as Path;
import 'package:authh_app/net/flutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddImages extends StatefulWidget {  
  final String docID;//if you have multiple values add here
AddImages(this.docID, {Key? key}): super(key: key); 
  
  @override  
  _AddImagesState createState() => _AddImagesState();  
}  
  
class _AddImagesState extends State<AddImages > { 

 List<File> _pdf = [];

  Future<firebase_storage.UploadTask?> uploadFile(File file) async {
    // if (file == null) {
    //   Scaffold.of(context);
    //       // .showSnackBar(SnackBar(content: Text("Unable to Upload")));
    //       print("Not uploaded to firebase");
    //   return null;
    // }

    firebase_storage.UploadTask uploadTask;

    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('PDF/${Path.basename(file.path)}');
        

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'file/pdf',
        customMetadata: {'picked-file-path': file.path});
    print("Uploading..!");

    uploadTask = ref.putData(await file.readAsBytes(), metadata);

    print("done..!");
    return Future.value(uploadTask);
  }
  
    List<File> _image = [];
    late DocumentReference imgRef;
  chooseImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile!.path == null) retrieveLostData();
  }
  chooseImage2() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile!.path == null) retrieveLostData();
  }
  Future<void> retrieveLostData() async {
    final LostData response = await ImagePicker().getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }
    late firebase_storage.Reference ref;
  Future uploadImageFile() async {
    int index=1;

    for (var img in _image) {
      // setState(() {
      //   val = i / _image.length;
      // });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.set({'Property_Details':{'imageurl':{"image"+index.toString(): value}}}, SetOptions(merge: true));
          index++;
        });
      });
    }
  } 
   Future uploadImageFile2() async {
    int index=1;

    for (var img in _image) {
      // setState(() {
      //   val = i / _image.length;
      // });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.set({'Tenant_Details':{'imageurl':{"image"+index.toString(): value}}}, SetOptions(merge: true));
          index++;
        });
      });
    }
  } 
  //  bool isResidential=false;
  // funq()async{
  //   var collection = FirebaseFirestore.instance.collection('property_main');
  //   var docSnapshot = await collection.doc(widget.docID).get();
  //   if (docSnapshot.exists) {
  //     Map<String, dynamic> data = docSnapshot.data()!;
  //     isResidential= data['Property_Details']['Property_Types']['Residential'];
  // }
 
   Future uploadPdfFileTenant() async {
    int index=1;

    for (var pdf in _image) {
      // setState(() {
      //   val = i / _image.length;
      // });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(pdf.path)}');
      await ref.putFile(pdf).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.set({'Tenant_Details':{'PDF':{"pdf"+index.toString(): value}}}, SetOptions(merge: true));
          index++;
        });
      });
    }
  } 
  
   Future uploadPdfFileFIrm() async {
    int index=1;

    for (var pdf in _image) {
      // setState(() {
      //   val = i / _image.length;
      // });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(pdf.path)}');
      await ref.putFile(pdf).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.set({'Firm_Details':{'PDF':{"pdf"+index.toString(): value}}}, SetOptions(merge: true));
          index++;
        });
      });
    }
  } 
  
  @override  
  void initState() {
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('property_main').doc(widget.docID);
  }
  Widget build(BuildContext context) {  

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: 50,),
                  ElevatedButton(
                  onPressed: () {
                   chooseImage();
                  },
                  child: Text('ADD PROPERTY PHOTOS')),
                    ElevatedButton(
                  onPressed: () {
                   chooseImage2();
                  },
                  child: Text('ADD TENANT PHOTO')),
                  ElevatedButton(
                            onPressed: () async {
                              final path =
                                  await FlutterDocumentPicker.openDocument();
                              print(path);
                              File file = File(path!);
                              setState(() {
                              _pdf.add(File(file.path));
                              });
                              firebase_storage.UploadTask? task =
                                  await uploadFile(file);
                            },
                            child: Text("ADD TENANT DOCS"),
                            // textColor: Colors.white,
                          ),
                          // Column(
                          //   children:,
                          // ),
                          // COl
                          ElevatedButton(
                            onPressed: () async {
                              final path =
                                  await FlutterDocumentPicker.openDocument();
                              print(path);
                              File file2 = File(path!);
                              setState(() {
                              _pdf.add(File(file2.path));
                              });
                              firebase_storage.UploadTask? task =
                                  await uploadFile(file2);
                            },
                            child: Text("ADD FIRM DOCS"),
                            // textColor: Colors.white,
                          ),
                           
                          
                  ElevatedButton(
                  onPressed: () {

                   uploadImageFile();
                   uploadImageFile2();
                   uploadPdfFileTenant();
                   uploadPdfFileFIrm();
                   
                  },
                  child: Text('upload')),
                  
          ],


        ),
      ),
    );
  }
}