import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:authh_app/ui/add_property.dart';
import 'package:authh_app/ui/agreement_details.dart';
import 'package:authh_app/ui/home_view.dart';
import 'package:authh_app/ui/location.dart';
import 'package:authh_app/ui/rent_details.dart';
import 'package:authh_app/ui/single_city.dart';
// import 'package:authh_app/ui/tenant.dart';
import 'package:authh_app/ui/tenant_details.dart';
import 'package:authh_app/ui/update_details_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:universal_html/html.dart';

class DetailsView extends StatefulWidget {
  // const DetailsView({ Key? key }) : super(key: key);
  final String docID; //if you have multiple values add here
  DetailsView(this.docID, {Key? key}) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final List<Map<String, dynamic>> clityList = [
    // {"address":Address,"image":"https://cdn.britannica.com/25/143425-050-A26CDA50/apartment-building-Calgary-Alberta.jpg","lat":locations[0],"lng":locations[1]}
  ];
  getDetails(String Latitude, String Longitude, String Address, String Name,
      BuildContext context) {
    // print(singleCityData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SingleCity(
            Latitude: Latitude,
            Longitude: Longitude,
            Address: Address,
            Name: Name),
      ),
    );
  }

  getLocation() async {
    List<Location> locations = await locationFromAddress(Address);
    print(locations);
    Location loc = locations[0];

    // List location = getLocation();
    // Latitude=locations;
    Latitude = loc.latitude.toString();
    Longitude = loc.longitude.toString();
    print("ggggggggggggggggggggggggg");
    print(Latitude);
    print(Longitude);
    print("ggggggggggggggggggggggggg");
  }

  String Name = "";
  String Address = "";
  String Latitude = "";
  String Longitude = "";
  String image="";
  CollectionReference property_main =
      FirebaseFirestore.instance.collection("property_main");
  funq() async {
    int index = 1;
    var collection = FirebaseFirestore.instance.collection('property_main');
    var docSnapshot = await collection.doc(widget.docID).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      if(data['Property_Details']["imageurl"]["image1"]!="")
      {
imageList.add(data['Property_Details']["imageurl"]["image1"]);
      }
//       if(data['Property_Details']["imageurl"]['image2']!="")
//       {
// imageList.add(data['Property_Details']["imageurl"]["image2"]);
//       }
//       // 
      // imageList.add(data['Property_Details']["image1"]);
      // image=data['Property_Details']['imageurl']["image1"];
      print(image);
     

      Address = data['Property_Details']['Address'];
      Name = data['Property_Details']['Property_name'];
    }
  }

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
      // Address=data['Property_Details']['Address'];
      print(name);
    }
    if (name == 'Admin') {
      temp = 1;
      n = 1;
    } else
      temp = 0;
    return temp;
  }

  var collection = FirebaseFirestore.instance.collection('property_main');
  // @override

  final List<String> imageList = [];
  final List<String> NoimageList=["https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930"];
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

  void initState() {
    // TODO: implement initState
    () async {
      await check();
      setState(() {
        check();
      });
    }();
    () async {
      await funq();
      setState(() {
        funq();
      });
    }();
    // () async {
    //   await getLocation();
    //   setState(() {
    //     getLocation();
    //   });
    // }();
    super.initState();
  }

  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
    );

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.black,
        // appBar:AppBar(
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
        //         Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => TenantDetails(),
        //       ),
        //     );

        //   },
        //       child: const Text('Tenant'),
        //     ),
        //     TextButton(
        //       style: style,
        //       onPressed: () {

        //         Navigator.push(
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
            if(MediaQuery.of(context).size.height<1000)...[
              Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: CarouselSlider.builder(
                itemCount:imageList.length,
                options: CarouselOptions(
                  disableCenter: true,
                  // enlargeCenterPage: true,
                  height: 230,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  reverse: false,
                  aspectRatio: 5.0,
                ),
                itemBuilder: (context, i, id) {
                  //for onTap to redirect to another screen
                  return GestureDetector(
                    child:Column(
                      children: [
                        if(imageList.isEmpty)...[
                         Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            // color: Colors.white,
                          )),
                      //ClipRRect for image border radius
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          NoimageList[i],
                          width: 400,
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                        ]
                        else
                         Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            // color: Colors.white,
                          )),
                      //ClipRRect for image border radius
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          imageList[i],
                          width: 400,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      ],
                    ),

                    onTap: () {
                      var url = imageList[i];
                      print(url.toString());
                    },
                  );
                },
              ),
            ),
