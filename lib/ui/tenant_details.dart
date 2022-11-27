import 'dart:typed_data';

import 'package:authh_app/ui/details_view.dart';
import 'package:authh_app/ui/rent_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'agreement_details.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';

// import 'package:dio/dio.dart';

class TenantDetails extends StatefulWidget {
  // const TenantDetails({Key? key}) : super(key: key);
  final String docID; //if you have multiple values add here
  TenantDetails(this.docID, {Key? key}) : super(key: key);

  @override
  State<TenantDetails> createState() => _TenantDetailsState();
}

class _TenantDetailsState extends State<TenantDetails> {
  var collection = FirebaseFirestore.instance.collection('property_main');

  int _currentIndex = 0;

  final _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.star, color: Colors.blue), label: "1"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.star, color: Colors.green), label: "2"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.star, color: Colors.pink), label: "3"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.star, color: Colors.red), label: "4"),
  ];

  String firm_name = "";
  String GST = "";
  String tenant_name = "";
  String tenant_mobile = "";
  String tenant_address = "";
  String tenant_email = "";
  String tenant_image="";
  bool is_residential = false;
  funq() async {
    var collection = FirebaseFirestore.instance.collection('property_main');
    var docSnapshot = await collection.doc(widget.docID).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      firm_name = data['Firm_Details']['Firm_name'];
      GST = data['Firm_Details']['GST'];
      tenant_name = data['Tenant_Details']['Tenant_name'];
      tenant_address = data['Tenant_Details']['address'];
      tenant_email = data['Tenant_Details']['email'];
      tenant_mobile = data['Tenant_Details']['mobile'];
      is_residential =
          data['Property_Details']['Property_Types']['Residential'];
      tenant_image=data['Tenant_Details']['imageurl']["image1"];
    }
  }
  // _save() async {
  //  var response = await Dio().get(
  //          "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
  //          options: Options(responseType: ResponseType.bytes));
  //  final result = await ImageGallerySaver.saveImage(
  //          Uint8List.fromList(response.data),
  //          quality: 60,
  //          name: "hello");
  //  print(result);
  // }
 
  void initState() {
    // TODO: implement initState
    () async {
      await funq();
      setState(() {
        funq();
      });
    }();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      // appBar:AppBar(
      //   leading:null,
      //   automaticallyImplyLeading: false,

      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      //   actions: <Widget>[
      //     TextButton(
      //       style: style,
      //       onPressed:(){
      //         Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => DetailsView(),
      //       ),
      //     );
      //       },
      //       child: const Text('Basic'),
      //     ),
      //     TextButton(
      //       style: style,
      //       onPressed: (){

      //   },
      //       child: const Text('Tenant'),
      //     ),
      //     TextButton(
      //       style: style,
      //       onPressed: () {
      //          Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => Rent_Details(),
      //       ),
      //     );
      //       },
      //       child: const Text('Rent'),
      //     ),
      //     TextButton(
      //       style: style,
      //       onPressed: () {
      //         Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => AgreementDetails(),
      //       ),
      //     );
      //       },
      //       child: const Text('Agr'),
      //     ),
      //     TextButton(
      //       style: style,
      //       onPressed: () {},
      //       child: const Text('Others'),
      //     ),
      //   ],
      // // title:Text("navbar"),
      // ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 13),
          Container(
            child: Card(
              color: Color(0xFF1E1E1E),
              // shadowColor: Color.fromARGB(255, 180, 38, 236),
              elevation: 8,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Container(
                decoration: BoxDecoration(
                    // color: Color(0xFF221A2C),
                    ),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width/2, //??????????????????????????????????????????????
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 
                          MediaQuery.of(context).size.height*0.03),
                          Text(
                            ('Tenant Details'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height:MediaQuery.of(context).size.height*0.03 ),
                          Text(
                            ('Tenant name: $tenant_name'),
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.03),
                          Text(
                            ('Tenant address: $tenant_address'),
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.03),
                          Text(
                            ('Tenant email: $tenant_email'),
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.03),
                          Text(
                            ('Tenant mobile number: $tenant_mobile'),
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                           SizedBox(height: MediaQuery.of(context).size.height*0.03),
                        ],
                      ),
                    ),
              //       TextButton(
              // onPressed: () {
              //   OpenFile.open("https://firebasestorage.googleapis.com/v0/b/authentiicate.appspot.com/o/images%2Fimage_picker7210789797975572109.jpg?alt=media&token=388ec9af-f92e-4972-8504-5e5a9cb6391c",);
              // },
              // child: Text('Open PDF')),
                    
                    SizedBox(
                      width: MediaQuery.of(context).size.width/2.35,
                      child: Column(
                                      children: [
                                        if (tenant_image==
                                            "")
                                           Container(
                // width: Med,
                // width: MediaQuery.of(context).size.width/5,
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    width: MediaQuery.of(context).size.width/2.2,
                    image: NetworkImage(
                        'https://st4.depositphotos.com/14953852/22772/v/450/depositphotos_227725040-stock-illustration-image-available-icon-flat-vector.jpg'),
                  ),
                ),
              )        
                                        else
                                      Container(
                width: 130,
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage(
                        tenant_image),
                  ),
                ),
              ),     
              //       TextButton(
              // onPressed: () {
              //   // OpenFile.open("https://firebasestorage.googleapis.com/v0/b/authentiicate.appspot.com/o/images%2Fimage_picker7210789797975572109.jpg?alt=media&token=388ec9af-f92e-4972-8504-5e5a9cb6391c",);
              // // GallerySaver.saveImage("https://firebasestorage.googleapis.com/v0/b/authentiicate.appspot.com/o/images%2Fimage_picker7210789797975572109.jpg?alt=media&token=388ec9af-f92e-4972-8504-5e5a9cb6391c");
              // // _save();
              // },
              // child: Text('Open PDF')),
              
                       ],
                                    )
                                    ),
      
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          if (is_residential == false) ...[
            Container(
              child: Card(
                // shadowColor: Color.fromARGB(255, 180, 38, 236),
                color: Color(0xFF1E1E1E),
                elevation: 8,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(18, 134, 156, 178)),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             SizedBox(height: MediaQuery.of(context).size.height*0.03),
                            Text(
                              ('Firm Details'),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.03),
                            Text(
                              ('Firm name: $firm_name'),
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.03),
                            Text(
                              ('GST: $GST'),
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ] else ...[
            Text(
              ('No firm details to display'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xFF1E1E1E),
              ),
            ),
          ]
        ],
      ),
    );
  }
}