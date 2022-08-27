import 'package:authh_app/ui/add_property.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  final Stream<QuerySnapshot> property_main=FirebaseFirestore.instance.collection('property_main').snapshots();
  @override
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
      child: StreamBuilder<QuerySnapshot>(stream:property_main,builder:(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text(('Something went wrong'));
        }
         if(snapshot.connectionState==ConnectionState.waiting)
         {
          return Text("loading");
         }
         final data=snapshot.requireData;
         return ListView.builder(
          itemCount: data.size,
          itemBuilder: ((context, index) {
          return Card(
          shadowColor: Color.fromARGB(255, 180, 38, 236),
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
          child:
         new InkWell(
           onTap: () {
             print("Hello welocme to second page");
           },
           child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 29, 7, 7), Color.fromARGB(255, 233, 230, 230)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: EdgeInsets.all(16),
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
                  ('Property Name : ${data.docs[index]['Property_name']}'),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  
                ),
                Text(
                  ('Firm Name : ${data.docs[index]['Firm']}'),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  
                ),
                Text(
                  ('Tenant Name : ${data.docs[index]['Tenant']}'),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  
                ),
                Text(
                  ('Carpet_Area : ${data.docs[index]['Carpet_Area']}'),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  
                ),
                Text(
                  ('Yield : ${data.docs[index]['Yield']}'),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                // Row(
                //   children: [
                //        new Image.asset('assets/images/avatar.png'),
                //   ],
                // )

                  
              ],
            ),
        ),
         ),
          );

















            // return Text(('Property Name : ${data.docs[index]['Property_name']}'));
          //  return Container(
            
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
               
          //       Text(('Property Name : ${data.docs[index]['Property_name']}')),
          //       Text(('Carpet_Area in sq.ft : ${data.docs[index]['Carpet_Area']}')),
          //       Text(('Firm Name : ${data.docs[index]['Firm']}')),
          //       Text(('Floor No : ${data.docs[index]['Floor']}')),
          //       Text(('Tenant Name : ${data.docs[index]['Tenant']}')),
          //       Text(('Yield Rate : ${data.docs[index]['Yield']}')),
                
          //     ],
          //   ),
          //  );
           
         }));
                 
      }),
        
    // );
    


          
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
        backgroundColor: Colors.blue,
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