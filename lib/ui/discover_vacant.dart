import 'dart:ffi';

import 'package:authh_app/ui/BottomNavbar.dart';
import 'package:authh_app/ui/add_property.dart';
import 'package:authh_app/ui/home_view.dart';
import 'package:authh_app/ui/update_disc_vac.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './discover_upcoming.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DiscoverVacant extends StatefulWidget {
  const DiscoverVacant({Key? key}) : super(key: key);

  @override
  State<DiscoverVacant> createState() => _DiscoverVacantState();
}

class _DiscoverVacantState extends State<DiscoverVacant> {
  final Stream<QuerySnapshot> property_main =
      FirebaseFirestore.instance.collection('property_main').snapshots();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyNavigationBar(),
            ),
          );
          return true;
        },
        child: Scaffold(
          backgroundColor: Color(0xFF000000),
          body: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.055,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height /
                              13, //height of button
                          width: MediaQuery.of(context).size.width / 3,
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DiscoverVacant(),
                                ),
                              );
                            },
                            child: FittedBox(
                              child: Text(
                                "Vacant",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF221A2C), // background
                              onPrimary: Colors.green, // foreground
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 10),
                        SizedBox(
                          height: MediaQuery.of(context).size.height /
                              13, //height of button
                          width: MediaQuery.of(context).size.width / 3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF221A2C), // background
                              onPrimary: Colors.red, // foreground
                            ),
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DiscoverUpcoming(),
                                ),
                              );
                            },
                            child: FittedBox(
                              child: Text(
                                "Upcoming",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: property_main,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text(('Something went wrong'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("loading");
                          }
                          final data = snapshot.requireData;
                          return Expanded(
                              child: ListView.builder(
                                  itemCount: data.size,
                                  itemBuilder: ((context, index) {
                                    if (data.docs[index]['Property_Details']
                                            ['Property_Status']["Vacant"] ==
                                        true) {
                                      return Card(
                                        color: Color(0xFF221A2C),
                                        elevation: 8,
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        child:
                                            // ignore: unnecessary_new
                                            new InkWell(
                                          onTap: () {
                                            print(
                                                "Hello welocme to second page");
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    18, 113, 125, 137)),
                                            padding: EdgeInsets.all(16),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.50,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // Text(
                                                      //   'Colored card',
                                                      //   style: TextStyle(
                                                      //     fontSize: 20,
                                                      //     color: Colors.white,
                                                      //     fontWeight: FontWeight.bold,
                                                      //   ),
                                                      // ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.020,
                                                      ),
                                                      Text(
                                                        ('Property Name : ${data.docs[index]['Property_Details']['Property_name']}'),
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.020,
                                                      ),
                                                      Text(
                                                        ('Carpet Area : ${data.docs[index]['Property_Details']['Carpet_Area']}'),
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.020,
                                                      ),
                                                      Text(
                                                        ('Asset Value : ${data.docs[index]['Property_Details']['Asset']}'),
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.020,
                                                      ),
                                                      Column(children: [
                                                        FloatingActionButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        UpdateDiscoverVacant(
                                                                  (data
                                                                      .docs[
                                                                          index]
                                                                      .reference
                                                                      .id
                                                                      .toString()),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          backgroundColor:
                                                              Colors.black,
                                                          child: Icon(
                                                            Icons
                                                                .keyboard_control_sharp,
                                                            color: Colors.white,
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ])
                                                      // Row(
                                                      //   children: [
                                                      //        new Image.asset('assets/images/avatar.png'),
                                                      //   ],
                                                      // )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    child: Column(
                                                  children: [
                                                    Image.network(
                                                      data.docs[index][
                                                              'Property_Details']
                                                          [
                                                          'imageurl']['image1'],
                                                      height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .height /
                                                          4, //height of button
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                    )
                                                  ],
                                                ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const SizedBox(height: 4);
                                    }
                                  })));
                        }),
                  ],
                )

                // );
                ),
          ),
        ));
  }
}