import 'package:authh_app/ui/agreement_details.dart';
// import 'package:authh_app/ui/tenant.dart';
import 'package:authh_app/ui/tenant_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'details_view.dart';

class  Rent_Details extends StatefulWidget {
  const Rent_Details({ Key? key }) : super(key: key);

  @override
  State<Rent_Details> createState() => _Rent_DetailsState();
}

class _Rent_DetailsState extends State<Rent_Details> {
    CollectionReference property_main=FirebaseFirestore.instance.collection("property_main");
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

  @override
  Widget build(BuildContext context) {
     final Stream<QuerySnapshot> property_main=FirebaseFirestore.instance.collection('property_main').snapshots();

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
    //  final data=snapshot.requireData;
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
      body: Column(
        children: [
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
             Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _Paidon,
              decoration: InputDecoration(
                  hintText: "in sq.ft",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Paid On",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),
            Column(
              children:  <Widget>[
            // Text("${selectedDate.toLocal()}".split(' ')[0]),
            SizedBox(height: 20.0,),
            IconButton(
              onPressed: () => _selectDate(context),
              icon: Icon(Icons.calendar_month_rounded),
            ),
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
                        
                 
                          
                          
                      
                            
                        ],
                      ),
                    ),
                   
                  ],
                ),
            ),
            
            
            
            

             
             
          ), 
          ),
          SizedBox(height:30),
           Table(  
                    defaultColumnWidth: FixedColumnWidth(120.0),  
                    border: TableBorder.all(  
                        color: Colors.black,  
                        style: BorderStyle.solid,  
                        width: 2),  
                    children: [  
                      TableRow( children: [  
                        Column(children:[Text('Month', style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text('Paid On', style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text('Amount', style: TextStyle(fontSize: 20.0))]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[Text('Sept')]),  
                        Column(children:[Text('5-Sept-2020')]),  
                        Column(children:[Text('25000')]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[Text('Aug')]),  
                        Column(children:[Text('6-Aug-2020')]),  
                        Column(children:[Text('51000')]),  
                      ]),  
                     
                    ],  
                  ),  
                
        ],
      )


      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      ,),
    
      
      
      
      );
      
      
  }
}