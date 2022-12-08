


import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/modern_pictograms_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:fluttericon/zocial_icons.dart';


import 'package:authh_app/ui/Analytics_page.dart';
import 'package:authh_app/ui/Chat.dart';
import 'package:authh_app/ui/ChatSlider.dart';
import 'package:authh_app/ui/DiscoverSlider.dart';
import 'package:authh_app/ui/Others.dart';
import 'package:authh_app/ui/discover_vacant.dart';
import 'package:authh_app/ui/home_view.dart';
import 'package:authh_app/ui/property_types.dart';
import 'package:flutter/material.dart';
import 'package:authh_app/ui/custom_bar.dart';

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
    Others(),
    


  ];
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      
      body:  getBody(),
      bottomNavigationBar: _buildBottomBar()
      
    );  
  }  
    Widget _buildBottomBar(){
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.black,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Typicons.home),
          title: Text('Home'),
          activeColor: Colors.green,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.people),
          title: Text('Users'),
          activeColor: Colors.purpleAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.message),
          title: Text(
            'Messages ',
          ),
          activeColor: Colors.pink,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Typicons.chart_bar),
          title: Text('Analytics'),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
         BottomNavyBarItem(
          icon: const Icon(Entypo.cog),
          title: Text('More'),
          activeColor: Colors.yellow,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
    Widget getBody() {
    List<Widget> pages = [
      HomeView(),
    ChatSlider(),
    DiscoverSlider(),
    AnalyticsPage(),
    Others()
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}  
