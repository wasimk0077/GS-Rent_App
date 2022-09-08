



import 'package:authh_app/ui/location.dart';
import 'package:authh_app/ui/rent_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'details_view.dart';

class AgreementDetails extends StatefulWidget {
  const AgreementDetails({ Key? key }) : super(key: key);

  @override
  State<AgreementDetails> createState() => _AgreementDetailsState();
}

class _AgreementDetailsState extends State<AgreementDetails> {
  var collection = FirebaseFirestore.instance.collection('property_main');
  final List<String> imageList = ["https://firebasestorage.googleapis.com/v0/b/authentiicate.appspot.com/o/null.png?alt=media&token=60e5fb2c-fb17-4fa9-b0c4-791ce5daba8d",
  'https://firebasestorage.googleapis.com/v0/b/authentiicate.appspot.com/o/images?alt=media&token=567d3634-0325-413b-a67e-714ffabeaf73',
];
 
  
  @override
  Widget build(BuildContext context) {
   final ButtonStyle style = TextButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
    );
     return DefaultTabController(length: 5, child: Scaffold(
      appBar:AppBar(
        leading:null,
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
            onPressed: () {
              
            },
            child: const Text('Others'),
          ),
        ],
      // title:Text("navbar"),
      ),
      body: Column(
        children: [
          Container(
            height: 170,
            
            child: Card(
            
                
            
              // shadowColor: Color.fromARGB(255, 180, 38, 236),
            elevation: 8,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
              child:
             
             
            
               
                Container(
                
                decoration: BoxDecoration(
                 color: Color.fromARGB(18, 113, 125, 137)
                ),
                padding: EdgeInsets.all(10),
                child: Row(

                  children: [
                    
                    SizedBox(

                      width: 200,
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           
                        Text(('Agreement Details'),
                        
                        textAlign:TextAlign.center,
                         style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),),
                          SizedBox(height: 8),
                            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: collection.doc('5hmJ6rNaRf92Lt8KyB6v').snapshots(),
          builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  var output = snapshot.data!.data();
                  var value = output!['Agreement_Details']['Start_Date'];
                  return Text(('Start Date= $value'), style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 17,
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
                  var value = output!['Agreement_Details']['End_Date'];
                  return Text(('End Date= $value'), style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 17,
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
                  var value = output!['Agreement_Details']['Security_Deposit'];
                  return Text(('Security Deposit= $value'), style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 17,
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
                  var value = output!['Agreement_Details']['Rent_Escalation'];
                  return Text(('Rent Escalation = $value'), style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 17,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(('Photos'),
                    
                    textAlign:TextAlign.center,
                     style: TextStyle(
                          fontWeight:FontWeight.bold,
                          
                          fontSize: 20,
                          color: Colors.black,
                          
                        ),),
          ],
          ),
           Row(
          mainAxisAlignment: MainAxisAlignment.start,
          
          
          children: [
            Text(('Before'),
                    
                    textAlign:TextAlign.center,
                     style: TextStyle(
                          fontWeight:FontWeight.bold,
                          
                          fontSize: 20,
                          color: Colors.black,
                          
                        ),),
          ],
          ),
        Container(
  margin: EdgeInsets.all(10),
  child: CarouselSlider.builder(
    itemCount: imageList.length,
    options: CarouselOptions(
          enlargeCenterPage: true,
          height: 170,
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
                width: 300,
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
            Row(
          mainAxisAlignment: MainAxisAlignment.start,
          
          
          children: [
            Text(('After'),
                    
                    textAlign:TextAlign.center,
                     style: TextStyle(
                          fontWeight:FontWeight.bold,
                          
                          fontSize: 20,
                          color: Colors.black,
                          
                        ),),
          ],
          ),
        Container(
  margin: EdgeInsets.all(10),
  child: CarouselSlider.builder(
    itemCount: imageList.length,
    options: CarouselOptions(
          enlargeCenterPage: true,
          height: 170,
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
                width: 300,
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
        
             
        
        
        
        
        
        
        
        
        
        ],
        
      ),
     )
     );
    



    
  }
  
  }