//     ListView(
//     children: List.generate(
//       List.from(property_main.doc("")).length,
//       (i) {
//        return Row(
//         children: [
//           Text(doc['orderDetails'][i]['quantity'].toString()),
//           Text(doc['orderDetails'][i]['title'].toString())),
//         ],
//       );
//     )
// )

// ListView(
//     // shrinkWrap: true,
// 		scrollDirection: Axis.horizontal,
// 		children: <Widget>[
// 			// Container(
// 			// height: 480.0,
// 			// width: 240.0,
// 			// decoration: BoxDecoration(
// 			// 	image: DecorationImage(
// 			// 	image: AssetImage(
// 			// 		'assets/images/aquaman.png'),
// 			// 	fit: BoxFit.fill,
// 			// 	),
// 			// 	shape: BoxShape.rectangle,
// 			// ),
// 			// ),
// 			Text("gg"),
//       Text("ff")
// 		],

// 		),
            Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection.doc(widget.docID).snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');

                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value =
                                    output!['Property_Details']['Property_name'];
                                return Text(
                                  (' $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                );
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                          ),
             ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                // shadowColor: Color.fromARGB(255, 180, 38, 236),
                elevation: 8,
                color: Color(0xFF1E1E1E),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child:
                    // ignore: unnecessary_new

                    Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(18, 113, 125, 137)),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection.doc(widget.docID).snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');

                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value =
                                    output!['Property_Details']['Carpet_Area'];
                                return Text(
                                  ('Carpet_Area : $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                );
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection.doc(widget.docID).snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');

                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value =
                                    output!['Property_Details']['Floor'];
                                return Text(
                                  ('Floor= $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                );
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection.doc(widget.docID).snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');

                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value = output!['Property_Details']['Firm'];
                                return Text(
                                  ('Firm= $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                );
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection.doc(widget.docID).snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');

                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value =
                                    output!['Property_Details']['Tenant'];
                                return Text(
                                  ('Tenant= $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                );
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection.doc(widget.docID).snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');

                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value = output!['Property_Details']['Firm'];
                                return Text(
                                  ('Value = $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                );
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                         
                        ],
                      ),
                      Column(
                        children: [
                          if (n == 1)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateDetailsViews(widget.docID),
                                        ),
                                      );
                                    },
                                    backgroundColor: Colors.black,
                                    child: Icon(
                                      Icons.keyboard_control_sharp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          else
                            Container()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
               
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                   InkWell(
                    onTap:  () async {
                              await getLocation();
                              Future.delayed(Duration(seconds: 3));
                              getDetails(
                                  Latitude, Longitude, Address, Name, context);
                            },
                    child:  Stack(
                      children: [Card(
                      
                      color: Color(0xFF1E1E1E),
            elevation: 5,
            clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
            child: Column(
              children: [
                Image.network(
                        //  "https://thumbs.dreamstime.com/z/bangalore-bengaluru-map-close-up-shot-capital-indian-state-karnataka-114068364.jpg",
                  "https://media.istockphoto.com/vectors/city-urban-streets-roads-abstract-map-vector-id1137117479?k=20&m=1137117479&s=612x612&w=0&h=56n_1vX4IdhkyNZ0Xj6NfSPA0jZSwf6Ru2K68udk4H4=",
                  height: 200,
                  // width:200 ,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width/1.04,
                ),
                
              ],
            ),
          ),Center(
            widthFactor: 1.5,
            heightFactor: 2,
            child: Container(
              width: 90,
              height: 40,
              child: Card(
                      
                      // color: Color(0xFF1E1E1E),
            elevation: 5,
            clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
            child: Text("Location",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20
            ),)
          ),
            )
          )
          ],
                    )
                   )
                  ],
                )
              ]
            ),
            )
          ],
        ),
            ]
            else
            Column(
               mainAxisAlignment: MainAxisAlignment.start,
              children: [Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: CarouselSlider.builder(
                itemCount:imageList.length,
                options: CarouselOptions(
                  disableCenter: true,
                  // enlargeCenterPage: true,
                  height: 450,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  reverse: false,
                  aspectRatio: 5.0,
                ),
                itemBuilder: (context, i, id) {
                  //for onTap to redirect to another screen
                  return GestureDetector(
                    child:Column(
                      children: [
                        if(imageList.isEmpty)...[
                         Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            // color: Colors.white,
                          )),
                      //ClipRRect for image border radius
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          NoimageList[i],
                          width: 400,
                          height: 320,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                        ]
                        else
                         Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            // color: Colors.white,
                          )),
                      //ClipRRect for image border radius
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          imageList[i],
                          width: 590,
                          height: 420,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      ],
                    ),

                    onTap: () {
                      var url = imageList[i];
                      print(url.toString());
                    },
                  );
                },
              ),
            ),
