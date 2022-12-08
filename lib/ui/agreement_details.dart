



import 'package:authh_app/ui/location.dart';
import 'package:authh_app/ui/pdf_invoice_api.dart';
import 'package:authh_app/ui/rent_details.dart';
import 'package:authh_app/ui/update_agr_views.dart';
import 'package:authh_app/ui/update_agreement_doc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'details_view.dart';

class AgreementDetails extends StatefulWidget {
  // const AgreementDetails({ Key? key }) : super(key: key);
  final String docID;//if you have multiple values add here
AgreementDetails(this.docID, {Key? key}): super(key: key);

  @override
  State<AgreementDetails> createState() => _AgreementDetailsState();
}

class _AgreementDetailsState extends State<AgreementDetails> {

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
  final List<String> imageList = [
];
final List<String> NoimageListt=["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAh8YVQhMCGhp1xDo9Pew7q0W4H1zLD-9wbA&usqp=CAU"];

   int _currentIndex = 0;

  final _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.star, color: Colors.blue),
        label:"1"
        ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.star, color: Colors.green),
        label:"2"
        ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.star, color: Colors.pink),
        label:"3"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.star, color: Colors.red),
        label:"4"),
  ];
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
      if(data['Property_Details']["imageurl"]['image2']!="")
      {
imageList.add(data['Property_Details']["imageurl"]["image2"]);
      }
      // 
      // imageList.add(data['Property_Details']["image1"]);
      // image=data['Property_Details']['imageurl']["image1"];
      
    }
  }


  
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

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
   final ButtonStyle style = TextButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
    );
     return DefaultTabController(length: 5, child: Scaffold(
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
      //       onPressed: () {
              
      //       },
      //       child: const Text('Others'),
      //     ),
      //   ],
      // // title:Text("navbar"),
      // ),
      body: Scaffold(
        backgroundColor: Colors.black,
        body:Column(
          children: [
            if(MediaQuery.of(context).size.height<1000)...[
               Column(
       
        children: [
            SizedBox
            (height: MediaQuery.of(context).size.height/12),
          Container(
          
            height: MediaQuery.of(context).size.height/4,
            
            child: Card(
            
                
            
              // shadowColor: Color.fromARGB(255, 180, 38, 236),
            elevation: 8,
            color:Color(0xFF1E1E1E) ,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
              child:
             
             
            
               
                Container(
                  
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                 color: Color.fromARGB(18, 113, 125, 137)
                ),
                padding: EdgeInsets.only(top:6,bottom: 6,left: 15,right: 15),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    SizedBox(
                      // height: 500,
                      width: MediaQuery.of(context).size.width/2,
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           
                        
                          // SizedBox(height: 8),
                            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: collection.doc(widget.docID).snapshots(),
          builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  var output = snapshot.data!.data();
                  var value = output!['Agreement_Details']['Start_Date'];
                  return  FittedBox(

                    fit: BoxFit.fill,
                    child: Text(('Start Date= $value'), style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              // fontSize: 17,
                              color: Colors.white,
                              
                            ),),
                  );
                }

                return Center(child: CircularProgressIndicator());
          },
),
                      
                          // SizedBox(height: 8),
                            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: collection.doc(widget.docID).snapshots(),
          builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  var output = snapshot.data!.data();
                  var value = output!['Agreement_Details']['End_Date'];
                  return  FittedBox(

                    fit: BoxFit.fill,
                    child: Text(('End Date= $value'), style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              // fontSize: 17,
                              color: Colors.white,
                              
                            ),),
                  );
                }

                return Center(child: CircularProgressIndicator());
          },
),
 
                          // SizedBox(height: 8),
                            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: collection.doc(widget.docID).snapshots(),
          builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  var output = snapshot.data!.data();
                  var value = output!['Agreement_Details']['Security_Deposit'];
                  return  FittedBox(

                    fit: BoxFit.fill,
                    child: Text(('Security Deposit= $value'), style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              // fontSize: 17,
                              color: Colors.white,
                              
                            ),),
                  );
                }

                return Center(child: CircularProgressIndicator());
          },
),

                          // SizedBox(height: 8),
                            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: collection.doc(widget.docID).snapshots(),
          builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  var output = snapshot.data!.data();
                  var value = output!['Agreement_Details']['Rent_Escalation'];
                  return FittedBox(

                    fit: BoxFit.fill,
                    child: Text(('Rent Escalation = $value'), style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              // fontSize: 17,
                              color: Colors.white,
                              
                            ),),
                  );
                }

                return Center(child: CircularProgressIndicator());
          },
),

                 
                          
                          
                      
                            
                        ],
                      ),
                    ),
                   
