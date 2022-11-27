// import 'dart:html';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:dio/dio.dart';
import 'package:authh_app/ui/Addimage.dart';
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
// import 'package:path_provider_ex/path_provider_ex.dart';
// import 'package:file_picker/file_picker.dart';

class Addproperty extends StatefulWidget {
  final String? dropdownvalue; //if you have multiple values add here
  Addproperty(this.dropdownvalue, {Key? key}) : super(key: key);

  @override
  State<Addproperty> createState() => _AddpropertyState();
}

class _AddpropertyState extends State<Addproperty> {
  late String id;
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
        .child('Files${Path.basename(file.path)}');
        

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'file/pdf',
        customMetadata: {'picked-file-path': file.path});
    print("Uploading..!");

    uploadTask = ref.putData(await file.readAsBytes(), metadata);

    print("done..!");
    return Future.value(uploadTask);
  }
  

  List<String> items = [
    "Residential",
    "Commercial",
    "MNC",
    "Bank",
    "Warehouse"
  ];
  List<String> type = ["Vacant", "Occupied", "Upcoming"];
  TextEditingController _CarpetArea = TextEditingController();

  TextEditingController _PropertyName = TextEditingController();
  TextEditingController _Address = TextEditingController();
  TextEditingController _Floor = TextEditingController();
  TextEditingController _Firm = TextEditingController();
  TextEditingController _Tenant = TextEditingController();
  TextEditingController _Rent = TextEditingController();
  TextEditingController _AssetValue = TextEditingController();
  TextEditingController _KNumber = TextEditingController();
  TextEditingController _ImageValue = TextEditingController();
  TextEditingController _Yeild = TextEditingController();
  TextEditingController _Start_Date = TextEditingController();
  TextEditingController _End_Date = TextEditingController();
  TextEditingController _Rent_Escalation = TextEditingController();
  TextEditingController Security_Deposit = TextEditingController();
  TextEditingController _Tenant_Name = TextEditingController();
  TextEditingController _Tenant_Email = TextEditingController();
  TextEditingController _Tenant_Address = TextEditingController();
  TextEditingController _Tenant_Number = TextEditingController();
  TextEditingController _Firm_Name = TextEditingController();
  TextEditingController _Firm_Docs = TextEditingController();
  TextEditingController _Firm_GST = TextEditingController();
  TextEditingController _Check = TextEditingController();
  var files;

  // void getFiles() async { //asyn function to get list of files
  //     List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
  //     var root = storageInfo[0].rootDir; //storageInfo[1] for SD card, geting the root directory
  //     var fm = FileManager(root: Directory(root)); //
  //     files = await fm.filesTree(
  //       excludedPaths: ["/storage/emulated/0/Android"],
  //       extensions: ["pdf"] //optional, to filter files, list only pdf files
  //     );
  //     setState(() {}); //update the UI
  // }

  Future<String?> uploadPdfToStorage(File pdfFile) async {
    try {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('pdfs/${DateTime.now().millisecondsSinceEpoch}');
      UploadTask uploadTask =
          ref.putFile(pdfFile, SettableMetadata(contentType: 'pdf'));
      String downloadUrl = await (await uploadTask).ref.getDownloadURL();

      final String url = await downloadUrl;

      print("url:$url");
      return url;
    } catch (e) {
      return null;
    }
  }

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result == null) return null;
    return File(result.paths.first ?? '');
  }

//   final mainReference = FirebaseStorage.instance.child('Database');
// Future getPdfAndUpload()async{
//   var rng = new Random();
//   String randomName="";
//   for (var i = 0; i < 20; i++) {
//     print(rng.nextInt(100));
//     randomName += rng.nextInt(100).toString();
//   }
//   File file = await FilePicker.getFile(type: FileType.CUSTOM, fileExtension: 'pdf');
//   String fileName = '${randomName}.pdf';
//   print(fileName);
//   print('${file.readAsBytesSync()}');
//   savePdf(file.readAsBytesSync(), fileName);
// }

// Future savePdf(List<int> asset, String name) async {

//   StorageReference reference = FirebaseStorage.instance.ref().child(name);
//   StorageUploadTask uploadTask = reference.putData(asset);
//   String url = await (await uploadTask.onComplete).ref.getDownloadURL();
//   print(url);
//   documentFileUpload(url);
//   return  url;
// }
// void documentFileUpload(String str) {

