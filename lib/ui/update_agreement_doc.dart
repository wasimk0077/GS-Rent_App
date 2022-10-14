


import 'package:authh_app/ui/pdf_invoice_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class UpdatAgreementDoc extends StatefulWidget {
  //if you have multiple values add here
UpdatAgreementDoc({Key? key}): super(key: key);

  @override
  State<UpdatAgreementDoc> createState() => _UpdatAgreementDocState();
}

class _UpdatAgreementDocState extends State<UpdatAgreementDoc> {
   bool? value = false;
    bool? value2 = false;

  bool first_done=false;
  bool second_done=false;
  bool third_done=false;
  late Agremeent_info agreemment_info;


    List<DataRow> _rowList = [
    
  ];
  
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
  void checker()
  {
    int diff=selectedDate2.difference(selectedDate).inDays;
    print(diff);
    print("gggggggggggggggggggggggg");
    // double  difference=diff/12;
    if(diff<365)
  {
    _addRow();
    print("first if");
  }
  else if(diff>365 && diff<730)
  {
    _addRow();
    print("second if");
    _addRow2();
  }
  // else 
  // {
  //   _addRow2();
  // }
  }
  _addRow() {
    // Built in Flutter Method.
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below.
      _rowList.add(DataRow(cells: <DataCell>[
        // DataCell(Text("1")),
        DataCell(Text("First Year")),
        DataCell(Text(_Rent_Value.text)),

      ]));
    });
    print(_Rent_Value.text);
  }
  _addRow2() {

     print(((int.parse(_Rent_Value.text))*int.parse(_Rent_Escalation.text)/100));
    // print(SecondYearRent);
    // Built in Flutter Method.
    setState(() {
      print("entereed add row2");
      
    // int SecondYearRent=int.parse(((int.parse(_Rent_Value.text))*int.parse(_Rent_Escalation.text)/100).toString());
      var SecondYearRent=int.parse(_Rent_Value.text)+((int.parse(_Rent_Value.text))*int.parse(_Rent_Escalation.text)/100); 
      print(SecondYearRent);
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below.
      _rowList.add(DataRow(cells: <DataCell>[
        // DataCell(Text("1")),
        DataCell(Text("Second Year")),
        DataCell(Text(SecondYearRent.toString()),
    )]));
    });
  }
  bool rememberMe = false;
  String? dropdownvalue = null;
  List<String> items = [
    "Residential",
    "Commercial",
    "MNC",
    "Bank",
    "Warehouse"
  ];
 

  Widget _onRememberMeChanged(bool? newValue)  {
    
 setState(() {
   
   rememberMe = newValue!;
 });

    if (rememberMe) {
      // ignore: todo
      // TODO: Here goes your functionality that remembers the user.
             
      return Column(
              children: [
                 Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Landlord_Address2,
                  decoration: InputDecoration(
                      hintText: "Addr",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "LandLord Address2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Landlord_City2,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Landlord City2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Landlord_State2,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Landlord State2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              ],
             );
    } else {
      // ignore: todo
      // TODO: Forget the user
      return Container();
    }
  }
  TextEditingController _AGR_City = TextEditingController();
  TextEditingController _AGR_State = TextEditingController();
  TextEditingController _Landlord_Name = TextEditingController();
  TextEditingController _Landlord_Address = TextEditingController();
  TextEditingController _Landlord_City = TextEditingController();
  TextEditingController _Landlord_State = TextEditingController();
  TextEditingController _Landlord_PinCode = TextEditingController();


  TextEditingController _Landlord_Address2 = TextEditingController();
  TextEditingController _Landlord_City2 = TextEditingController();
  TextEditingController _Landlord_State2 = TextEditingController();
  TextEditingController _Landlord_PinCode2 = TextEditingController();

  TextEditingController _Tenant_Name = TextEditingController();
  TextEditingController _Tenant_Address = TextEditingController();
  TextEditingController _Tenant_City = TextEditingController();
  TextEditingController _Tenant_State = TextEditingController();
  TextEditingController _Tenant_PinCode = TextEditingController();

   TextEditingController _Tenant_Address2 = TextEditingController();
  TextEditingController _Tenant_City2 = TextEditingController();
  TextEditingController _Tenant_State2 = TextEditingController();
   TextEditingController _Tenant_PinCode2 = TextEditingController();

    TextEditingController _Firm_Name = TextEditingController();
     TextEditingController _GST_Number = TextEditingController();

  TextEditingController _Firm_Address = TextEditingController();
  TextEditingController _Firm_City = TextEditingController();
  TextEditingController _Firm_State = TextEditingController();
   TextEditingController _Firm_PinCode = TextEditingController();
  
  TextEditingController _Property_Address = TextEditingController();
  TextEditingController _Property_City = TextEditingController();
  TextEditingController _Property_State = TextEditingController();
   TextEditingController _Property_PinCode = TextEditingController();
  

TextEditingController _Bathroom = TextEditingController();
TextEditingController _Bedroom = TextEditingController();
TextEditingController _Carpark = TextEditingController();

TextEditingController _SquareFeet = TextEditingController();
TextEditingController _Rent_Value = TextEditingController();

TextEditingController _LockinPeriod= TextEditingController();
TextEditingController _Rent_Escalation = TextEditingController();
TextEditingController _Notice_Period = TextEditingController();
TextEditingController _Termination_Period = TextEditingController();
TextEditingController _K_Number = TextEditingController();
TextEditingController _Starting_Meter_Reading = TextEditingController();

TextEditingController _Witness1_Name = TextEditingController();
  TextEditingController _Witness1_Address = TextEditingController();
  TextEditingController _Witness1_City = TextEditingController();
  TextEditingController _Witness1_State = TextEditingController();

  TextEditingController _Witness2_Name = TextEditingController();
  TextEditingController _Witness2_Address = TextEditingController();
  TextEditingController _Witness2_City = TextEditingController();
  TextEditingController _Witness2_State = TextEditingController();


   TextEditingController _Item1 = TextEditingController();
   TextEditingController _Item2 = TextEditingController();
   TextEditingController _Item3 = TextEditingController();
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 50),
        // ignore: unnecessary_new
        child:  new SingleChildScrollView(
          child: Column(
                 
                children: [

              
              
              
              
           
              
              

              // Text(
              //   ('Landlord Details'),
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 20,
              //     color: Colors.black,
              //   ),
              // ),
             if(first_done==false)...[ Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _AGR_City,
                  decoration: InputDecoration(
                      hintText: "City name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "City Name",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _AGR_State,
                  decoration: InputDecoration(
                      hintText: "State name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "State Name",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Landlord_Name,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Landlord Name",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Landlord_Address,
                  decoration: InputDecoration(
                      hintText: "adr",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Landlord Address 1",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Landlord_City,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Landlord City",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Landlord_State,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Landlord State",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Landlord_PinCode,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Landlord Pincode",
                      labelStyle: TextStyle(color: Colors.black)),
                ),),
               
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("To add one more address"),
                  Checkbox(
                    value: this.value,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                this.value = value;
                                              });
                                              print('change to $value');
  }
  )
  ,
                ],
              ),

                Column(
                  children: [
                    if(value==true)...[
                      Column(
              children: [
                 Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Landlord_Address2,
                  decoration: InputDecoration(
                      hintText: "Addr",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "LandLord Address2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Landlord_City2,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Landlord City2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Landlord_State2,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Landlord State2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Landlord_PinCode2,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Landlord Pincode2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),),
              ],
             )
                    ]
                    else Container()
 
                  ],
                ),
        
          

              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Tenant_Name,
                  decoration: InputDecoration(
                      hintText: "No",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Tenant Name",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Tenant_Address,
                  decoration: InputDecoration(
                      hintText: "adr",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Tenant Address 1",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Tenant_City,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Tenant City",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Tenant_State,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Tenant State",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Tenant_PinCode,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Tenant Pincode",
                      labelStyle: TextStyle(color: Colors.black)),
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("To add one more address"),
                  Checkbox(
      value: this.value2,
                                            onChanged: (bool? value2) {
                                              setState(() {
                                                this.value2 = value2;
                                              });
                                              print('change to $value2');
  }),
                ],
              ),
             Column(
                children: [
                  if(value2==true)...[
                    Column(
                      children: [
                         Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Tenant_Address,
                  decoration: InputDecoration(
                      hintText: "adr",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Tenant Address 2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Tenant_City,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Tenant City2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Tenant_State,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Tenant State2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Tenant_PinCode2,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Tenant Pincode2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),),

                      ],
                    )
                  ]
                  else Container()
                ],
             ),
             Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Firm_Name,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Firm name",
                      labelStyle: TextStyle(color: Colors.black)),
                ),),
                Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _GST_Number,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "GST NUMBER",
                      labelStyle: TextStyle(color: Colors.black)),
                ),),

             Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Firm_Address,
                  decoration: InputDecoration(
                      hintText: "adr",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Firm Address",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Firm_City,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Firm City",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Firm_State,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Firm State",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Firm_PinCode,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Firm Pincode",
                      labelStyle: TextStyle(color: Colors.black)),
                ),),


                 Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Property_Address,
                  decoration: InputDecoration(
                      hintText: "adr",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Property Address",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Property_City,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Property City",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Property_State,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Property State",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Property_PinCode,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Property Pincode",
                      labelStyle: TextStyle(color: Colors.black)),
                ),),
             TextButton(onPressed: (){
              setState(() {
                first_done=true;
              });
             }, child: Text("SAVE & NEXT"))
             ]
          else if(first_done==true && second_done==false)...[
              Container(
            width: 300,
            margin: const EdgeInsets.only(
              // left: 40.0,
            ),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.blueAccent,
              ),
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                dropdownvalue = newValue!;
                switch (dropdownvalue) {
                  case "Warehouse":
                    
                  
                    break;
                  case "Residential":
                  
                    
                    break;
                  case "Bank":
                    
                    break;
                  case "MNC":
                    
                    break;
                  case "Commercial":
                    
                }
              },
            ),
          ),
          Text('Bathroom'),
                NumberInputPrefabbed.roundedButtons(
                  controller: _Bathroom,
                  incDecBgColor: Colors.blueAccent,
                  buttonArrangement: ButtonArrangement.incRightDecLeft,
                ),
                 Text('Bedroom'),
                NumberInputPrefabbed.roundedButtons(
                  controller: _Bedroom,
                  incDecBgColor: Colors.blueAccent,
                  buttonArrangement: ButtonArrangement.incRightDecLeft,
                ),
                 Text('CarPark'),
                NumberInputPrefabbed.roundedButtons(
                  controller: _Carpark,
                  incDecBgColor: Colors.blueAccent,
                  buttonArrangement: ButtonArrangement.incRightDecLeft,
                ),
               Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _SquareFeet,
                  decoration: InputDecoration(
                      hintText: "sqft",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Sqft",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  // onEditingComplete:_addRow() ,
                  style: TextStyle(color: Colors.black),
                  controller: _Rent_Value,
                  decoration: InputDecoration(
                      hintText: "In rs",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Rent",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
     
              // print("3");
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _LockinPeriod,
                  decoration: InputDecoration(
                      hintText: "IN INT",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "LOCKIN PERIOD",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
               Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  onChanged: null,
                  style: TextStyle(color: Colors.black),
                  controller: _Rent_Escalation,
                  decoration: InputDecoration(
                      hintText: "IN INT",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Rent Escaltion %",
                      labelStyle: TextStyle(color: Colors.black)),

                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Row(
                    children: [
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
                    ],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Row(
                    children: [
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
                    ],
                  )),
               MaterialButton(child: Text("Add Data row"),onPressed: checker),
              
              DataTable(columns: [
          // DataColumn(label: Text('S.No')),
          DataColumn(label: Text('Year')),
          DataColumn(label: Text('Rent')),
        ], rows: _rowList),
        Row(children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      first_done = false;
                    });
                  },
                  child: Text('BACK')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      second_done = true;
                    });
                    
  //  var a = DateTime.utc(int.parse("${selectedDate2.toLocal()}".split(' ')[0].substring(0,4)),int.parse("${selectedDate2.toLocal()}".split(' ')[0].substring(5,7)), int.parse("${selectedDate2.toLocal()}".split(' ')[0].substring(8,10)));
  // var b = DateTime.utc(int.parse("${selectedDate.toLocal()}".split(' ')[0].substring(0,4)),int.parse("${selectedDate.toLocal()}".split(' ')[0].substring(5,7)), int.parse("${selectedDate.toLocal()}".split(' ')[0].substring(8,10)));
  //   var years = a.difference(b);
  // print((years.inDays ~/30) );
                  },
                  child: Text('SAVE & NEXT'))
            ]),
          ]
          else if(first_done==true && second_done==true && third_done==false)...[
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Notice_Period,
                  decoration: InputDecoration(
                      hintText: "IN INT",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Notice Period (in months)",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Termination_Period,
                  decoration: InputDecoration(
                      hintText: "IN INT",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Termination (in days)",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _K_Number,
                  decoration: InputDecoration(
                      hintText: "IN INT",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "KNUMBER",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Starting_Meter_Reading,
                  decoration: InputDecoration(
                      hintText: "IN INT",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Starting Meter Reading",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Witness1_Name,
                  decoration: InputDecoration(
                      hintText: "IN INT",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Witness name1",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
               Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Witness1_Address,
                  decoration: InputDecoration(
                      hintText: "IN INT",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Witness Address1",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
               Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Witness1_City,
                  decoration: InputDecoration(
                      hintText: "IN INT",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Witness City1",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Witness1_State,
                  decoration: InputDecoration(
                      hintText: "IN INT",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Witness State1",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Witness2_Name,
                  decoration: InputDecoration(
                      hintText: "IN INT",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Witness name2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
               Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Witness2_Address,
                  decoration: InputDecoration(
                      hintText: "IN INT",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Witness Address2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
               Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Witness2_City,
                  decoration: InputDecoration(
                      hintText: "IN INT",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Witness City2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Witness2_State,
                  decoration: InputDecoration(
                      hintText: "IN INT",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Witness State2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Text("Provided Items",),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Item1,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Item 1",
                      labelStyle: TextStyle(color: Colors.black)),
                ),),
                Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Item2,
                  decoration: InputDecoration(
                      hintText: "name",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Item 2",
                      labelStyle: TextStyle(color: Colors.black)),
                ),),
                Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _Item3,
                  decoration: InputDecoration(
                      hintText: "Item 3",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "Item 3",
                      labelStyle: TextStyle(color: Colors.black)),
                ),),
          Row(children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      second_done = false;
                    });
                  },
                  child: Text('BACK')),
              ElevatedButton(
                  onPressed: ()async {
                    setState(() {
                      second_done = true;
                      // agreemment_info=Agremeent_info(_AGR_City.text,_AGR_State.text,_Landlord_Name.text,_Landlord_Address.text,_Landlord_City.text,_Landlord_State.text,_Landlord_Address2.text,_Landlord_City2.text,_Landlord_State2.text,_Tenant_Name.text,_Tenant_Address.text,_Tenant_City.text,_Tenant_State.text,_Tenant_Address2.text,_Tenant_City2.text,_Tenant_State2.text,_Firm_Address.text,_Firm_City.text,_Firm_State.text,_Property_Address.text,_Property_City.text,_Property_State.text,_Bathroom.text,_Bedroom.text,_Carpark.text,_SquareFeet.text,_Rent_Value.text,_LockinPeriod.text,_Rent_Escalation.text,_Notice_Period.text,_Termination_Period.text,_K_Number.text,_Starting_Meter_Reading.text,_Witness1_Name.text,_Witness1_Address.text,_Witness1_City.text,_Witness1_State.text,_Witness2_Name.text,_Witness2_Address.text,_Witness2_City.text,_Witness2_State.text);
                    });
                    agreemment_info=Agremeent_info(_AGR_City.text,_AGR_State.text,_Landlord_Name.text,_Landlord_Address.text,_Landlord_City.text,_Landlord_State.text,_Landlord_PinCode.text,_Landlord_Address2.text,_Landlord_City2.text,_Landlord_State2.text,_Landlord_PinCode2.text,_Tenant_Name.text,_Tenant_Address.text,_Tenant_City.text,_Tenant_State.text,_Tenant_PinCode.text,_Tenant_Address2.text,_Tenant_City2.text,_Tenant_State2.text,_Tenant_PinCode2.text,_Firm_Name.text,_GST_Number.text,_Firm_Address.text,_Firm_City.text,_Firm_State.text,_Firm_PinCode.text,_Property_Address.text,_Property_City.text,_Property_State.text,_Property_PinCode.text,_Bathroom.text,_Bedroom.text,_Carpark.text,_SquareFeet.text,_Rent_Value.text,_LockinPeriod.text,_Rent_Escalation.text,_Notice_Period.text,_Termination_Period.text,_K_Number.text,_Starting_Meter_Reading.text,_Witness1_Name.text,_Witness1_Address.text,_Witness1_City.text,_Witness1_State.text,_Witness2_Name.text,_Witness2_Address.text,_Witness2_City.text,_Witness2_State.text,_Item1.text,_Item2.text,_Item3.text,"${selectedDate.toLocal()}".split(' ')[0],"${selectedDate2.toLocal()}".split(' ')[0],dropdownvalue!);
                    
   final pdfFile =await  PdfInvoiceApi.generate(agreemment_info: agreemment_info,);

                // opening the pdf file
                FileHandleApi.openFile(pdfFile);

                    
                  },
                  child: Text('SUBMIT'))
            ]),    
          ]
                ],
              ),
              
      )
       
       ),
    ));

   
  }
}
class Agremeent_info{


