


import 'package:authh_app/ui/Analytics_page.dart';
import 'package:authh_app/ui/Chat.dart';
import 'package:authh_app/ui/ChatSlider.dart';
import 'package:authh_app/ui/DiscoverSlider.dart';
import 'package:authh_app/ui/discover_vacant.dart';
import 'package:authh_app/ui/home_view.dart';
import 'package:authh_app/ui/property_types.dart';
import 'package:flutter/material.dart';

class MyNavigationBar extends StatefulWidget {  
  MyNavigationBar ({Key? key}) : super(key: key);  
  
  @override  
  _MyNavigationBarState createState() => _MyNavigationBarState();  
}  
  
class _MyNavigationBarState extends State<MyNavigationBar > {  
   int _selectedIndex = 0;
   List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    ChatSlider(),
    DiscoverSlider(),
    AnalyticsPage(),


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
            label: "Home",  
            // title: Text('Home'),  
            backgroundColor: Colors.black
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.chat),  
            label: "Home",  
            // title: Text('Search'),  
            // backgroundColor: Colors.yellow  
            backgroundColor: Colors.black
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.lightbulb_outline_sharp),  
            label: "Home",  
            // title: Text('Profile'),  
            // backgroundColor: Colors.blue,  
            backgroundColor: Colors.black
          ), 
          BottomNavigationBarItem(  
            icon: Icon(Icons.analytics_outlined),  
            label: "Home",  
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