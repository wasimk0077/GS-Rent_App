




import 'package:authh_app/ui/agreement_details.dart';
import 'package:authh_app/ui/home_view.dart';
import 'package:authh_app/ui/rentTable.dart';
// import 'package:authh_app/ui/tenant.dart';
import 'package:authh_app/ui/tenant_details.dart';
import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_file/open_file.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'details_view.dart';

class Rent_Details extends StatefulWidget {
  // const Rent_Details({ Key? key }) : super(key: key);
  final String docID;
  //if you have multiple values add here
  Rent_Details(this.docID, {Key? key}) : super(key: key);

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
  String Knumber="";
  launchURL() async {
      var collection = FirebaseFirestore.instance.collection('property_main');
    var docSnapshot = await collection.doc(widget.docID).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      Knumber= data['Property_Details']['KNUMBER'];
    }

    const url =
        'https://www.billdesk.com/pgidsk/pgmerc/jvvnljp/JVVNLJPDetails.jsp';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }

    FlutterClipboard.copy(Knumber)
        .then((value) => print('copied'));
  }

  Map<int, String> months = {
    01: "Jan",
    02: "Feb",
    03: "Mar",
    04: "Apr",
    05: "May",
    06: "Jun",
    07: "Jul",
    08: "Aug",
    09: "Sept",
    10: "Oct",
    11: "Nov",
    12: "Dec"
  };

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

  DocumentReference property_main = FirebaseFirestore.instance
      .collection("property_main")
      .doc("5hmJ6rNaRf92Lt8KyB6v");
  TextEditingController _RentPaid = TextEditingController();
  TextEditingController _Paidon = TextEditingController();
  TextEditingController _Security_Deposit = TextEditingController();
  TextEditingController _Rent_Escalation = TextEditingController();
  TextEditingController _Change_Amount = TextEditingController();

  // var collection = FirebaseFirestore.instance.collection('property_main');
    String TenantMobileNumber="";
  String TenantName="";

  launchWhatsApp() async {

      var collection = FirebaseFirestore.instance.collection('property_main');
    var docSnapshot = await collection.doc(widget.docID).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      TenantMobileNumber= data['Tenant_Details']['mobile'];
      TenantName= data['Tenant_Details']['Tenant_name'];}
    final link = WhatsAppUnilink(
      phoneNumber: TenantMobileNumber,
      text: "Hey!$TenantName I'm inquiring about the apartment listing",
    );
    await launch('$link');
  }

  int _currentIndex = 0;

  final _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.star, color: Colors.blue), label: "1"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.star, color: Colors.green), label: "2"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.star, color: Colors.pink), label: "3"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.star, color: Colors.red), label: "4"),
  ];
  String rent_paid = "";
  String rent = "";
  bool? value = false;
  bool rent_status = false;
  int recent_rent_paid = 0;
  bool show_change = false;
  int recent_from_db = 0;
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
      rent_status = data['Rent_Details'][cur_year][cur_month_int]["status"];
      rent_paid = data['Rent_Details'][cur_year][cur_month_int]["Rent_Paid"];
      recent_rent_paid = int.parse(rent_paid);
      recent_from_db = int.parse(
          data['Rent_Details'][cur_year][cur_month_int]["Recent_amount"]);
      print(rent_paid);
    }
  }
  String jan="";
  String janRent="";

  String feb="";
  String febRent="";
  String mar="";
  String marRent="";
  String apr="";
  String aprRent="";
  String may="";
  String mayRent="";
  String jun="";
  String junRent="";
  String jul="";
  String julRent="";
  String aug="";
  String augRent="";
  String sept="";
  String septRent="";
  String oct="";
  String octRent="";
  String nov="";
  String novRent="";
  String dec="";
  String decRent="";

  pdf(String year) async{
         var collection = FirebaseFirestore.instance.collection('property_main');
    var docSnapshot = await collection.doc(widget.docID).get();
     if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      if(data['Rent_Details'][year]["1"]!=null)
      {
               jan=data['Rent_Details'][year]["1"]["Rent_Paid"];
               janRent=data['Rent_Details'][year]["1"]["Paid_on"];
      }
      if(data['Rent_Details'][year]["2"]!=null)
      {
               feb=data['Rent_Details'][year]["2"]["Rent_Paid"];
               febRent=data['Rent_Details'][year]["2"]["Paid_on"];
      }
      if(data['Rent_Details'][year]["3"]!=null)
      {
               mar=data['Rent_Details'][year]["3"]["Rent_Paid"];
               marRent=data['Rent_Details'][year]["3"]["Paid_on"];
      }
      if(data['Rent_Details'][year]["4"]!=null)
      {
               apr=data['Rent_Details'][year]["4"]["Rent_Paid"];
               aprRent=data['Rent_Details'][year]["4"]["Paid_on"];
      }
      if(data['Rent_Details'][year]["5"]!=null)
      {
               may=data['Rent_Details'][year]["5"]["Rent_Paid"];
               mayRent=data['Rent_Details'][year]["5"]["Paid_on"];
      }
      
      if(data['Rent_Details'][year]["6"]!=null)
      {
               jun=data['Rent_Details'][year]["6"]["Rent_Paid"];
               junRent=data['Rent_Details'][year]["6"]["Paid_on"];
      }
      if(data['Rent_Details'][year]["7"]!=null)
      {
               jul=data['Rent_Details'][year]["7"]["Rent_Paid"];
               julRent=data['Rent_Details'][year]["7"]["Paid_on"];
      }
      if(data['Rent_Details'][year]["8"]!=null)
      {
               aug=data['Rent_Details'][year]["8"]["Rent_Paid"];
               augRent=data['Rent_Details'][year]["8"]["Paid_on"];
      }
      if(data['Rent_Details'][year]["9"]!=null)
      {
               sept=data['Rent_Details'][year]["9"]["Rent_Paid"];
               septRent=data['Rent_Details'][year]["9"]["Paid_on"];
               print(sept);
      }
      if(data['Rent_Details'][year]["10"]!=null)
      {
               oct=data['Rent_Details'][year]["10"]["Rent_Paid"];
               octRent=data['Rent_Details'][year]["10"]["Paid_on"];
               print(oct);
      }
      if(data['Rent_Details'][year]["11"]!=null)
      {
               nov=data['Rent_Details'][year]["11"]["Rent_Paid"];
               novRent=data['Rent_Details'][year]["11"]["Paid_on"];
      }
      if(data['Rent_Details'][year]["12"]!=null)
      {
               dec=data['Rent_Details'][year]["12"]["Rent_Paid"];
               decRent=data['Rent_Details'][year]["12"]["Paid_on"];
      }
    }

  }
