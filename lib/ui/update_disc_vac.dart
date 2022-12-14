

import 'dart:io';

import 'package:authh_app/ui/details_view.dart';
import 'package:authh_app/ui/discover_vacant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:image_picker/image_picker.dart';

class UpdateDiscoverVacant extends StatefulWidget {
  // const UpdateDetailsViews({Key? key}) : super(key: key);
  final String docID;//if you have multiple values add here
  UpdateDiscoverVacant(this.docID, {Key? key}): super(key: key);

  @override
  State<UpdateDiscoverVacant> createState() => _UpdateDiscoverVacantState();
}

class _UpdateDiscoverVacantState extends State<UpdateDiscoverVacant> {

  List<PropertyTile> Properties=[];
  String Propertyname="";
  String Carpet_Area="";
  String Floor="";
  String Rent="";
  String Asset="";
  bool Residentialcheck=false;

  Future check() async {
    
   
    var collection = FirebaseFirestore.instance.collection('property_main');
    var docSnapshot = await collection.doc(widget.docID).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      Propertyname= data["Property_Details"]['Property_name'];
      Carpet_Area=data["Property_Details"]['Carpet_Area'];
      Floor=data["Property_Details"]['Floor'];
      Rent=data["Property_Details"]["Rent"];
      Asset=data["Property_Details"]["Asset"];
      Residentialcheck=data["Property_Details"]["Property_Types"]["Residential"];
      print(Residentialcheck);

      
    }
   
  }
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
        .child('Files')
        .child('/some-file.pdf');

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
   List<String> type= [
    "Vacant",
    "Occupied",
    "Upcoming"
  ];
  TextEditingController _CarpetArea = TextEditingController();

  TextEditingController _PropertyName = TextEditingController();
  TextEditingController _Floor = TextEditingController();
  TextEditingController _Firm = TextEditingController();
  TextEditingController _Tenant = TextEditingController();
  TextEditingController _Rent = TextEditingController();
  TextEditingController _AssetValue = TextEditingController();
  TextEditingController _ImageValue = TextEditingController();
  TextEditingController _Yeild = TextEditingController();
  TextEditingController _Start_Date = TextEditingController();
  TextEditingController _End_Date = TextEditingController();
  TextEditingController _Rent_Escalation = TextEditingController();
  TextEditingController _Security__Deposit = TextEditingController();
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
      Reference ref = FirebaseStorage.instance.ref().child('pdfs/${DateTime.now().millisecondsSinceEpoch}');
    UploadTask uploadTask = ref.putFile(pdfFile, SettableMetadata(contentType: 'pdf')); 
    String downloadUrl = await (await uploadTask).ref.getDownloadURL();
  


   final String url = await downloadUrl;


  print("url:$url");
  return  url;
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

  String? dropdownvalue = null;
  String? dropdownvalue2 = null;

  bool Vacant=false;
  bool Occupied=false;
  bool Upcoming=false;




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
  void initState()  {
    // TODO: implement initState
    ()async{
      await check();
      setState(() {
      
      check();
    });
    }();
   
    super.initState();
   
  }

  @override
  TextEditingController _nameController = TextEditingController();
  Widget build(BuildContext context) {
    CollectionReference property_main =
        FirebaseFirestore.instance.collection("property_main");
    
    return Scaffold(
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
              
             


              
              Column(
                children: [
                    Text(
                ('Property Details'),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                
                child: Text("Property Name:",style: TextStyle(
                  fontSize: 18
                ),),
              
              ),
              Container(
                
                child: Text(Propertyname,style: TextStyle(
                  fontSize: 18
                ),),
              
              ),
                ],
              ),
              SizedBox(height: 5,),
               Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                
                child: Text("Carpet Area:",style: TextStyle(
                  fontSize: 18
                ),),
              
              ),
              Container(
                
                child: Text(Carpet_Area,style: TextStyle(
                  fontSize: 18
                ),),
              
              ),
                ],
              )

                 ,
                 SizedBox(height: 5,),
               Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                
                child: Text("Floor:",style: TextStyle(
                  fontSize: 18
                ),),
              
              ),
              Container(
                
                child: Text(Floor,style: TextStyle(
                  fontSize: 18
                ),),
              
              ),
                ],
              )

                 ,
                 SizedBox(height: 5,),
               Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                
                child: Text("Rent:",style: TextStyle(
                  fontSize: 18
                ),),
              
              ),
              Container(
                
                child: Text(Rent,style: TextStyle(
                  fontSize: 18
                ),),
              
              ),
                ],
              )

                 ,
                 SizedBox(height: 5,),
               Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                
                child: Text("Asset:",style: TextStyle(
                  fontSize: 18
                ),),
              
              ),
              Container(
                
                child: Text(Asset,style: TextStyle(
                  fontSize: 18
                ),),
              
              ),
                ],
              )

                 ,Text(
                ('Agreement Details'),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Row(
                    children: [
                      Text(
                        ('Start Date'),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _selectDate(context),
                        icon: Icon(Icons.calendar_month_rounded),
                      ),
                      Text("${selectedDate.toLocal()}".split(' ')[0]),
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
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _selectDate2(context),
                        icon: Icon(Icons.calendar_month_rounded),
                      ),
                      Text("${selectedDate2.toLocal()}".split(' ')[0]),
                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Rent_Escalation,
                  decoration: InputDecoration(
                      hintText: "Rent Escalation",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Rent Escalation",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Security__Deposit,
                  decoration: InputDecoration(
                      hintText: "Security Deposit",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Security Deposit",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      //  margin: EdgeInsets.only(right: 30),
                      // padding: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((15.0)),
                      ),
                      child: TextFormField(
                        controller: _ImageValue,
                        decoration: InputDecoration(
                            hintText: "image name",
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: "Aadhar Card png",
                            labelStyle: TextStyle(color: Colors.black)),
                        onChanged: (value) {
                          imagename2 = value;
                          print(imageName);
                        },
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((15.0)),
                        color: Colors.blueAccent),
                    child: MaterialButton(
                      onPressed: (() async{
                          String url = '';
                  final file = await pickFile();
                  if (file == null) return;
                      }),
                      child: Text("ADD AADHAR CARD PHOTO"),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((15.0)),
                        color: Colors.blueAccent),
                    child: MaterialButton(
                      onPressed: () async {
            final path = await FlutterDocumentPicker.openDocument();
            print(path);
            File file = File(path!);
            firebase_storage.UploadTask? task = await uploadFile(file);
          },
                      child: Text("ADD passport pdf"),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),

              Text(
                ('Tenant Details'),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Tenant_Name,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Tenant Name",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Tenant_Email,
                  decoration: InputDecoration(
                      hintText: "email",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Tenant email",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Tenant_Address,
                  decoration: InputDecoration(
                      hintText: "Addr",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Tenant Address",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Tenant_Number,
                  decoration: InputDecoration(
                      hintText: "No",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Tenant Phone No.",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
               
              if(Residentialcheck==false)...[
                
                Text(
                ('Firm Details'),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Firm_Name,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Firm Name",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Firm_Docs,
                  decoration: InputDecoration(
                      hintText: "email",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Docs",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Firm_GST,
                  decoration: InputDecoration(
                      hintText: "Addr",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "GST",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              ]
              
                ],
              ),

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
                        color: Colors.blueAccent),
                    child: MaterialButton(
                      onPressed: (() => getImage()),
                      child: Text("ADD A PHOTO"),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),

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
                        color: Colors.blueAccent),
                    child: MaterialButton(
                      onPressed: (() {
                        
                        final DocUser=property_main.doc(widget.docID);
                      // print(_Tenant_name.text);
                      if(Residentialcheck==false)
                      {
                        DocUser.set
                            ({
                              'Property_Details':{
                                'Property_Status':{
                                  "Occupied":true,
                                  "Vacant":false,
                                  "Upcoming":false,

                                  
                                }
                              },
                              'Agreement_Details': {
                                'Start_Date':
                                    "${selectedDate.toLocal()}".split(' ')[0],
                                'End_date':
                                    "${selectedDate2.toLocal()}".split(' ')[0],
                                'Rent_Escalation': _Rent_Escalation.text,
                                'Security_Deposit': _Security__Deposit.text,
                                'Aadhar Card': _imageurl2.toString(),
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
                                'Docs': _Firm_Docs.text
                              }
                              ,
                            
                              
                            }, SetOptions(merge: true))
                            .then((value) => print("User Added"))
                            .catchError((error) => print("failed to add"));}
                            else{
                              DocUser.update
                            ({
                              
                              'Agreement_Details': {
                                'Start_Date':
                                    "${selectedDate.toLocal()}".split(' ')[0],
                                'End_date':
                                    "${selectedDate2.toLocal()}".split(' ')[0],
                                'Rent_Escalation': _Rent_Escalation.text,
                                'Security_Deposit': _Security__Deposit.text,
                                'Aadhar Card': _imageurl2.toString(),
                              },
                              'Tenant_Details': {
                                'Tenant_name': _Tenant_Name.text,
                                'address': _Tenant_Address.text,
                                'email': _Tenant_Email.text,
                                'mobile': _Tenant_Number.text
                              },
                              
                              
                            },)
                            .then((value) => print("User Added"))
                            .catchError((error) => print("failed to add"));
                            }

                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiscoverVacant(),
                          ),
                        );
                      }),
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


class PropertyTile {
  final String  Propertyname;
  final String  Carpet_Area;
  final String  Floor;
  final String  Rent;
  final String  Asset;
  final bool Residential;

  PropertyTile(@required this.Propertyname,@required this.Carpet_Area ,@required this.Floor,@required this.Rent,@required this.Asset,@required this.Residential);



}