//                   IconButton(onPressed: (() async {
//    final pdfFile = await PdfInvoiceApi.generate();

//                 // opening the pdf file
//                 FileHandleApi.openFile(pdfFile);
// }), icon: Icon(Icons.download_rounded)),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(n==1)FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateAgreementViews(widget.docID),
            ),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.keyboard_control_sharp,
          color: Colors.white,
        ),
      )
      else Container()
      ,
      // ElevatedButton(onPressed: (){
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => UpdatAgreementDoc(),
      //       ),
      //     );
      // }, child: Text("AGR"))
                  ],
                 ),

],
                ),
            ),
            
            
            
            

             
             
          ),
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(('Photos'),
                    
                    textAlign:TextAlign.center,
                     style: TextStyle(
                          fontWeight:FontWeight.bold,
                          
                          fontSize: 18,
                          color: Colors.white,
                          
                        ),),
          ],
          ),
           Row(
          mainAxisAlignment: MainAxisAlignment.start,
          
          
          children: [
            SizedBox(width: MediaQuery.of(context).size.width/20,),
          FittedBox(
            fit: BoxFit.fill,
            child:   Text(('Before'),
                    
                    textAlign:TextAlign.center,
                     style: TextStyle(
                          fontWeight:FontWeight.bold,
                          
                          // fontSize: 18,
                          color: Colors.white,
                          
                        ),),
          )
          ],
          ),
        Container(
              // margin: EdgeInsets.all(0),
              margin: EdgeInsets.only(left: 5,right: 5),
              child: CarouselSlider.builder(
                itemCount:imageList.length,
                options: CarouselOptions(
                  disableCenter: true,
                  // enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height/4.02,
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
                            width: 4,
                          )),
                      //ClipRRect for image border radius
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          NoimageListt[i],
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
                            width: 4,
                          )),
                      //ClipRRect for image border radius
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          imageList[i],
                          width: MediaQuery.of(context).size.width,
                          height:MediaQuery.of(context).size.height/4.2 ,
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
            Row(
          mainAxisAlignment: MainAxisAlignment.start,
          
          
          children: [
             SizedBox(width: MediaQuery.of(context).size.width/20,),
           FittedBox(
            fit: BoxFit.fill,
            child:   Text(('After'),
                    
                    textAlign:TextAlign.center,
                     style: TextStyle(
                          fontWeight:FontWeight.bold,
                          
                          // fontSize: 18,
                          color: Colors.white,
                          
                        ),),
          )
          ],
          ),
         Container(
              margin: EdgeInsets.only(left: 5,right: 5),
              child: CarouselSlider.builder(
                itemCount:imageList.length,
                options: CarouselOptions(
                  disableCenter: true,
                  // enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height/4.02,
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
                        
                         Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            // color: Colors.white,
                            width: 4,
                          )),
                      //ClipRRect for image border radius
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          NoimageListt[0],
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/4.2,
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
        
             
        
        
        
        
        
        
        
        
        
        ],
        
      )
      ,
            ]
//             else  Column(
       
//         children: [
//           Container(
//             height: 400,
            
//             child: Card(
            
                
            
