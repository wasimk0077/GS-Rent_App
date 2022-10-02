

import 'package:authh_app/ui/details_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateAgreementViews extends StatefulWidget {
  // const UpdateDetailsViews({Key? key}) : super(key: key);
  final String docID;//if you have multiple values add here
  UpdateAgreementViews(this.docID, {Key? key}): super(key: key);

  @override
  State<UpdateAgreementViews> createState() => _UpdateAgreementViewsState();
}

class _UpdateAgreementViewsState extends State<UpdateAgreementViews> {
  TextEditingController _Start_Date = TextEditingController();
  TextEditingController _End_Date = TextEditingController();
  TextEditingController _Rent_Escalation = TextEditingController();
  TextEditingController _Security__Deposit= TextEditingController();

  DateTime selectedDate = DateTime.now();
DateTime selectedDate2 = DateTime.now();



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

Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
      });
      if (check_date() == false) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text("Date Error"),
                content: Text('Start date should be less than end date'),
                actions: <Widget>[
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ));
    }
  }
bool check_date() {
    int year1 = selectedDate.year;
    int year2 = selectedDate2.year;
    int month1 = selectedDate.month;
    int month2 = selectedDate2.month;
    int day1 = selectedDate.day;
    int day2 = selectedDate2.day;
    if (year1 > year2)
      return false;
    else if (year1 < year2)
      return true;
    else {
      if (month1 > month2)
        return false;
      else if (month1 < month2)
        return true;
      else {
        if (day1 < day2)
          return true;
        else
          return false;
      }
    }
  }



 
  

  @override
  Widget build(BuildContext context) {
     CollectionReference property_main=FirebaseFirestore.instance.collection("property_main");
    
    return Scaffold(
      body: Container(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:30.0),child: new SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            
            // SizedBox(height: 60),

            
            SizedBox(height: 85),
            Text(
                            ('Update Agreement View'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
            
            Column(


              
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                   
                   Container(
              width: MediaQuery.of(context).size.width/1.3,
              child:
              Row(children: [
                Text(
                            ('Start Date'),
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
              
                
              ],)),
Container(
              width: MediaQuery.of(context).size.width/1.3,
              child:Row(children: [
                Text(
                            ('End Date'),
                            style: TextStyle(
                              
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ), 
                IconButton(
              onPressed: () => _selectDate2(context),
              icon: Icon(Icons.calendar_month_rounded),
            ),
             Text("${selectedDate2.toLocal()}".split(' ')[0]),
              
                
              ],)),

Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _Rent_Escalation,
              decoration: InputDecoration(
                  hintText: "Firm name",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Firm name",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),

Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextFormField(
              
              style: TextStyle(color: Colors.black),
              controller: _Security__Deposit,
              decoration: InputDecoration(
                  hintText: "Tenant name",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Tenant name",
                  labelStyle: TextStyle(color: Colors.black)),
            ),),


               

              ],
            ),
            
            MaterialButton(
                    onPressed: (() {
                      final DocUser=property_main.doc(widget.docID);
                      // print(_Tenant_name.text);
                      DocUser.update({
                        'Property_Details.Property_name':("${selectedDate.toLocal()}".split(' ')[0]).toString(),
                        'Property_Details.Floor':"${selectedDate2.toLocal()}".split(' ')[0].toString(),
                        'Property_Details.Firm':_Rent_Escalation.text.toString(),
                        'Property_Details.Tenant':_Security__Deposit.text.toString(),
                        
                      });
                      Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsView(widget.docID),
                      ),
                    );
                    
                    
                    }
                    
                    ),
                    
                    child: Text("update"),
                    textColor:Colors.black,
                  ),
            
            
            
          ]
        ),
        )
        )
      )
    );
    }}