  final String  Agr_City;
  final String  Agr_State;
  final String  LandLord_Name;
  final String  Landlord_Address;
  final String  Landlord_City;
  final String  Landlord_State;
  final String  Landlord_PinCode;

  final String  Landlord_Address2;
  final String  Landlord_City2;
  final String  Landlord_State2;
  final String  Landlord_PinCode2;

  final String  Tenant_Name;
  final String  Tenant_Address;
  final String  Tenant_City;
  final String  Tenant_State;
  final String  Tenant_PinCode;
  final String  Tenant_Address2;
  final String  Tenant_City2;
  final String  Tenant_State2;
  final String  Tenant_PinCode2;
  final String  Firm_Name;
  final String  GST_Number;
   final String  Firm_Address;
  final String  Firm_City;
  final String  Firm_State;
  final String  Firm_PinCode;
   final String  Property_Address;
  final String  Property_City;
  final String  Property_State;
  final String  Property_PinCode;

  final String Bathroom;
  final String Bedroom;
  final String CarPark;

  final String SquareFeet;
  final String Rent_Value;
  final String LockinPeriod;
final String Rent_Escalation ;
final String Notice_Period ;
final String Termination_Period ;
final String K_Number ;
final String Starting_Meter_Reading ;

final String Witness1_Name ;
  final String Witness1_Address ;
  final String Witness1_City ;
  final String Witness1_State ;

