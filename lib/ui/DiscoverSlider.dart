



import 'package:authh_app/ui/Property_type_Bank.dart';
import 'package:authh_app/ui/Property_type_Comm.dart';
import 'package:authh_app/ui/Property_type_MNC.dart';
import 'package:authh_app/ui/Property_type_Res.dart';
import 'package:authh_app/ui/Property_type_Ware.dart';
import 'package:authh_app/ui/agreement_details.dart';
import 'package:authh_app/ui/details_view.dart';
import 'package:authh_app/ui/discover_upcoming.dart';
import 'package:authh_app/ui/discover_vacant.dart';
import 'package:authh_app/ui/rent_details.dart';
import 'package:authh_app/ui/tenant_details.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class DiscoverSlider extends StatefulWidget {
 const DiscoverSlider({Key? key}) : super(key: key);

  @override
  State<DiscoverSlider> createState() => _DiscoverSliderState();
}

class _DiscoverSliderState extends State<DiscoverSlider> {
 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// #region AppBar()
      
// #endregion
      body:
    // Text(widget.usernameController)
       PageView(
        children: [
          DiscoverVacant(),
          DiscoverUpcoming()
          
        ],
      ),
      );

  }}