//     ListView(
//     children: List.generate(
//       List.from(property_main.doc("")).length,
//       (i) {
//        return Row(
//         children: [
//           Text(doc['orderDetails'][i]['quantity'].toString()),
//           Text(doc['orderDetails'][i]['title'].toString())),
//         ],
//       );
//     )
// )

// ListView(
//     // shrinkWrap: true,
// 		scrollDirection: Axis.horizontal,
// 		children: <Widget>[
// 			// Container(
// 			// height: 480.0,
// 			// width: 240.0,
// 			// decoration: BoxDecoration(
// 			// 	image: DecorationImage(
// 			// 	image: AssetImage(
// 			// 		'assets/images/aquaman.png'),
// 			// 	fit: BoxFit.fill,
// 			// 	),
// 			// 	shape: BoxShape.rectangle,
// 			// ),
// 			// ),
// 			Text("gg"),
//       Text("ff")
// 		],

// 		),    



 Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection.doc(widget.docID).snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');

                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value =
                                    output!['Property_Details']['Property_name'];
                                return Text(
                                  (' $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                );
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                          ),
             ],
            ),
            SizedBox(height: 10,),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                // shadowColor: Color.fromARGB(255, 180, 38, 236),
                elevation: 8,
                color: Color(0xFF1E1E1E),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child:
                    // ignore: unnecessary_new

                    Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(18, 113, 125, 137)),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection.doc(widget.docID).snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');

                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value =
                                    output!['Property_Details']['Carpet_Area'];
                                return Text(
                                  ('Carpet_Area : $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: Colors.white,
                                  ),
                                );
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection.doc(widget.docID).snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');

                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value =
                                    output!['Property_Details']['Floor'];
                                return Text(
                                  ('Floor= $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: Colors.white,
                                  ),
                                );
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection.doc(widget.docID).snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');

                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value = output!['Property_Details']['Firm'];
                                return Text(
                                  ('Firm= $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: Colors.white,
                                  ),
                                );
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection.doc(widget.docID).snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');

                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value =
                                    output!['Property_Details']['Tenant'];
                                return Text(
                                  ('Tenant= $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: Colors.white,
                                  ),
                                );
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection.doc(widget.docID).snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');

                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value = output!['Property_Details']['Firm'];
                                return Text(
                                  ('Value = $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: Colors.white,
                                  ),
                                );
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                         
                        ],
                      ),
                      Column(
                        children: [
                          if (n == 1)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateDetailsViews(widget.docID),
                                        ),
                                      );
                                    },
                                    backgroundColor: Colors.black,
                                    child: Icon(
                                      Icons.keyboard_control_sharp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          else
                            Container()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
                
                SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                   InkWell(
                    onTap:  () async {
                              await getLocation();
                              Future.delayed(Duration(seconds: 3));
                              getDetails(
                                  Latitude, Longitude, Address, Name, context);
                            },
                    child:  Stack(
                      children: [Card(
                      
                      color: Color(0xFF1E1E1E),
            elevation: 5,
            clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
            child: Column(
              children: [
                Image.network(
                        //  "https://thumbs.dreamstime.com/z/bangalore-bengaluru-map-close-up-shot-capital-indian-state-karnataka-114068364.jpg",
                  "https://media.istockphoto.com/vectors/city-urban-streets-roads-abstract-map-vector-id1137117479?k=20&m=1137117479&s=612x612&w=0&h=56n_1vX4IdhkyNZ0Xj6NfSPA0jZSwf6Ru2K68udk4H4=",
                  height: 315,
                  // width:200 ,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width/1.04,
                ),
                
              ],
            ),
          ),Center(
            widthFactor: 1.5,
            heightFactor: 2,
            child: Container(
              width: 90,
              height: 40,
              child: Card(
                      
                      // color: Color(0xFF1E1E1E),
            elevation: 5,
            clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
            child: Text("Location",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20
            ),)
          ),
            )
          )
          ],
                    )
                   )
                  ],
                )
              ]
            ),
            )
          ],
        ),],
            )
          ],
        )

        
      ),
    );
  }
}
