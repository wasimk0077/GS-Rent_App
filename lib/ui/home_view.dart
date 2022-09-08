import 'dart:async';

import 'package:authh_app/ui/add_property.dart';
import 'package:authh_app/ui/details_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HomeView extends StatefulWidget {
  


  
  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {





  final dataMap = <String, double>{
    "Residential": 4,
    "Warehouse":4,
    "Banks":4,
    "MNC's":4,
    "Commercial":4
    ,
    
  };

  final colorList = <Color>[
    Colors.greenAccent,
    Colors.black,
    Colors.blueAccent,
    Colors.redAccent,
    Colors.yellowAccent
  ];
  
  String downloadURL="";
  
  final Stream<QuerySnapshot> property_main=FirebaseFirestore.instance.collection('property_main').snapshots();
 firebase_storage.FirebaseStorage storage =
  firebase_storage.FirebaseStorage.instanceFor(
      bucket: 'gs://authentiicate.appspot.com/');

  // firebase_storage.Reference imageLink;
  //  Future<void> downloadURLExample() async {
  //   downloadURL = await firebase_storage.FirebaseStorage.instance
  //       .ref('gs://authentiicate.appspot.com/usersImages')
  //       .child(".png")
  //       .getDownloadURL();
        
  // }
  @override
  
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
      
      Column(
        children: [
          SizedBox(height: 29,),
          Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: PieChart(
              dataMap: dataMap,
              chartType: ChartType.ring,
              baseChartColor: Colors.grey[50]!.withOpacity(0.15),
              colorList: colorList,
              chartValuesOptions: ChartValuesOptions(
                showChartValuesInPercentage: true,
              ),
              totalValue: 20,
            ),
          ),
          SizedBox(height: 20,),
       Table(  
        
                    defaultColumnWidth: FixedColumnWidth(190.0),  
                    border: TableBorder.all(  
                        color: Colors.white,  
                        style: BorderStyle.solid,  
                        width: 2),  
                    children: [  
                      TableRow( children: [  
                        Column(children:[Text('Monthly CF', style: TextStyle(fontSize: 20.0),)]),  
                        Column(children:[Text('Vacant Properties', style: TextStyle(fontSize: 20.0))]),  
                      
                      ]),  
                      TableRow( 
                        
                        children: [  
                        Column(children:[Text('2.5%')]),  
                        Column(children:[Text('250')]),  
                      
                      ]),  
                      
                    ],  
                  ),
      
        
        
         ],
        
      ),
          Container(
            
              
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,
          child: StreamBuilder<QuerySnapshot>(stream:property_main,builder:(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasError){
              return Text(('Something went wrong'));
            }
             if(snapshot.connectionState==ConnectionState.waiting)
             {
              return Text("loading");
             }
             final data=snapshot.requireData;

             print(data);
             
             return ListView.builder(
              itemCount: data.size,
              itemBuilder: ((context, index) {
              // String url=data.docs[index]['imageurl'];
              // print(url);
              // print("ggs");
              // print(data.docs[index]['imageurl']);
              return Card(
                

              // shadowColor: Color.fromARGB(255, 180, 38, 236),
            elevation: 8,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
              child:
             // ignore: unnecessary_new
             new InkWell(
               onTap: () {
                 
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsView(),
                ),
              );
            
               },
               child: Container(
                
                decoration: BoxDecoration(
                 color: Color.fromARGB(18, 113, 125, 137)
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(

                      width: 200,
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            ('${data.docs[index]['Property_Details']['Property_name']}'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                          SizedBox(height: 8),
                          Text(
                            (' ${data.docs[index]['Property_Details']['Carpet_Area']}'),
                            style: TextStyle(
                              // fontWeight:FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            
                          ),
                          Text(
                            ('Firm Name : ${data.docs[index]['Property_Details']['Firm']}'),
                            style: TextStyle(
                              // fontWeight:FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            
                          ),
                          Text(
                            ('Tenant Name : ${data.docs[index]['Property_Details']['Tenant']}'),
                            style: TextStyle(
                              // fontWeight:FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            
                          ),
                          SizedBox(height: 15),
                          Text(
                            ('Yield : ${data.docs[index]['Property_Details']['Yield']}'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          
                  //                    FirebaseFirestore.instance 
                  // .collection('users').document('')
                  // .get()
                  // .then((value) =>
                  // print("Fetched ==>>>"+value.data["username"])),
                  
                  
                  
                            
                             

                              
                  
                             
                            //  Image.network(downloadURL.toString())





                                  // StorageReference imageLink = storage.ref().child(documentSnapshot['imageurl']);
                                  // final imageUrl = await imageLink.getDownloadUrl();
                                  // Image.network(imageUrl.toString());
                                  
                        //                 Image.network(firebase_storage.FirebaseStorage.instance
                        // .ref('gs://authentiicate.appspot.com/usersImages')
                        // .child(".png")
                        // .getDownloadURL();
                        // ),
                          
                          
                          
                          
                      
                            
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

















              
               
               
             }));
                     
          
          }),
          
            
    // );
    


              
          ),
        ],
      ),
      bottomNavigationBar:BottomNavigationBar(  
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        
        
        items: const <BottomNavigationBarItem>[  
          
          BottomNavigationBarItem(  
            
            icon: Icon(Icons.incomplete_circle_outlined),
            label: '',
              
            backgroundColor: Colors.white  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.chat),  
            // title :  Text('Search'),
            label: 'Chat'  ,
            
            // backgroundColor: Colors.black 
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.lightbulb_outlined),  
            // title: Text('Profile'),
            label: 'helloo',  
            // backgroundColor: Colors.black,
          ),  
           BottomNavigationBarItem(  
            icon: Icon(Icons.analytics_outlined),  
            // title: Text('Profile'),
            label: 'helloo',  
            // backgroundColor: Colors.black,
          ),
           BottomNavigationBarItem(  
            icon: Icon(Icons.settings),  
            // title: Text('Profile'),
            label: 'helloo',  
            // backgroundColor: Colors.black,
          ),
        ],  
        type: BottomNavigationBarType.shifting,  
        currentIndex: 0,  
        selectedItemColor: Colors.black,  
        iconSize: 40,  
        onTap: null,  
        elevation: 5  
      ), 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Addproperty(),
            ),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      
      
    );
    
  }
}

















// child: Center(
          //     child: StreamBuilder<QuerySnapshot>(
          //         stream: FirebaseFirestore.instance
          //             .collection('Users')
          //             .doc(FirebaseAuth.instance.currentUser?.uid)
          //             .collection("Coins")
          //             .snapshots(),
          //             builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          //               if(!snapshot.hasData)
          //               {
          //                 return Center(child: CircularProgressIndicator());

          //               }
          //             return ListView(
          //               children: snapshot.data!.docs.map((document){




          //                 return Container(
          //                   child:Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     children: [
          //                       Text("coinname: ${document.id}"),
          //                       Text("Amount Owned: ${document.data()['Amount']}"),
          //                     ],
          //                   ),
          //                 );
          //               }).toList(),





          //             );
          //             },
          //             ),
          //             ),