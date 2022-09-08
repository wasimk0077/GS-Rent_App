
import 'dart:async';

import 'package:authh_app/ui/add_property.dart';
import 'package:authh_app/ui/agreement_details.dart';
import 'package:authh_app/ui/home_view.dart';
import 'package:authh_app/ui/location.dart';
import 'package:authh_app/ui/rent_details.dart';
// import 'package:authh_app/ui/tenant.dart';
import 'package:authh_app/ui/tenant_details.dart';
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
 
class DetailsView extends StatefulWidget {
  
  const DetailsView({ Key? key }) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  var collection = FirebaseFirestore.instance.collection('property_main');
  // @override
  

  final List<String> imageList = ["https://firebasestorage.googleapis.com/v0/b/authentiicate.appspot.com/o/null.png?alt=media&token=60e5fb2c-fb17-4fa9-b0c4-791ce5daba8d",
  'https://firebasestorage.googleapis.com/v0/b/authentiicate.appspot.com/o/images?alt=media&token=567d3634-0325-413b-a67e-714ffabeaf73',
];

  //   static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  // Completer<GoogleMapController> _controllerGoogleMap=Completer();
  // late GoogleMapController newGoogleMapController;
  // GlobalKey<ScaffoldState> scaffoldKey=new GlobalKey<ScaffoldState>();
  // late Position currentPosition;
  // var geoLocator=Geolocator();

  // void locatePosition() async{
  //   Position position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   currentPosition=position;

  //   LatLng latLatPosition=LatLng(position.latitude, position.longitude);
  //   CameraPosition cameraPosition=new CameraPosition(target: latLatPosition,zoom: 14);
  //   newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  // }



  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return DefaultTabController(length: 5, child: Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: <Widget>[
          TextButton(
            style: style,
            onPressed:(){
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsView(),
            ),
          );
            },
            child: const Text('Basic'),
          ),
          TextButton(
            style: style,
            onPressed: (){
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TenantDetails(),
            ),
          );
          
        },
            child: const Text('Tenant'),
          ),
          TextButton(
            style: style,
            onPressed: () {

              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Rent_Details(),
            ),
          );
            },
            child: const Text('Rent'),
          ),
          TextButton(
            style: style,
            onPressed: () {
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgreementDetails(),
            ),
          );
            },
            child: const Text('Agr'),
          ),
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text('Others'),
          ),
        ],
      // title:Text("navbar"),
      ),
      body:Column(
        children: [
          Container(
  margin: EdgeInsets.all(15),
  child: CarouselSlider.builder(
    itemCount: imageList.length,
    options: CarouselOptions(
          enlargeCenterPage: true,
          height: 300,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          reverse: false,
          aspectRatio: 5.0,
    ),
    itemBuilder: (context, i, id){
          //for onTap to redirect to another screen
          return GestureDetector(
            child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white,)
            ),
              //ClipRRect for image border radius
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageList[i],
                width: 500,
                fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: (){
              var url = imageList[i];
              print(url.toString());
            },
          );
    },
  ),
),
Container(

    child:Card(
            

          // shadowColor: Color.fromARGB(255, 180, 38, 236),
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
          child:
         // ignore: unnecessary_new
         
        
           
            Container(
            
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
                       
      StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: collection.doc('5hmJ6rNaRf92Lt8KyB6v').snapshots(),
      builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              var output = snapshot.data!.data();
              var value = output!['Property_Details']['Carpet_Area'];
              return Text(('Carpet_Area : $value'), style: TextStyle(
                          fontWeight:FontWeight.bold,
                          
                          fontSize: 20,
                          color: Colors.black,
                          
                        ),);
            }

            return Center(child: CircularProgressIndicator());
      },
),
                      SizedBox(height: 8),
                        StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: collection.doc('5hmJ6rNaRf92Lt8KyB6v').snapshots(),
      builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              var output = snapshot.data!.data();
              var value = output!['Property_Details']['Floor'];
              return Text(('Floor= $value'), style: TextStyle(
                          fontWeight:FontWeight.bold,
                          
                          fontSize: 20,
                          color: Colors.black,
                          
                        ),);
            }

            return Center(child: CircularProgressIndicator());
      },
),
                  
                      SizedBox(height: 8),
                        StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: collection.doc('5hmJ6rNaRf92Lt8KyB6v').snapshots(),
      builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              var output = snapshot.data!.data();
              var value = output!['Property_Details']['Firm'];
              return Text(('Firm= $value'), style: TextStyle(
                          fontWeight:FontWeight.bold,
                          
                          fontSize: 20,
                          color: Colors.black,
                          
                        ),);
            }

            return Center(child: CircularProgressIndicator());
      },
),
 
                      SizedBox(height: 8),
                        StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: collection.doc('5hmJ6rNaRf92Lt8KyB6v').snapshots(),
      builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              var output = snapshot.data!.data();
              var value = output!['Property_Details']['Tenant'];
              return Text(('Tenant= $value'), style: TextStyle(
                          fontWeight:FontWeight.bold,
                          
                          fontSize: 20,
                          color: Colors.black,
                          
                        ),);
            }

            return Center(child: CircularProgressIndicator());
      },
),

                      SizedBox(height: 8),
                        StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: collection.doc('5hmJ6rNaRf92Lt8KyB6v').snapshots(),
      builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              var output = snapshot.data!.data();
              var value = output!['Property_Details']['Firm'];
              return Text(('Value = $value'), style: TextStyle(
                          fontWeight:FontWeight.bold,
                          
                          fontSize: 20,
                          color: Colors.black,
                          
                        ),);
            }

            return Center(child: CircularProgressIndicator());
      },
),

                     
                     
                    
                     
                      
           
              
                        
                         

                          
              
                         
                 
                      
                      
                      
                      
                  
                        
                    ],
                  ),
                ),
               
              ],
            ),
        ),
        
        
        
        

         
         
      ),
    
  
),



       Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 60,onPressed: (){  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapApp(),
                    ),
                  );}, icon: Icon(Icons.location_on_outlined,color:Colors.black),)
  
        ],
       )
        ],
      ),
    ),);
   
        
   
    
  }
}