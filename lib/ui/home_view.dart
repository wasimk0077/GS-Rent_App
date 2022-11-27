import 'dart:async';
import 'package:authh_app/net/flutterfire.dart';
import 'package:authh_app/ui/BottomSliderperProperty.dart';
import 'package:authh_app/ui/ChangePassword.dart';
import 'package:authh_app/ui/Chat.dart';
import 'package:authh_app/ui/Pre_add.dart';
import 'package:authh_app/ui/Property_type_Res.dart';
import 'package:authh_app/ui/Views.dart';
import 'package:authh_app/ui/add_property.dart';
import 'package:authh_app/ui/auth_as_Admin.dart';
import 'package:authh_app/ui/authentication.dart';
import 'package:authh_app/ui/barchart.dart';
import 'package:authh_app/ui/details_view.dart';
import 'package:authh_app/ui/discover_upcoming.dart';
import 'package:authh_app/ui/discover_vacant.dart';
import 'package:authh_app/ui/property_types.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'categories_row.dart';
import 'pie_chart_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
ScrollController scrollController = ScrollController();
  bool showbtn = false;



    int TotalResProp=0;
  int TotalBankProp=0;
  int TotalCommProp=0;
  int TotalWareProp=0;
  int TotalMNCProp=0;
   get_No_of_PropertyTypes() async {

  await FirebaseFirestore.instance.collection("property_main").get().then((value) {
    for(var i in value.docs) {

//     
        if((i["Property_Details"]["Property_Types"]["Residential"])==true && i["Property_Details"]["Property_Status"]["Upcoming"] != true )
        {
          print(" entered the loop");
          TotalResProp=TotalResProp+1;
            
        }
        if(i["Property_Details"]["Property_Types"]["Bank"]==true && i["Property_Details"]["Property_Status"]["Upcoming"] != true )
        {
            TotalBankProp=TotalBankProp+1;
            
            
        }
         if(i["Property_Details"]["Property_Types"]["Commercial"]==true && i["Property_Details"]["Property_Status"]["Upcoming"] != true)
        {
            TotalCommProp=TotalCommProp+1;
           
        
        }
        
         if(i["Property_Details"]["Property_Types"]["MNC"]==true && i["Property_Details"]["Property_Status"]["Upcoming"] != true)
        {
            TotalMNCProp=TotalMNCProp+1;
              // TotalMNCRent=TotalMNCRent+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
        }
         if(i["Property_Details"]["Property_Types"]["Warehouse"]==true && i["Property_Details"]["Property_Status"]["Upcoming"] != true)
        {
            TotalWareProp=TotalWareProp+1;
              // TotalMNCRent=TotalMNCRent+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
        }
       

        //  print("nah didnt enter the loop2");
      // print("getdata called");
    }
    // suggestionslist=Properties;
  });
  }








  int TotalRent = 0;
  int TotalVacant = 0;
  getData() async {
    await FirebaseFirestore.instance
        .collection("property_main")
        .get()
        .then((value) {
      for (var i in value.docs) {
        //  print("nah didnt enter the loop");

        TotalRent = TotalRent + int.parse(i["Property_Details"]["Rent"]);

        if (i["Property_Details"]["Property_Status"]["Vacant"] == true) {
          TotalVacant = TotalVacant + 1;
        }

        //  print("nah didnt enter the loop2");
        // print("getdata called");
      }
      // suggestionslist=Properties;
    });
  }
  
  String docId = "";
  String downloadURL = "";
  
  final Stream<QuerySnapshot> property_main =
      FirebaseFirestore.instance.collection('property_main').snapshots();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instanceFor(
          bucket: 'gs://authentiicate.appspot.com/');

  @override
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

  void initState() {
    // TODO: implement initState
    () async {
      await check();
      setState(() {
        check();
      });
    }();
    () async {
      await getData();
      setState(() {
        check();
      });
    }();
    () async {
      await get_No_of_PropertyTypes();
      setState(() {
        get_No_of_PropertyTypes();
      });
    }();
    
    // print(MediaQuery.of(context).size.width);
    scrollController.addListener(() { //scroll listener 
        double showoffset = 5.0; //Back to top botton will show on scroll offset 10.0

        if(scrollController.offset > showoffset){
              showbtn = true;
              setState(() {
                //update state 
              });
        }else{
             showbtn = false;
              setState(() {
                //update state
                
              });
        }
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return  WillPopScope(
        onWillPop: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Authentication(),
            ),
          );
          return true;
        }, child: Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor:Colors.black,
      body: Container(
        
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height/1.05 ,
        child:CustomScrollView(
          controller: scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            toolbarHeight: MediaQuery.of(context).size.height/1.5,
            actions: [
              Column(
                children: [SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/4,
            // height: 250,
            child: InkWell(
            
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PropertyTypes(),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // PieChart(
                //   data: const [
                //     PieChartData(Colors.purple, 50),
                //     PieChartData(Colors.blue, 5),
                //     PieChartData(Colors.orange, 15),
                //     PieChartData(Colors.green, 15),
                //     PieChartData(Colors.red, 15),
                //   ],
                //   radius: 65,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         'Rental Shares',
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white,
                //         ),
                //       ),
                //       Text(
                //         "Rs " + TotalRent.toString(),
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white,
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CategoriesRow(),
                          PieChartView(TotalResProp.toString(),TotalMNCProp.toString(),TotalWareProp.toString(),TotalCommProp.toString(),TotalBankProp.toString()),
                        ],
                      ),
                    ),
                // SizedBox(
                //   height: 20,
                // ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Monthly CF',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            ("100"),
                            style: TextStyle(
                              // fontWeight:FontWeight.bold,

                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            ('Vacant Properties'),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            (TotalVacant.toString()),
                            style: TextStyle(
                              // fontWeight:FontWeight.bold,

                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),
           SizedBox(
            height: 10,
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 350,
          //   child: Card(
          //    elevation: 8,
          //                   clipBehavior: Clip.antiAlias,
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(24),
          //                   ),
          //   child: Column(
          //     children: [
          //       Image.network(
          //               //  "https://thumbs.dreamstime.com/z/bangalore-bengaluru-map-close-up-shot-capital-indian-state-karnataka-114068364.jpg",
          //         "https://media.istockphoto.com/vectors/city-urban-streets-roads-abstract-map-vector-id1137117479?k=20&m=1137117479&s=612x612&w=0&h=56n_1vX4IdhkyNZ0Xj6NfSPA0jZSwf6Ru2K68udk4H4=",
                  
                  
          //         height: 300,
          //         fit: BoxFit.cover,
          //         width: MediaQuery.of(context).size.width
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10),
          //             child: Text(
          //               "Location",
          //               style: const TextStyle(
          //                 fontSize: 18,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //           // ElevatedButton(
          //           //   onPressed: () {},
          //           //   child: const Text("Direction"),
          //           // )
          //         ],
          //       ),
          //     ],
          //   ),
          // ),


          // ),


          
          Row(
           children: [ 
            SizedBox(width: 5,),Text(
                            ("   Upcoming Properties \u{2192}"),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.white,
                              
                            ),
                            
                          ),],
          ),

          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            // height:MediaQuery.of(context).size.height/3.5
            // ,
            height: 248,
            
            
            child: StreamBuilder<QuerySnapshot>(
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

                  print(data);

                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                        // scrollDirection: Axis.vertical,
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      // shrinkWrap: true,
                      itemCount: data.size,
                      itemBuilder: ((context, index) {
                        // String url=data.docs[index]['imageurl'];
                        // print(url);
                        // print("ggs");
                        // print(data.docs[index]['imageurl']);
                        if (data.docs[index]['Property_Details']
                                ['Property_Status']['Upcoming'] ==
                            true) {
                          return Card(
                            
                            // shadowColor: Color.fromARGB(255, 180, 38, 236),
                            color: Color(0xFF1E1E1E),
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
                                    builder: (context) => DiscoverUpcoming(
                                      
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFF1E1E1E)),
                                // padding: EdgeInsets.all(2),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // mainAxisAlignment:MainAxisAlignment.spaceAround,
                                  children: [
                                        
    SizedBox(width: 5,),         
     
                                    SizedBox(
                                      width: 250,
                                      
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          // SizedBox(width: 10,),
                                           Container(
                                            width: 250,
                                            height: 170,
                                            child: FittedBox(
                                            fit: BoxFit.fill,
                                            
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        if (data.docs[index]['Property_Details']
                                                ['imageurl'] ==
                                            null)
                                          ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network("https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930",
                                          
                                          // width: MediaQuery.of(context).size.width,
                                          // height: MediaQuery.of(context).size.height/8,
                                          ))
                                        else
                                         ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child:  Image.network(
                                            data.docs[index]['Property_Details']
                                                ['imageurl']['image1'],
                                            // width:MediaQuery.of(context).size.width,
                                            
                                          )),
                                      ],
                                    )),
                                           ),
                                      
                                          // Text(
                                          //   'Colored card',
                                          //   style: TextStyle(
                                          //     fontSize: 20,
                                          //     color: Colors.white,
                                          //     fontWeight: FontWeight.bold,
                                          //   ),
                                          // ),

                                          Column(
                                            children: [
                                              // SizedBox(height: 4),
                                            
                                               Container(
                        width:(MediaQuery.of(context).size.width),
                        // height: 100,
                        
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // SizedBox(width: 2,),
                            Column(
                              children: [
                                SizedBox(height: 15,),
                                Text(
                            ('Name'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 18,
                              color: Colors.white,
                              
                            ),
                            
                          ),
                          SizedBox(height: 5,),
                          
                          Text(
                            ("${data.docs[index]['Property_Details']['Property_name']}"),
                            style: TextStyle(
                              // fontWeight:FontWeight.bold,
                              
                              fontSize: 18,
                              color: Colors.white,
                              
                            ),
                            
                          ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(height: 15,),
                                Text(
                            ('Sale Price'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 18,
                              color: Colors.white,
                              
                            ),
                            
                          ),
                          SizedBox(height: 5,),
                          
                          Text(
                            ("${data.docs[index]['Property_Details']['Asset']}"),
                            style: TextStyle(
                              // fontWeight:FontWeight.bold,
                              
                              fontSize: 18,
                              color: Colors.white,
                              
                            ),
                            
                          ),
                              ],
                            ),Column(
                              children: [
                                SizedBox(height: 15,),
                                Text(
                            ('Sq. Ft'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 18,
                              color: Colors.white,
                              
                            ),
                            
                          ),
                          SizedBox(height: 5,),
                          
                          Text(
                            ("${data.docs[index]['Property_Details']['Carpet_Area']}"),
                            style: TextStyle(
                              // fontWeight:FontWeight.bold,
                              
                              fontSize: 18,
                              color: Colors.white,
                              
                            ),
                            
                          ),
                              ],
                            ),
                            
                          ],
                        ),
                         

                       ),

                                            
                                            ],
                                          )
                                         

                                          //                    FirebaseFirestore.instance
                                          // .collection('users').document('')
                                          // .get()
                                          // .then((value) =>
                                          // print("Fetched ==>>>"+value.data["username"])),
                                        ],
                                      ),
                                    ),
                                   
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return SizedBox(width: 1,);
                        }
                      }));
                }),

            // );
          ),
           SizedBox(
            height: 5,
          ),
          
          
          ],
              )
            ],
           
          ),
          SliverFillRemaining(
            // hasScrollBody: true,
            fillOverscroll: true,
            child: 



 ListView(

          

            //  physics: NeverScrollableScrollPhysics(),
            primary: false,
             shrinkWrap: true,
          children:[ Column(
            children: [SizedBox(height: 10,),
            Text(
                            (" \u{2193} \u{2193} Occupied Properties \u{2193} \u{2193}"),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.white,
                              
                            ),
                            
                          ),
          
               Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height/3.5,
            
            
            child: StreamBuilder<QuerySnapshot>(
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

                  print(data);

                  return ListView.builder(

                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    
                      //  primary: false,

                      itemCount: data.size,
                      itemBuilder: ((context, index) {
                        // String url=data.docs[index]['imageurl'];
                        // print(url);
                        // print("ggs");
                        // print(data.docs[index]['imageurl']);
                        if (data.docs[index]['Property_Details']
                                ['Property_Status']['Occupied'] ==
                            true) {
                          return Card(
                            // shadowColor: Color.fromARGB(255, 180, 38, 236),
                            color: Color(0xFF1E1E1E),
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
                                    builder: (context) => NavBarForProperty(
                                      (data.docs[index].reference.id
                                          .toString()),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(18, 113, 125, 137)),
                                // padding: EdgeInsets.all(2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  // mainAxisAlignment:MainAxisAlignment.spaceAround,
                                  children: [
                                        Column(
                                          children: [
                                          if(data.docs[index]['Rent_Details']
                                                [DateTime.now().year.toString()][DateTime.now().month.toString()]["status"]==false)...[
                                                  Container(
      height: 222,
      width: 20,
      color: Colors.red,
    ),
                                                ]
                                                else Container(
      height: 222,
      width: 20,
      color: Colors.green,
    ),
                                                
                                                
                                                ],
                                        ),

    SizedBox(
                                        child: Column(
                                      children: [
                                        if (data.docs[index]['Property_Details']
                                                ['imageurl']['image1'] ==
                                            "")
                                           Container(
                width: 130,
                height: 250,
                margin: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: NetworkImage(
                        'https://st4.depositphotos.com/14953852/22772/v/450/depositphotos_227725040-stock-illustration-image-available-icon-flat-vector.jpg'),
                  ),
                ),
              )        
                                        else
                                      Container(
                width: 130,
                 height: 200,
                margin: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: NetworkImage(
                        '${data.docs[index]['Property_Details']['imageurl']['image1']}'),
                  ),
                ),
              ),              ],
                                    )
                                    ),
    // SizedBox(width: 5,),
                                    SizedBox(
                                      width: 200,
                                      child: Column(
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
                                            ('${data.docs[index]['Property_Details']['Property_name']}'),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            (' ${data.docs[index]['Property_Details']['Carpet_Area']}  Sqft'),
                                            style: TextStyle(
                                              // fontWeight:FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                          // Text(
                                          //   ('Firm Name : ${data.docs[index]['Firm_Details']['Firm_name']}'),
                                          //   style: TextStyle(
                                          //     // fontWeight:FontWeight.bold,
                                          //     fontSize: 20,
                                          //     color: Colors.white,
                                          //   ),
                                          // ),
                                          FittedBox(
        fit: BoxFit.fitWidth, 
        child:Text(
                                            ('Tenant Name : ${data.docs[index]['Tenant_Details']['Tenant_name']}'),
                                            style: TextStyle(
                                              // fontWeight:FontWeight.bold,
                                              // fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
    ),
                                          SizedBox(height: 15),
                                          // Text(
                                          //   ('Yield : ${data.docs[index]['Property_Details']['Yield']}'),
                                          //   style: TextStyle(
                                          //     fontWeight: FontWeight.bold,
                                          //     fontSize: 20,
                                          //     color: Colors.white,
                                          //   ),
                                          // ),

                                          //                    FirebaseFirestore.instance
                                          // .collection('users').document('')
                                          // .get()
                                          // .then((value) =>
                                          // print("Fetched ==>>>"+value.data["username"])),
                                        ],
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox(height: 4);
                        }
                      }));
                }),

            // );
          ),
            
    //         
           ],
          ),
         ] ),
          )

        ],
      ) ,),
       
      

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => Addproperty(),
      //       ),
      //     );
      //   },
      //   backgroundColor: Colors.black,
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
      
      // floatingActionButton: _getFAB(),
      // floatingActionButton: AnimatedOpacity(
      //      duration: Duration(milliseconds: 1000),  //show/hide animation
      //      opacity: showbtn?1.0:0.0, //set obacity to 1 on visible, or hide
      //      child: FloatingActionButton( 
      //         onPressed: () {  
      //            scrollController.animateTo( //go to top of scroll
      //              0,  //scroll offset to go
      //              duration: Duration(milliseconds: 500), //duration of scroll
      //              curve:Curves.fastOutSlowIn //scroll type
      //             );
      //         },
      //         child: Icon(Icons.arrow_upward),
      //         backgroundColor: Colors.redAccent,
      //      ), 
      //    ),
      floatingActionButton: Wrap( //will break to another line on overflow
    direction: Axis.horizontal, //use vertical to show  on vertical axis
    children: <Widget>[
      Container(
        margin:EdgeInsets.all(10),
        child: AnimatedOpacity(
        duration: Duration(milliseconds: 1000),  //show/hide animation
           opacity: showbtn?1.0:0.0,
           child: FloatingActionButton( 
            heroTag: "btn1",
              onPressed: () {  
                 scrollController.animateTo( //go to top of scroll
                   0,  //scroll offset to go
                   duration: Duration(milliseconds: 500), //duration of scroll
                   curve:Curves.fastOutSlowIn //scroll type
                  );
              },
              child: Icon(Icons.arrow_upward),
              backgroundColor: Colors.redAccent,
           ),
      ),
      ),
      
          Container(
            margin:EdgeInsets.all(10),
            child: _getFAB(),
          )
    ],),
    ));
    
  }

  Widget _getFAB() {
    if (n == 0) {return Container();
    } else {
      return FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PreAdd(),
              ),
            );
          });
    }
  }
}