//   var data = {
//     "PDF": str,
//   };
//   mainReference.child("Documents").child('pdf').set(data).then((v) {
//   });
// }

  CollectionReference property_main =
      FirebaseFirestore.instance.collection("property_main");
  File? selectedImage;
  File? selectedImage2;
  String _fullName = '';
  String _imageurl = '';
  String _imageurl2 = '';

  // String? dropdownvalue;
  String? dropdownvalue2 = null;

  bool Vacant = false;
  bool Occupied = false;
  bool Upcoming = false;

  var imageName;
  var imagename2;
  bool Residential = false;
  bool Commercial = false;
  bool MNC = false;
  bool Bank = false;
  bool Warehouse = false;

  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
      });
    if (check_date() == false) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text("Date Error"),
                content: Text('Start date should be less than end date'),
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
  }

  bool check_date() {
    int year1 = selectedDate.year;
    int year2 = selectedDate2.year;
    int month1 = selectedDate.month;
    int month2 = selectedDate2.month;
    int day1 = selectedDate.day;
    int day2 = selectedDate2.day;
    if (year1 > year2)
      return false;
    else if (year1 < year2)
      return true;
    else {
      if (month1 > month2)
        return false;
      else if (month1 < month2)
        return true;
      else {
        if (day1 < day2)
          return true;
        else
          return false;
      }
    }
  }

  Future getImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    selectedImage = File(pickedImage!.path);

    if (pickedImage != null) {
      //Upload to Firebase
      print('$imageName.png');
      var snapshot = await _firebaseStorage
          .ref()
          .child('$imageName.png')
          .putFile(selectedImage!);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        _imageurl = downloadUrl;
      });
    } else {
      print('No Image Path Received');
    }
  }

  Future getImage2() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    selectedImage2 = File(pickedImage!.path);

    if (pickedImage != null) {
      //Upload to Firebase
      print('$imagename2.png');
      var snapshot = await _firebaseStorage
          .ref()
          .child('$imagename2.png')
          .putFile(selectedImage2!);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        _imageurl2 = downloadUrl;
      });
    } else {
      print('No Image Path Received');
    }
  }
  // List<File> _image = [];
  // chooseImage() async {
  //   final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image.add(File(pickedFile!.path));
  //   });
  //   if (pickedFile!.path == null) retrieveLostData();
  // }
  // Future<void> retrieveLostData() async {
  //   final LostData response = await ImagePicker().getLostData();
  //   if (response.isEmpty) {
  //     return;
  //   }
  //   if (response.file != null) {
  //     setState(() {
  //       _image.add(File(response.file!.path));
  //     });
  //   } else {
  //     print(response.file);
  //   }
  // }
  //   late firebase_storage.Reference ref;
  // Future uploadImageFile() async {
  //   // int i = 1;

  //   for (var img in _image) {
  //     // setState(() {
  //     //   val = i / _image.length;
  //     // });
  //     ref = firebase_storage.FirebaseStorage.instance
  //         .ref()
  //         .child('images/${Path.basename(img.path)}');
  //     await ref.putFile(img).whenComplete(() async {
  //       await ref.getDownloadURL().then((value) {
  //         imgRef.add({'url': value});
          
  //       });
  //     });
  //   }
  // }

  
 final _Propertyform=GlobalKey<FormState>();
 final _Otherform=GlobalKey<FormState>();
 final _Dropdownform=GlobalKey<FormState>();

  @override
  TextEditingController _nameController = TextEditingController();
  Widget build(BuildContext context) {
    CollectionReference property_main =
        FirebaseFirestore.instance.collection("property_main");
    if (widget.dropdownvalue == "Residential") {
      Residential = true;
    } else if (widget.dropdownvalue == "MNC") {
      MNC = true;
    } else if (widget.dropdownvalue == "Commercial") {
      Commercial = true;
    } else if (widget.dropdownvalue == "Warehouse") {
      Warehouse = true;
    } else if (widget.dropdownvalue == "Bank") {
      Bank = true;
    }

    // if (dropdownvalue2 == "Vacant") {
    //   Vacant = true;
    // } else if (dropdownvalue2 == "Occupied") {
    //   Occupied = true;
    // } else if (dropdownvalue2 == "Upcoming") {
    //   Upcoming = true;
    // }

    return Scaffold(
      backgroundColor: Colors.black,
        body: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        // ignore: unnecessary_new
        child: new SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 60),

              SizedBox(height: 85),
              Text(
                ('Property Details'),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),

              Form(
                key:_Propertyform,child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: TextFormField(
                      validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                      style: TextStyle(color: Colors.white),
                      controller: _PropertyName,
                      decoration: InputDecoration(
                         enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                          hintText: "Property Name",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: "Property Name",
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: TextFormField(
                      validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                      style: TextStyle(color: Colors.white),
                      controller: _Address,
                      decoration: InputDecoration(
                         enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                          hintText: "Address",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: "Address",
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
              
              
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  style: TextStyle(color: Colors.white),
                  controller: _CarpetArea,
                  decoration: InputDecoration(
                     enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: "in sq.ft",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Carpet Area",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  style: TextStyle(color: Colors.white),
                  controller: _Floor,
                  decoration: InputDecoration(
                     enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: "Floor",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Floor",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
              
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  style: TextStyle(color: Colors.white),
                  controller: _Rent,
                  decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: "in Rs",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Rent Value",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  style: TextStyle(color: Colors.white),
                  controller: _AssetValue,
                  decoration: InputDecoration(
                      hintText: "in Rs",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Asset Value",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  style: TextStyle(color: Colors.white),
                  controller: _KNumber,
                  decoration: InputDecoration(
                     enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: "Knumber",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "KNumber",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
            ],),),

            Form(
              key:_Dropdownform,
              child: 
            
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Container(
                  //     //  margin: EdgeInsets.only(right: 30),
                  //     // padding: EdgeInsets.all(10.0),
                  //     width: MediaQuery.of(context).size.width,
                  //     height: MediaQuery.of(context).size.height / 20,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular((15.0)),
                  //     ),
                  //     child: TextFormField(
                  //       controller: _ImageValue,
                  //       decoration: InputDecoration(
                  //           hintText: "image name",
                  //           hintStyle: TextStyle(color: Colors.white),
                  //           labelText: "Image",
                  //           labelStyle: TextStyle(color: Colors.black)),
                  //       onChanged: (value) {
                  //         imageName = value;
                  //         print(imageName);
                  //       },
                  //     )),
                  Container(
                    child: DropdownButtonFormField(
                     validator: (value) {
if (value == null) {
    return 'Relationship is required';
}
},
                     
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF1E1E1E), width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF1E1E1E), width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Color(0xFF1E1E1E),
                      ),
                      value: dropdownvalue2,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: type.map((String items) {
                        return DropdownMenuItem(
                          
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        
                        
                        setState(() {
                          
                          dropdownvalue2 = newValue!;
                          if (dropdownvalue2 == 'Vacant') {
                            Vacant = true;
                            Occupied = false;
                            Upcoming = false;
                          } else if (dropdownvalue2 == 'Occupied') {
                            Vacant = false;
                            Occupied = true;
                            Upcoming = false;
                          } else if (dropdownvalue2 == 'Upcoming') {
                            Vacant = false;
                            Occupied = false;
                            Upcoming = true;
                          }
                          
                        }
                        ) ;
                        
                      },
                    ),
                  )
                ],
              ),),
              Form(
                key:_Otherform, 
                
                child: Column(
                children: [
                  if (dropdownvalue2 == 'Occupied' ||
                      dropdownvalue2 == null) ...[
                    Text(
                      ('Agreement Details'),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width /1.3,
                        child: Row(
                          children: [
                            Text(
                              ('Start Date'),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () => _selectDate(context),
                              icon: Icon(Icons.calendar_month_rounded,color: Colors.white,),
                            ),
                            Text("${selectedDate.toLocal()}".split(' ')[0],
                            style: TextStyle(
                              color: Colors.white
                            )),
                          ],
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Row(
                          children: [
                            Text(
                              ('End Date'),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () => _selectDate2(context),
                              icon: Icon(Icons.calendar_month_rounded,color: Colors.white,),
                            ),
                            Text("${selectedDate2.toLocal()}".split(' ')[0],
                            style: TextStyle(
                              color: Colors.white
                            ),),
                          ],
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                        style: TextStyle(color: Colors.white),
                        controller: _Rent_Escalation,
                        decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                            hintText: "Rent Escalation",
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: "Rent Escalation",
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                        style: TextStyle(color: Colors.white),
                        controller: Security_Deposit,
                        decoration: InputDecoration(
                           enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                            hintText: "Security Deposit",
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: "Security Deposit",
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    // Column(
                    //   // mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Container(
                    //         //  margin: EdgeInsets.only(right: 30),
                    //         // padding: EdgeInsets.all(10.0),
                    //         width: MediaQuery.of(context).size.width,
                    //         height: MediaQuery.of(context).size.height / 20,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular((15.0)),
                    //         ),
                    //         child: TextFormField(
                    //           controller: _ImageValue,
                    //           decoration: InputDecoration(
                    //               hintText: "image name",
                    //               hintStyle: TextStyle(color: Colors.white),
                    //               labelText: "Aadhar Card png",
                    //               labelStyle: TextStyle(color: Colors.black)),
                    //           onChanged: (value) {
                    //             imagename2 = value;
                    //             print(imageName);
                    //           },
                    //         )),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Container(
                    //       margin: EdgeInsets.only(right: 30),
                    //       width: MediaQuery.of(context).size.width / 5,
                    //       height: MediaQuery.of(context).size.height / 20,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular((15.0)),
                    //           color: Colors.blueAccent),
                    //       child: MaterialButton(
                    //         onPressed: (() async {
                    //           String url = '';
                    //           final file = await pickFile();
                    //           if (file == null) return;
                    //         }),
                    //         child: Text("ADD AADHAR CARD PHOTO"),
                    //         textColor: Colors.white,
                    //       ),
                    //     ),
                    //   ],
                    // ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.end,
    //                   children: [
    //                     Container(
    //                       margin: EdgeInsets.only(right: 30),
    //                       width: MediaQuery.of(context).size.width / 5,
    //                       height: MediaQuery.of(context).size.height / 20,
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular((15.0)),
    //                           color: Colors.blueAccent),
    //                       child: MaterialButton(
    //                         onPressed: () async {
    //                           final path =
    //                               await FlutterDocumentPicker.openDocument();
    //                           print(path);
    //                           File file = File(path!);
    //                           setState(() {
    //   _pdf.add(File(file!.path));
    // });
    //                           firebase_storage.UploadTask? task =
    //                               await uploadFile(file);
    //                         },
    //                         child: Text("ADD passport pdf"),
    //                         textColor: Colors.white,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
                    Text(
                      ('Tenant Details'),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                        style: TextStyle(color: Colors.white),
                        controller: _Tenant_Name,
                        decoration: InputDecoration(
                           enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                            hintText: "name",
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: "Tenant Name",
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                        style: TextStyle(color: Colors.white),
                        controller: _Tenant_Email,
                        decoration: InputDecoration(
                           enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                            hintText: "email",
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: "Tenant email",
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                        style: TextStyle(color: Colors.white),
                        controller: _Tenant_Address,
                        decoration: InputDecoration(
                           enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                            hintText: "Addr",
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: "Tenant Address",
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                        style: TextStyle(color: Colors.white),
                        controller: _Tenant_Number,
                        decoration: InputDecoration(
                           enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                            hintText: "No",
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: "Tenant Phone No.",
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Text(
                      ('Firm Details'),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                        style: TextStyle(color: Colors.white),
                        controller: _Firm_Name,
                        decoration: InputDecoration(
                           enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                            hintText: "name",
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: "Firm Name",
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width / 1.3,
                    //   child: TextFormField(
                    //     style: TextStyle(color: Colors.white),
                    //     controller: _Firm_Docs,
                    //     decoration: InputDecoration(
                    //        enabledBorder: UnderlineInputBorder(
                    //     borderSide: BorderSide(color: Colors.white),
                    //   ),
                    //         hintText: "email",
                    //         hintStyle: TextStyle(color: Colors.white),
                    //         labelText: "Docs",
                    //         labelStyle: TextStyle(color: Colors.white)),
                    //   ),
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                        style: TextStyle(color: Colors.white),
                        controller: _Firm_GST,
                        decoration: InputDecoration(
                           enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                            hintText: "GST",
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: "GST",
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ],
              ),),

              SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(
              //       margin: EdgeInsets.only(right: 30),
              //       width: MediaQuery.of(context).size.width / 5,
              //       height: MediaQuery.of(context).size.height / 20,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular((15.0)),
              //           color: Colors.blueAccent),
              //       child: MaterialButton(
              //         onPressed: (() => getImage()),
              //         child: Text("ADD A PHOTO"),
              //         textColor: Colors.white,
              //       ),
              //     ),
              //   ],
              // ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((15.0)),
                        color: Color(0xFF1E1E1E)),
                    child: MaterialButton(
                      onPressed: (() {
                        
                       
                        if(_Propertyform.currentState!.validate() && _Otherform.currentState!.validate()){
                          //  print(Commercial);
                        property_main
                            .add({
                              'Property_Details': {
                                'Carpet_Area': _CarpetArea.text,
                                'Rent': _Rent.text,
                                'Asset': _AssetValue.text,
                                'Address':_Address.text,
                                'KNUMBER':_KNumber.text,
                                // 'Firm': _Firm.text,
                                'Floor': _Floor.text,
                                'Property_name': _PropertyName.text,
                                // 'Tenant': _Tenant.text,
                                // 'Yield': _Yeild.text,
                                'Property_Status': {
                                  'Vacant': Vacant,
                                  'Occupied': Occupied,
                                  'Upcoming': Upcoming
                                },
                                'Property_Types': {
                                  'Residential': Residential,
                                  'Commercial': Commercial,
                                  'MNC': MNC,
                                  'Bank': Bank,
                                  'Warehouse': Warehouse,
                                },
                                
                              },
                              'Agreement_Details': {
                                'Start_Date':
                                    "${selectedDate.toLocal()}".split(' ')[0],
                                'End_date':
                                    "${selectedDate2.toLocal()}".split(' ')[0],
                                'Rent_Escalation': _Rent_Escalation.text,
                                'Security_Deposit': Security_Deposit.text,
                                // 'Aadhar Card': _imageurl2.toString(),
                              },
                              'Tenant_Details': {
                                'Tenant_name': _Tenant_Name.text,
                                'address': _Tenant_Address.text,
                                'email': _Tenant_Email.text,
                                'mobile': _Tenant_Number.text
                              },
                              'Firm_Details': {
                                'Firm_name': _Firm_Name.text,
                                'GST': _Firm_GST.text,
                                // 'Docs': _Firm_Docs.text
                              },
                              'Rent_Details':{
                                DateTime.now().year.toString():
                                {
                                  "1":{
                                    "Paid_on":"",
                                    "Rent_Paid":"0"
                                    ,"status":false
                                  },
                                   "2":{
                                    "Paid_on":"",
                                    "Rent_Paid":"0"
                                    ,"status":false
                                  },
                                   "3":{
                                    "Paid_on":"",
                                    "Rent_Paid":"0"
                                    ,"status":false
                                  },
                                   "4":{
                                    "Paid_on":"",
                                    "Rent_Paid":"0"
                                    ,"status":false
                                  },
                                   "5":{
                                    "Paid_on":"",
                                    "Rent_Paid":"0"
                                    ,"status":false
                                  },
                                   "6":{
                                    "Paid_on":"",
                                    "Rent_Paid":"0"
                                    ,"status":false
                                  },
                                   "7":{
                                    "Paid_on":"",
                                    "Rent_Paid":"0"
                                    ,"status":false
                                  },
                                   "8":{
                                    "Paid_on":"",
                                    "Rent_Paid":"0"
                                    ,"status":false
                                  },
                                   "9":{
                                    "Paid_on":"",
                                    "Rent_Paid":"0"
                                    ,"status":false
                                  },
                                   "10":{
                                    "Paid_on":"",
                                    "Rent_Paid":"0"
                                    ,"status":false
                                  },
                                   "11":{
                                    "Paid_on":"",
                                    "Rent_Paid":"0"
                                    ,"status":false
                                  }
                                  ,
                                   "12":{
                                    "Paid_on":"",
                                    "Rent_Paid":"0"
                                    ,"status":false
                                  }
                                }
                              }
                              ,
                              "imageurl":{
                                "image1":"",
                              }
                            })
                            .then((value) => 
                            
                            ((Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddImages(value.id.toString())
                          ),
                        ))))
                            // print(value.id));
                            .catchError((error) => print("failed to add"));

                        
                        // print(Commercial);
                      
                        }
                       
                      
                       
                       }
                       ),
                      child: Text("ADD"),
                      textColor: Colors.white,
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
    ));
    ;
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

// ),=