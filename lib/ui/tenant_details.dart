import 'package:authh_app/ui/details_view.dart';
import 'package:authh_app/ui/rent_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'agreement_details.dart';

class TenantDetails extends StatefulWidget {
  const TenantDetails({Key? key}) : super(key: key);

  @override
  State<TenantDetails> createState() => _TenantDetailsState();
}

class _TenantDetailsState extends State<TenantDetails> {
  var collection = FirebaseFirestore.instance.collection('property_main');

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
            onPressed: () {},
            child: const Text('Others'),
          ),
        ],
      // title:Text("navbar"),
      ),
      body: Column(
        children: [
          Container(
            child: Card(
              // shadowColor: Color.fromARGB(255, 180, 38, 236),
              elevation: 8,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(18, 113, 125, 137)),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 80),
                          Text(
                            ('Tenant Details'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection
                                .doc('5hmJ6rNaRf92Lt8KyB6v')
                                .snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');
                              var output = snapshot.data!.data();
                              // if(output!['Firm_Details']['check'] == false){
                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value =
                                    output!['Tenant_Details']['Tenant_name'];
                                return Text(
                                  ('Tenant name= $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                );
                              }
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection
                                .doc('5hmJ6rNaRf92Lt8KyB6v')
                                .snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');
                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value =
                                    output!['Tenant_Details']['address'];
                                return Text(
                                  ('Address= $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                );
                              }
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection
                                .doc('5hmJ6rNaRf92Lt8KyB6v')
                                .snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');
                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value = output!['Tenant_Details']['email'];
                                return Text(
                                  ('Email= $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                );
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection
                                .doc('5hmJ6rNaRf92Lt8KyB6v')
                                .snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');

                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value =
                                    output!['Tenant_Details']['address'];
                                return Text(
                                  ('Address = $value'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                );
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
          SizedBox(height: 50),
          Container(
            child: Card(
              // shadowColor: Color.fromARGB(255, 180, 38, 236),
              elevation: 8,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(18, 113, 125, 137)),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ('Firm Details'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection
                                .doc('5hmJ6rNaRf92Lt8KyB6v')
                                .snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');
                              var output = snapshot.data!.data();
                              // if(output!['Firm_Details']['check'] == false){
                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value = output!['Firm_Details']['check'];
                                if (value == false) {
                                  return Text(
                                    ('NO firm details to display'),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  );
                                }
                              }
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection
                                .doc('5hmJ6rNaRf92Lt8KyB6v')
                                .snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');
                              var output = snapshot.data!.data();
                              // if(output!['Firm_Details']['check'] == false){
                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value =
                                    output!['Firm_Details']['Firm_name'];
                                if (value == "") {
                                  return Text(
                                    ('Firm name= -'),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    ('Firm name= $value'),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  );
                                }
                              }
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection
                                .doc('5hmJ6rNaRf92Lt8KyB6v')
                                .snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');
                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value = output!['Firm_Details']['GST'];

                                if (value == "") {
                                  return Text(
                                    ('GST= -'),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    ('GST= $value'),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  );
                                }
                              }
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            stream: collection
                                .doc('5hmJ6rNaRf92Lt8KyB6v')
                                .snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error = ${snapshot.error}');

                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var value = output!['Firm_Details']['Docs'];
                                if (value == "") {
                                  return Text(
                                    ('Docs= -'),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    ('Docs= $value'),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  );
                                }
                              }
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
  )
     );  
  
  
  
  }
}