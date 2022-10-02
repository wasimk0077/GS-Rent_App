import 'package:authh_app/ui/agreement_details.dart';
// import 'package:authh_app/ui/tenant.dart';
import 'package:authh_app/ui/tenant_details.dart';
import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'details_view.dart';

class  Rent_Details extends StatefulWidget {
  // const Rent_Details({ Key? key }) : super(key: key);
  final String docID;
  //if you have multiple values add here
Rent_Details(this.docID,{Key? key}): super(key: key);

  @override
  State<Rent_Details> createState() => _Rent_DetailsState();
}

class _Rent_DetailsState extends State<Rent_Details> {

  // void fun() {
  //     FirebaseFirestore.instance
  //         .collection('property_main')
  //         .doc('ZwhIFHm0p8w1NYBtPj6L')
  //         .set({
  //       'Rent_Details': {
  //         year: {month: rent}
  //       }
  //     }, SetOptions(merge: true));
  //   }
     launchURL() async {
      const url = 'https://www.billdesk.com/pgidsk/pgmerc/jvvnljp/JVVNLJPDetails.jsp';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }

      FlutterClipboard.copy('hello flutter friends')
          .then((value) => print('copied'));
    }

  Map<int,String> months={
    01:"Jan",
    02:"Feb",
    03:"Mar",
    04:"Apr",
    05:"May",
    06:"Jun",
    07:"Jul",
    08:"Aug",
    09:"Sept",
    10:"Oct",
    11:"Nov",
    12:"Dec" };
   
    
 DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

    DocumentReference property_main=FirebaseFirestore.instance.collection("property_main").doc("5hmJ6rNaRf92Lt8KyB6v");
    TextEditingController _RentPaid = TextEditingController();
  TextEditingController _Paidon = TextEditingController();
  TextEditingController _Security_Deposit = TextEditingController();
  TextEditingController _Rent_Escalation = TextEditingController();
  
  // var collection = FirebaseFirestore.instance.collection('property_main');
  launchWhatsApp() async {
  final link = WhatsAppUnilink(
    phoneNumber: '+91-8790337204',
    text: "Hey! I'm inquiring about the apartment listing",
  );
  await launch('$link');
}

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
  String rent_paid="";
  String rent="dummy";
  funq() async {
    var name;
    var cur_month_str;
    var collection = FirebaseFirestore.instance.collection('property_main');
    var docSnapshot = await collection.doc(widget.docID).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      rent = data['Property_Details']['Rent'];
      print(rent);
      DateTime now = new DateTime.now();
      var cur_year = now.year.toString();
      var cur_month_int = now.month.toString();
      
      rent_paid = data['Rent_Details'][cur_year][cur_month_int]["Rent_Paid"];
      print(rent_paid);
    }
  }

   void initState()  {
    // TODO: implement initState
    ()async{
      await funq();
      setState(() {
      
      funq();
    });
    }();
   
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    //  final Stream<QuerySnapshot> property_main=FirebaseFirestore.instance.collection('property_main').snapshots();

    
    //  final data=snapshot.requireData;
     final ButtonStyle style = TextButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return DefaultTabController(length: 5, child: Scaffold(
      
      body: Column(
        children: [
          SizedBox(height: 60,),
          Container(
            child:Card(
            
                
            
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [ Text("Fixed Rent:",style: TextStyle(
                  fontSize: 18
                ),),
                Text(rent,style: TextStyle(
                  fontSize: 18
                ),),
                ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [ Text("Rent Paid till now:",style: TextStyle(
                  fontSize: 18
                ),),
                Text(rent_paid,style: TextStyle(
                  fontSize: 18
                ),),
                ],
                          ),
                           Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _RentPaid,
              decoration: InputDecoration(
                  hintText: "in sq.ft",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "REnt_Paid",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),
             
            Column(
              children:  <Widget>[
            // Text("${selectedDate.toLocal()}".split(' ')[0]),
            SizedBox(height: 20.0,),
            Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Row(
                    children: [
                      Text(
                        ('Paid On'),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _selectDate(context),
                        icon: Icon(Icons.calendar_month_rounded),
                      ),
                      Text("${selectedDate.toLocal()}".split(' ')[0]),
                    ],
                  )),
            
          ],
            ),
             Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _Security_Deposit,
              decoration: InputDecoration(
                  hintText: "in sq.ft",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Due Date",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),
           
             IconButton(
              onPressed: () => launchWhatsApp(),
              icon: Icon(Icons.whatsapp),
            ),
            Container(
              
                    margin: EdgeInsets.only(right: 30),
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((15.0)),
                        color: Colors.blueAccent),
                    child: MaterialButton(
                      onPressed: (){
                        if((rent_paid=="")){
                          {
                            print("rent is correct");
                            FirebaseFirestore.instance.collection('property_main').doc(widget.docID).set(
    {'Rent_Details':{
                             ("${selectedDate.toLocal()}".split(' ')[0]).toString().substring(0,4):{
                              (int.parse(("${selectedDate.toLocal()}".split(' ')[0]).toString().substring(5,7))).toString():{
                            'Rent_Paid':_RentPaid.text,
                            'Paid_on':"${selectedDate.toLocal()}".split(' ')[0],
                             }
                             }
                            }}, SetOptions(merge: true)
                            );};
                        
          //               
                        }
                        
                        else{
                          {
                          {
                            print("rent is correct");
                            FirebaseFirestore.instance.collection('property_main').doc(widget.docID).set(
    {'Rent_Details':{
                             ("${selectedDate.toLocal()}".split(' ')[0]).toString().substring(0,4):{
                             (int.parse(("${selectedDate.toLocal()}".split(' ')[0]).toString().substring(5,7))).toString():{
                            'Rent_Paid':(int.parse(_RentPaid.text)+int.parse(rent_paid)).toString(),
                            'Paid_on':"${selectedDate.toLocal()}".split(' ')[0],
                             }
                             }
                            }}, SetOptions(merge: true)
                            );};
                        
          //            
                      
                        }

                        }
                      },
                      child: Text("Update"),
                      textColor: Colors.white,
                    ),
                  ),
                  Container(
              
                    margin: EdgeInsets.only(right: 30),
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((15.0)),
                        color: Colors.blueAccent),
                    child: MaterialButton(
                      onPressed:  launchURL, 
                      child: Text("KNUMBER"),
                      textColor: Colors.white,
                    ),
                  ),
                        
                 
                          
                          
                      
                            
                        ],
                      ),
                    ),
                   
                  ],
                ),
            ),
            
            
            
            

             
             
          ), 
          ),
          SizedBox(height:30),
          //  Table(  
          //           defaultColumnWidth: FixedColumnWidth(120.0),  
          //           border: TableBorder.all(  
          //               color: Colors.black,  
          //               style: BorderStyle.solid,  
          //               width: 2),  
          //           children: [  
          //             TableRow( children: [  
          //               Column(children:[Text('Month', style: TextStyle(fontSize: 20.0))]),  
          //               Column(children:[Text('Paid On', style: TextStyle(fontSize: 20.0))]),  
          //               Column(children:[Text('Amount', style: TextStyle(fontSize: 20.0))]),  
          //             ]),  
          //             TableRow( children: [  
          //               Column(children:[Text('Sept')]),  
          //               Column(children:[Text('5-Sept-2020')]),  
          //               Column(children:[Text('25000')]),  
          //             ]),  
          //             TableRow( children: [  
          //               Column(children:[Text('Aug')]),  
          //               Column(children:[Text('6-Aug-2020')]),  
          //               Column(children:[Text('51000')]),  
          //             ]),  
                     
          //           ],  
          //         ),  
                
        ],
      )


      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItems,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        //type: BottomNavigationBarType.fixed,
      ),),
    
      
      
      
      );
      
      
  }
}
// class Vaccination {
//   // 1
//   final String vaccination;
//   final DateTime date;
//   bool? done;
//   // 2
//   Vaccination(this.vaccination,
//       {required this.date, this.done});
//   // 3
//   factory Vaccination.fromJson(Map<String, dynamic> json) =>
//       _vaccinationFromJson(json);
//   // 4
//   Map<String, dynamic> toJson() => _vaccinationToJson(this);