  final String Witness2_Name ;
  final String Witness2_Address ;
  final String Witness2_City ;
  final String Witness2_State ;
  final String  Item1;
  final String  Item2;
  final String  Item3;
  final String Start_Date;
  final String End_Date;
  final String PropertyType;
  Agremeent_info(this.Agr_City,this.Agr_State,this.LandLord_Name,this.Landlord_Address,this.Landlord_City,this.Landlord_State,this.Landlord_PinCode,this.Landlord_Address2,this.Landlord_City2,this.Landlord_State2,this.Landlord_PinCode2,this.Tenant_Name,this.Tenant_Address,this.Tenant_City,this.Tenant_State,this.Tenant_PinCode,this.Tenant_Address2,this.Tenant_City2,this.Tenant_State2,this.Tenant_PinCode2,this.Firm_Name,this.GST_Number,this.Firm_Address,this.Firm_City,this.Firm_State,this.Firm_PinCode,this.Property_Address,this.Property_City,this.Property_State,this.Property_PinCode,this.Bathroom,this.Bedroom,this.CarPark,this.SquareFeet,this.Rent_Value,this.LockinPeriod,this.Rent_Escalation,this.Notice_Period,this.Termination_Period,this.K_Number,this.Starting_Meter_Reading,this.Witness1_Name,this.Witness1_Address,this.Witness1_City,this.Witness1_State,this.Witness2_Name,this.Witness2_Address,this.Witness2_City,this.Witness2_State,this.Item1,this.Item2,this.Item3,this.Start_Date,this.End_Date,this.PropertyType);


}  