class PieChartData {
  const PieChartData(this.color, this.percent);

  final Color color;
  final double percent;
}

// our pie chart widget
class PieChart extends StatelessWidget {
  PieChart({
    required this.data,
    required this.radius,
    this.strokeWidth = 8,
    this.child,
    Key? key,
  })  : // make sure sum of data is never ovr 100 percent
        assert(data.fold<double>(0, (sum, data) => sum + data.percent) <= 100),
        super(key: key);

  final List<PieChartData> data;
  // radius of chart
  final double radius;
  // width of stroke
  final double strokeWidth;
  // optional child; can be used for text for example
  final Widget? child;

  @override
  Widget build(context) {
    return CustomPaint(
      painter: _Painter(strokeWidth, data),
      size: Size.square(radius),
      child: SizedBox.square(
        // calc diameter
        dimension: radius * 2,
        child: Center(
          child: child,
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

// responsible for painting our chart
class _PainterData {
  const _PainterData(this.paint, this.radians);

  final Paint paint;
  final double radians;
}

class _Painter extends CustomPainter {
  _Painter(double strokeWidth, List<PieChartData> data) {
    // convert chart data to painter data
    dataList = data
        .map((e) => _PainterData(
              Paint()
                ..color = e.color
                ..style = PaintingStyle.stroke
                ..strokeWidth = strokeWidth
                ..strokeCap = StrokeCap.round,
              // remove padding from stroke
              (e.percent - _padding) * _percentInRadians,
            ))
        .toList();
  }

  static const _percentInRadians = 0.062831853071796;
  static const _padding = 4;
  static const _paddingInRadians = _percentInRadians * _padding;
  // 0 radians is to the right, but since we want to start from the top
  // we'll use -90 degrees in radians
  static const _startAngle = -1.570796 + _paddingInRadians / 2;

  late final List<_PainterData> dataList;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    // keep track of start angle for next stroke
    double startAngle = _startAngle;

    for (final data in dataList) {
      final path = Path()..addArc(rect, startAngle, data.radians);

      startAngle += data.radians + _paddingInRadians;

      canvas.drawPath(path, data.paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}