//   @override
//   String toString() => 'Vaccination<$vaccination>';
// }// 1
// Vaccination _vaccinationFromJson(Map<String, dynamic> json) {
//   return Vaccination(
//     json['vaccination'] as String,
//     date: (json['date'] as Timestamp).toDate(),
//     done: json['done'] as bool,
//   );
// }
// // 2
// Map<String, dynamic> _vaccinationToJson(Vaccination instance) =>
//     <String, dynamic>{
//       'vaccination': instance.vaccination,
//       'date': instance.date,
//       'done': instance.done,
//     };
class RentDetails {
  final int Paid;
  final DateTime Paid_on;
  // final String cityName;

  RentDetails(
      {required this.Paid,
      required this.Paid_on,
      });

  // Map<String, dynamic> toMap(RentDetails instance) {
  //   return {
  //     'Paid': instance.Paid,
  //     'Paid_on': instance.Paid_on,
  //     // 'cityName': cityName,
  //   };
  // }
    factory RentDetails.fromJson(Map<String, dynamic> json) =>
      _fromMap(json);
  // 4
  Map<String, dynamic> toJson() => _toMap(this);
}
Map<String, dynamic> _toMap(RentDetails instance) =>
    <String, dynamic>{
      'Paid': instance.Paid,
      'Paid_on': instance.Paid_on,
      // 'done': instance.done,
    };

  RentDetails _fromMap(Map<String, dynamic> json)
      { 
    return RentDetails(
    
    Paid:json['Paid'],
    Paid_on: (json['Paid_on'] as Timestamp).toDate(),
  );
    
  
        // cityName = addressMap["cityName"];
}