late pdfdocs pdfdoc;
TextEditingController _year = TextEditingController();

  void initState() {
    // TODO: implement initState
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
    //  final Stream<QuerySnapshot> property_main=FirebaseFirestore.instance.collection('property_main').snapshots();

    //  final data=snapshot.requireData;
    final ButtonStyle style = TextButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF000000),
        body:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Container(
                child: Card(
                  // shadowColor: Color.fromARGB(255, 180, 38, 236),
                  color: Color(0xFF1E1E1E) ,
                  elevation: 8,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Color.fromARGB(18, 113, 125, 137)),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Fixed Rent: ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              rent,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Rent Paid till now: ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              recent_rent_paid.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: _RentPaid,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              // hintText: "in sq.ft",
                              // hintStyle: TextStyle(color: Colors.white),
                              labelText: "Amount",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Row(
                          children: [
                            Text(
                              ('Paid On'),
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () => _selectDate(context),
                              icon: Icon(
                                Icons.calendar_month_rounded,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            //SizedBox
                            Text(
                              'Is the rent completely paid',
                              style: TextStyle(
                                fontSize: 19.0,
                                color: Colors.white,
                              ),
                            ), //Text //SizedBox
                            /* Checkbox Widget */
                            Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Colors.white,
                              ),
                              child: Checkbox(
                                checkColor: Colors.blue, // color of tick Mark
                                activeColor: Colors.white,
                                value: this.value,
                                onChanged: (bool? value) {
                                  setState(() {
                                    this.value = value;
                                  });
                                  print('changet to $value');
                                },
                              ), //Checkbox
                            ),
                          ], //<Widget>[]
                        ),
                        // Container(
                        //   child: TextFormField(
                        //     style: TextStyle(color: Colors.white),
                        //     controller: _Security_Deposit,
                        //     decoration: InputDecoration(
                        //         hintText: "in sq.ft",
                        //         hintStyle: TextStyle(color: Colors.white),
                        //         labelText: "Due Date",
                        //         labelStyle: TextStyle(color: Colors.white)),
                        //   ),
                        // ),
                        Row(
                          children: [
                            Text("Due date is 10th of this month",
                            style:TextStyle(
                              fontSize: 19,
                              color: Colors.white
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Notify user about rent',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
                            IconButton(
                              onPressed: () => launchWhatsApp(),
                              icon: Icon(
                                Icons.whatsapp,
                                color: Colors.green,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.height / 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular((15.0)),
                              color: Colors.blueAccent),
                          child: MaterialButton(
                            onPressed: () {
                              if (int.parse(rent_paid) +
                                      int.parse(_RentPaid.text) >
                                  int.parse(rent)) {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: const Text("Rent Error"),
                                          content: Text(
                                              'Total rent paid should be less than the actual rent of the property.Please select the correct rent to be paid'),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text("OK"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        ));
                              } else {
                                if ((rent_paid == "")) {
                                  {
                                    setState(() {
                                      recent_rent_paid =
                                          int.parse(_RentPaid.text);
                                    });
                                    print("rent is correct");
                                    FirebaseFirestore.instance
                                        .collection('property_main')
                                        .doc(widget.docID)
                                        .set({
                                      'Rent_Details': {
                                        ("${selectedDate.toLocal()}"
                                                .split(' ')[0])
                                            .toString()
                                            .substring(0, 4): {
                                          (int.parse(
                                                  ("${selectedDate.toLocal()}"
                                                          .split(' ')[0])
                                                      .toString()
                                                      .substring(5, 7)))
                                              .toString(): {
                                            'Rent_Paid': _RentPaid.text,
                                            'Paid_on':
                                                "${selectedDate.toLocal()}"
                                                    .split(' ')[0],
                                            'status': value,
                                            'Recent_amount': _RentPaid.text,
                                          }
                                        }
                                      }
                                    }, SetOptions(merge: true));
                                    Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeView(),
                          ),
                        );
                                  }
                                } else {
                                  {
                                    {
                                      setState(() {
                                        recent_rent_paid =
                                            int.parse(_RentPaid.text) +
                                                int.parse(rent_paid);
                                      });
                                      print("rent is correct");
                                      FirebaseFirestore.instance
                                          .collection('property_main')
                                          .doc(widget.docID)
                                          .set({
                                        'Rent_Details': {
                                          ("${selectedDate.toLocal()}"
                                                  .split(' ')[0])
                                              .toString()
                                              .substring(0, 4): {
                                            (int.parse(
                                                    ("${selectedDate.toLocal()}"
                                                            .split(' ')[0])
                                                        .toString()
                                                        .substring(5, 7)))
                                                .toString(): {
                                              'Rent_Paid':
                                                  (int.parse(_RentPaid.text) +
                                                          int.parse(rent_paid))
                                                      .toString(),
                                              'Paid_on':
                                                  "${selectedDate.toLocal()}"
                                                      .split(' ')[0],
                                              'status': value,
                                              'Recent_amount': _RentPaid.text,
                                            }
                                          }
                                        }
                                      }, SetOptions(merge: true));
                                      
                                    }
                                     Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeView(),
                          ),
                        );
                                    ;
                                  }
                                }
                              }
                            },
                            child: 
                            FittedBox(fit: BoxFit.contain,
                            child: Text("Update"),),
                            textColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.height / 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular((15.0)),
                              color: Colors.blueAccent),
                          child: MaterialButton(
                            onPressed: launchURL,
                            child: const FittedBox(
                              fit: BoxFit.contain,
                              child: Text("K Number"),
                            ),
                            textColor: Colors.white,
                          ),
                        ),
                        if (show_change == true) ...[
                          Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  controller: _Change_Amount,
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      // hintText: "in sq.ft",
                                      // hintStyle: TextStyle(color: Colors.white),
                                      labelText: "New amount",
                                      labelStyle:
                                          TextStyle(color: Colors.white)),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 30),
                                width: MediaQuery.of(context).size.width / 5,
                                height: MediaQuery.of(context).size.height / 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular((15.0)),
                                    color: Colors.blueAccent),
                                child: MaterialButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('property_main')
                                        .doc(widget.docID)
                                        .set({
                                      'Rent_Details': {
                                        ("${selectedDate.toLocal()}"
                                                .split(' ')[0])
                                            .toString()
                                            .substring(0, 4): {
                                          (int.parse(
                                                  ("${selectedDate.toLocal()}"
                                                          .split(' ')[0])
                                                      .toString()
                                                      .substring(5, 7)))
                                              .toString(): {
                                            'Rent_Paid': (int.parse(
                                                        _Change_Amount.text) +
                                                    recent_rent_paid -
                                                    recent_from_db)
                                                .toString(),
                                            'Paid_on':
                                                "${selectedDate.toLocal()}"
                                                    .split(' ')[0],
                                            'status': value,
                                            'Recent_amount':
                                                _Change_Amount.text,
                                          }
                                        }
                                      }
                                    }, SetOptions(merge: true));
                                    setState(() {
                                      recent_rent_paid =
                                          int.parse(_Change_Amount.text) +
                                              recent_rent_paid -
                                              recent_from_db;
                                    });
                                  },
                                  child: const FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text("Change"),
                                  ),
                                  textColor: Colors.white,
                                ),
                              ),
                              // MaterialButton(

                              //     onPressed: () {
                              //       FirebaseFirestore.instance
                              //           .collection('property_main')
                              //           .doc(widget.docID)
                              //           .set({
                              //         'Rent_Details': {
                              //           ("${selectedDate.toLocal()}"
                              //                   .split(' ')[0])
                              //               .toString()
                              //               .substring(0, 4): {
                              //             (int.parse(
                              //                     ("${selectedDate.toLocal()}"
                              //                             .split(' ')[0])
                              //                         .toString()
                              //                         .substring(5, 7)))
                              //                 .toString(): {
                              //               'Rent_Paid': (int.parse(
                              //                           _Change_Amount.text) +
                              //                       recent_rent_paid -
                              //                       recent_from_db)
                              //                   .toString(),
                              //               'Paid_on':
                              //                   "${selectedDate.toLocal()}"
                              //                       .split(' ')[0],
                              //               'status': value,
                              //               'Recent_amount':
                              //                   _Change_Amount.text,
                              //             }
                              //           }
                              //         }
                              //       }, SetOptions(merge: true));
                              //       setState(() {
                              //         recent_rent_paid =
                              //             int.parse(_Change_Amount.text) +
                              //                 recent_rent_paid -
                              //                 recent_from_db;
                              //       });
                              //     },
                              //     child: Text('Submit')),
                            ],
                          )
                        ],
                        if (show_change == false)
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  show_change = true;
                                });
                              },
                              child: Text('Change the recent paid amount')),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         show_change = true;
                        //       });
                        //     },
                        //     child: Text('Change')),
                      ],
                    ),
                  ),
                ),
              ),

              Column(
                children: [
                  Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _year,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: "YEAR",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "YEAR",
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: ()async {
                    setState(() {
                      pdf((_year.text).toString());
                      // second_done = true;
                      // agreemment_info=Agremeent_info(_AGR_City.text,_AGR_State.text,_Landlord_Name.text,_Landlord_Address.text,_Landlord_City.text,_Landlord_State.text,_Landlord_Address2.text,_Landlord_City2.text,_Landlord_State2.text,_Tenant_Name.text,_Tenant_Address.text,_Tenant_City.text,_Tenant_State.text,_Tenant_Address2.text,_Tenant_City2.text,_Tenant_State2.text,_Firm_Address.text,_Firm_City.text,_Firm_State.text,_Property_Address.text,_Property_City.text,_Property_State.text,_Bathroom.text,_Bedroom.text,_Carpark.text,_SquareFeet.text,_Rent_Value.text,_LockinPeriod.text,_Rent_Escalation.text,_Notice_Period.text,_Termination_Period.text,_K_Number.text,_Starting_Meter_Reading.text,_Witness1_Name.text,_Witness1_Address.text,_Witness1_City.text,_Witness1_State.text,_Witness2_Name.text,_Witness2_Address.text,_Witness2_City.text,_Witness2_State.text);
                    });
                    // agreemment_info=Agremeent_info(_AGR_City.text,_AGR_State.text,_Landlord_Name.text,_Landlord_Address.text,_Landlord_City.text,_Landlord_State.text,_Landlord_PinCode.text,_Landlord_Address2.text,_Landlord_City2.text,_Landlord_State2.text,_Landlord_PinCode2.text,_Tenant_Name.text,_Tenant_Address.text,_Tenant_City.text,_Tenant_State.text,_Tenant_PinCode.text,_Tenant_Address2.text,_Tenant_City2.text,_Tenant_State2.text,_Tenant_PinCode2.text,_Firm_Name.text,_GST_Number.text,_Firm_Address.text,_Firm_City.text,_Firm_State.text,_Firm_PinCode.text,_Property_Address.text,_Property_City.text,_Property_State.text,_Property_PinCode.text,_Bathroom.text,_Bedroom.text,_Carpark.text,_SquareFeet.text,_Rent_Value.text,_LockinPeriod.text,_Rent_Escalation.text,_Notice_Period.text,_Termination_Period.text,_K_Number.text,_Starting_Meter_Reading.text,_Witness1_Name.text,_Witness1_Address.text,_Witness1_City.text,_Witness1_State.text,_Witness2_Name.text,_Witness2_Address.text,_Witness2_City.text,_Witness2_State.text,_Item1.text,_Item2.text,_Item3.text,"${selectedDate.toLocal()}".split(' ')[0],"${selectedDate2.toLocal()}".split(' ')[0],dropdownvalue!);
                    // pdf(_year.text);
                    print("ggggggggggg");
                    print(sept);
                    print(oct);

                    pdfdoc=pdfdocs(jan, feb, mar, apr, may, jun, jul, aug, sept, oct, nov, dec,janRent,febRent,marRent,aprRent,mayRent,junRent,julRent,augRent,septRent,octRent,novRent,decRent);
                   final pdfFile2 =await  RentPdfInvoiceApi.generate(pdfdoc: pdfdoc,
   
                   );

                // opening the pdf file
                //  OpenFile.open(pdfFile2.path);
                FileHandleApi.openFile(pdfFile2);

                    
                  },
                  child: Text('SUBMIT'))
                
                ],
              )

            ],
          ),
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
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: _currentIndex,
          //   items: _bottomNavigationBarItems,
          //   onTap: (index) {
          //     setState(() {
          //       _currentIndex = index;
          //     });
          //   },
          //   //type: BottomNavigationBarType.fixed,
          // ),
         ));
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

  RentDetails({
    required this.Paid,
    required this.Paid_on,
  });

  // Map<String, dynamic> toMap(RentDetails instance) {
  //   return {
  //     'Paid': instance.Paid,
  //     'Paid_on': instance.Paid_on,
  //     // 'cityName': cityName,
  //   };
  // }
  factory RentDetails.fromJson(Map<String, dynamic> json) => _fromMap(json);
  // 4
  Map<String, dynamic> toJson() => _toMap(this);
}

Map<String, dynamic> _toMap(RentDetails instance) => <String, dynamic>{
      'Paid': instance.Paid,
      'Paid_on': instance.Paid_on,
      // 'done': instance.done,
    };

RentDetails _fromMap(Map<String, dynamic> json) {
  return RentDetails(
    Paid: json['Paid'],
    Paid_on: (json['Paid_on'] as Timestamp).toDate(),
  );

  // cityName = addressMap["cityName"];
}class pdfdocs{

final String jan;
final String feb;
final String mar;
final String apr;
final String may;
final String jun;
final String jul;
final String aug;
final String sept;
final String oct;
final String nov;
final String dec;
final String janRent;
final String febRent;
final String marRent;
final String aprRent;
final String mayRent;
final String junRent;
final String julRent;
final String augRent;
final String septRent;
final String octRent;
final String novRent;
final String decRent;
pdfdocs(this.jan,this.feb,this.mar,this.apr,this.may,this.jun,this.jul,this.aug,this.sept,this.oct,this.nov,this.dec ,this.janRent,this.febRent,this.marRent,this.aprRent,this.mayRent,this.junRent,this.julRent,this.augRent,this.septRent,this.octRent,this.novRent,this.decRent,);
}