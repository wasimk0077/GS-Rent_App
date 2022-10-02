import 'package:authh_app/ui/BottomNavbar.dart';
import 'package:authh_app/ui/add_property.dart';
import 'package:authh_app/ui/home_view.dart';
import 'package:authh_app/ui/update_disc_upc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './discover_vacant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DiscoverUpcoming extends StatefulWidget {
  const DiscoverUpcoming({Key? key}) : super(key: key);

  @override
  State<DiscoverUpcoming> createState() => _DiscoverUpcomingState();
}

class _DiscoverUpcomingState extends State<DiscoverUpcoming> {
  final Stream<QuerySnapshot> property_main =
      FirebaseFirestore.instance.collection('property_main').snapshots();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>MyNavigationBar(),
                          ),
                        );
                        return true;
      },
    child: Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiscoverVacant(),
                          ),
                        );
                      },
                      child: Text(
                        'Vacant',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, // background
                        onPrimary: Colors.green, // foreground
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  SizedBox(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, // background
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
                      child: Text(
                        'Upcoming',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              StreamBuilder<QuerySnapshot>(
                  stream: property_main,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text(('Something went wrong'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("loading");
                    }
                    final data = snapshot.requireData;
                    return Expanded(
                        child: ListView.builder(
                            itemCount: data.size,
                            itemBuilder: ((context, index) {
                              if (data.docs[index]['Property_Details']['Property_Status']
                                      ['Upcoming'] ==
                                  true) {
                                return Card(
                                   elevation: 8,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
                                  ),
                                  child:
                                      // ignore: unnecessary_new
                                      new InkWell(
                                    onTap: () {
                                      print("Hello welocme to second page");
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                 color: Color.fromARGB(18, 113, 125, 137)
                ),
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                  children: [SizedBox(
                                        width: 200,child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Text(
                                          //   'Colored card',
                                          //   style: TextStyle(
                                          //     fontSize: 20,
                                          //     color: Colors.white,
                                          //     fontWeight: FontWeight.bold,
                                          //   ),
                                          // ),
                                          const SizedBox(height: 4),
                                          Text(
                                            ('Property Name : ${data.docs[index]['Property_Details']['Property_name']}'),
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            ('Firm Name : ${data.docs[index]['Property_Details']['Firm']}'),
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            ('Tenant Name : ${data.docs[index]['Property_Details']['Tenant']}'),
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            ('Carpet_Area : ${data.docs[index]['Property_Details']['Carpet_Area']}'),
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            ('Yield : ${data.docs[index]['Property_Details']['Yield']}'),
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Column(
                    children: [



                      FloatingActionButton(
        onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateDiscoverUpcoming((data.docs[index].reference.id.toString()),),
                ),
              );
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.keyboard_control_sharp,
          color: Colors.white,
        ),
      ), 
                    ])
                                          // // Row(
                                          // //   children: [
                                          // //        new Image.asset('assets/images/avatar.png'),
                                          // //   ],
                                          // // )
                                        ],
                                      ),
                                        ),
                                       SizedBox(
                      
                      child: 
                      
                      Column(
                        children: [
                          Image.network(data.docs[index]['Property_Details']['imageurl']['image1'],
                          width: 150,
                          height: 150,
                          )
                          
                        ],
                      )
                             
                      
                    )
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
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    ),);
  }
}
