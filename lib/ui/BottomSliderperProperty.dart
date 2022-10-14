


import 'package:authh_app/ui/Analytics_page.dart';
import 'package:authh_app/ui/Chat.dart';
import 'package:authh_app/ui/ChatSlider.dart';
import 'package:authh_app/ui/DiscoverSlider.dart';
import 'package:authh_app/ui/agreement_details.dart';
import 'package:authh_app/ui/details_view.dart';
import 'package:authh_app/ui/discover_vacant.dart';
import 'package:authh_app/ui/home_view.dart';
import 'package:authh_app/ui/property_types.dart';
import 'package:authh_app/ui/rent_details.dart';
import 'package:authh_app/ui/tenant_details.dart';
import 'package:flutter/material.dart';

class NavBarForProperty extends StatefulWidget {  
  final String docId;
  NavBarForProperty (this.docId,{Key? key}) : super(key: key);  

  @override  
  
  _NavBarForPropertyState createState() => _NavBarForPropertyState();  
} 
  
class _NavBarForPropertyState extends State<NavBarForProperty > {  
  
    late String docUID=widget.docId;
//     void initState() {
// docUID = widget.docId;
// }
   int _selectedIndex = 0;
   late List<Widget> _widgetOptions = <Widget>[
    DetailsView(widget.docId),
    Rent_Details(widget.docId),
    TenantDetails(widget.docId),
    AgreementDetails(widget.docId)
    // DetailsView(widget.docId),
    // DetailsView(widget.docId),



  ];
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      
      body: Center(  
        child: _widgetOptions.elementAt(_selectedIndex),  
      ),  
      bottomNavigationBar: BottomNavigationBar(  
        items: const <BottomNavigationBarItem>[  
          BottomNavigationBarItem(  
            icon: Icon(Icons.home),
            label: "BASIC",  
            // title: Text('Home'),  
            backgroundColor: Colors.black
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.chat),  
            label: "RENT",  
            // title: Text('Search'),  
            // backgroundColor: Colors.yellow  
            backgroundColor: Colors.black
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.lightbulb_outline_sharp),  
            label: "TENANT",  
            // title: Text('Profile'),  
            // backgroundColor: Colors.blue,  
            backgroundColor: Colors.black
          ), 
          BottomNavigationBarItem(  
            icon: Icon(Icons.analytics_outlined),  
            label: "AGR",  
            // title: Text('Profile'),  
            // backgroundColor: Colors.pink,
            backgroundColor: Colors.black  
          ),   
        ],  
        type: BottomNavigationBarType.shifting,  
        currentIndex: _selectedIndex,  
        // selectedItemColor: Colors.black,  
        iconSize: 40,  
        onTap: _onItemTapped,  
        elevation: 5  
      ),  
    );  
  }  
}  