//               // shadowColor: Color.fromARGB(255, 180, 38, 236),
//             elevation: 8,
//             color:Color(0xFF1E1E1E) ,
//             clipBehavior: Clip.antiAlias,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(24),
//             ),
//               child:
             
             
            
               
//                 Container(
                  
                
//                 decoration: BoxDecoration(
//                  color: Color.fromARGB(18, 113, 125, 137)
//                 ),
//                 padding: EdgeInsets.all(10),
//                 child: Row(

//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
                    
//                     SizedBox(
//                       height: 500,
//                       width: 300,
//                       child: Column(

//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
                           
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [Text(('Agreement'),
                        
//                         textAlign:TextAlign.center,
//                          style: TextStyle(
//                               fontWeight:FontWeight.bold,
                              
//                               fontSize:40,
//                               color: Colors.white,
                              
//                             ),),],
//                         ),
//                           SizedBox(height: 8),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   width: 20,
//                                 ),StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//           stream: collection.doc(widget.docID).snapshots(),
//           builder: (_, snapshot) {
//                 if (snapshot.hasError) return Text('Error = ${snapshot.error}');

//                 if (snapshot.hasData) {
//                   var output = snapshot.data!.data();
//                   var value = output!['Agreement_Details']['Start_Date'];
//                   return Text(('Start Date= $value'), style: TextStyle(
//                               fontWeight:FontWeight.bold,
                              
//                               fontSize: 22,
//                               color: Colors.white,
                              
//                             ),);
//                 }

//                 return Center(child: CircularProgressIndicator());
//           },
// ),],
//                             ),
                      
//                           SizedBox(height: 8),
//                            Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                   width: 20,
//                                 ), StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//           stream: collection.doc(widget.docID).snapshots(),
//           builder: (_, snapshot) {
//                 if (snapshot.hasError) return Text('Error = ${snapshot.error}');

//                 if (snapshot.hasData) {
//                   var output = snapshot.data!.data();
//                   var value = output!['Agreement_Details']['End_Date'];
//                   return Text(('End Date= $value'), style: TextStyle(
//                               fontWeight:FontWeight.bold,
                              
//                               fontSize: 22,
//                               color: Colors.white,
                              
//                             ),);
//                 }

//                 return Center(child: CircularProgressIndicator());
//           },
// ),],
//                            ),
 
//                           SizedBox(height: 8),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   width: 20,
//                                 ),StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//           stream: collection.doc(widget.docID).snapshots(),
//           builder: (_, snapshot) {
//                 if (snapshot.hasError) return Text('Error = ${snapshot.error}');

//                 if (snapshot.hasData) {
//                   var output = snapshot.data!.data();
//                   var value = output!['Agreement_Details']['Security_Deposit'];
//                   return Text(('Security Deposit= $value'), style: TextStyle(
//                               fontWeight:FontWeight.bold,
                              
//                               fontSize: 22,
//                               color: Colors.white,
                              
//                             ),);
//                 }

//                 return Center(child: CircularProgressIndicator());
//           },
// ),],
//                             ),

//                           SizedBox(height: 8),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
                                
//                                 SizedBox(
//                                   width: 20,
//                                 ),
//                                 StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//           stream: collection.doc(widget.docID).snapshots(),
//           builder: (_, snapshot) {
//                 if (snapshot.hasError) return Text('Error = ${snapshot.error}');

//                 if (snapshot.hasData) {
//                   var output = snapshot.data!.data();
//                   var value = output!['Agreement_Details']['Rent_Escalation'];
//                   return Text(('Rent Escalation = $value'), style: TextStyle(
//                               fontWeight:FontWeight.bold,
                              
//                               fontSize: 22,
//                               color: Colors.white,
                              
//                             ),);
//                 }

//                 return Center(child: CircularProgressIndicator());
//           },
// ),],
//                             ),

                 
                          
                          
                      
                            
//                         ],
//                       ),
//                     ),
                   
// //                   IconButton(onPressed: (() async {
// //    final pdfFile = await PdfInvoiceApi.generate();

// //                 // opening the pdf file
// //                 FileHandleApi.openFile(pdfFile);
// // }), icon: Icon(Icons.download_rounded)),
//                  Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     if(n==1)FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => UpdateAgreementViews(widget.docID),
//             ),
//           );
//         },
//         backgroundColor: Colors.black,
//         child: Icon(
//           Icons.keyboard_control_sharp,
//           color: Colors.white,
//         ),
//       )
//       else Container()
//       ,
      
//                   ],
//                  ),

// ],
//                 ),
//             ),
            
            
            
            

             
             
//           ),
//           ),
//           Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(('Photos'),
                    
//                     textAlign:TextAlign.center,
//                      style: TextStyle(
//                           fontWeight:FontWeight.bold,
                          
//                           fontSize: 35,
//                           color: Colors.white,
                          
//                         ),),
//           ],
//           ),
//            Row(
//           mainAxisAlignment: MainAxisAlignment.start,
          
          
//           children: [
//             Text(('Before'),
                    
//                     textAlign:TextAlign.center,
//                      style: TextStyle(
//                           fontWeight:FontWeight.bold,
                          
//                           fontSize: 28,
//                           color: Colors.white,
                          
//                         ),),
//           ],
//           ),
//         Container(
//           height: 300,
//               // margin: EdgeInsets.all(0),
//               child: CarouselSlider.builder(
//                 itemCount:imageList.length,
//                 options: CarouselOptions(
//                   disableCenter: true,
//                   // enlargeCenterPage: true,
//                   height: 205,
//                   autoPlay: true,
//                   autoPlayInterval: Duration(seconds: 3),
//                   reverse: false,
//                   aspectRatio: 5.0,
//                 ),
//                 itemBuilder: (context, i, id) {
//                   //for onTap to redirect to another screen
//                   return GestureDetector(
//                     child:Column(
//                       children: [
//                         if(imageList.isEmpty)...[
//                          Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           border: Border.all(
//                             // color: Colors.white,
//                           )),
//                       //ClipRRect for image border radius
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(15),
//                         child: Image.network(
//                           NoimageList[i],
//                           width: 400,
//                           height: 250,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                         ]
//                         else
//                          Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           border: Border.all(
//                             // color: Colors.white,
//                           )),
//                       //ClipRRect for image border radius
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(15),
//                         child: Image.network(
//                           imageList[i],
//                           width: 400,
//                           height: 250,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                       ],
//                     ),

//                     onTap: () {
//                       var url = imageList[i];
//                       print(url.toString());
//                     },
//                   );
//                 },
//               ),
//             ),
//             Row(
//           mainAxisAlignment: MainAxisAlignment.start,
          
          
//           children: [
//             Text(('After'),
                    
//                     textAlign:TextAlign.center,
//                      style: TextStyle(
//                           fontWeight:FontWeight.bold,
                          
//                           fontSize: 28,
//                           color: Colors.white,
                          
//                         ),),
//           ],
//           ),
//          Container(
//           height: 300,
//               margin: EdgeInsets.all(0),
//               child: CarouselSlider.builder(
//                 itemCount:imageList.length,
//                 options: CarouselOptions(
//                   disableCenter: true,
//                   // enlargeCenterPage: true,
//                   height: 260,
//                   autoPlay: true,
//                   autoPlayInterval: Duration(seconds: 3),
//                   reverse: false,
//                   aspectRatio: 5.0,
//                 ),
//                 itemBuilder: (context, i, id) {
//                   //for onTap to redirect to another screen
//                   return GestureDetector(
//                     child:Column(
//                       children: [
                        
//                          Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           border: Border.all(
//                             color: Colors.white,
//                           )),
//                       //ClipRRect for image border radius
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(15),
//                         child: Image.network(
//                           NoimageList[0],
//                           width: 400,
//                           height: 235,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
                        
                        
                       
//                       ],
//                     ),

//                     onTap: () {
//                       var url = imageList[i];
//                       print(url.toString());
//                     },
//                   );
//                 },
//               ),
//             ),
        
             
        
        
        
        
        
        
        
        
        
//         ],
        
//       )
//       ,
          ],
        )
        
        
        )
      )
     );
    



    
  }
  
  }
