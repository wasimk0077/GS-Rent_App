



import 'package:authh_app/ui/Property_type_Bank.dart';
import 'package:authh_app/ui/Property_type_Comm.dart';
import 'package:authh_app/ui/Property_type_MNC.dart';
import 'package:authh_app/ui/Property_type_Res.dart';
import 'package:authh_app/ui/Property_type_Ware.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PropertyTypes extends StatefulWidget {
  const PropertyTypes({Key? key}) : super(key: key);

  @override
  State<PropertyTypes> createState() => _PropertyTypesState();
}

class _PropertyTypesState extends State<PropertyTypes> {
 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// #region AppBar()
      
// #endregion
      body: PageView(
        children: [
          PropertyTypeComm(),
           PropertyTypeMNC(),
           PropertyTypeBank(),
           PropertyTypeWare(),
           PropertyTypeRes(),
        ],
      ),);

  }}