



import 'package:authh_app/ui/Property_type_Bank.dart';
import 'package:authh_app/ui/Property_type_Comm.dart';
import 'package:authh_app/ui/Property_type_MNC.dart';
import 'package:authh_app/ui/Property_type_Res.dart';
import 'package:authh_app/ui/Property_type_Ware.dart';
import 'package:authh_app/ui/agreement_details.dart';
import 'package:authh_app/ui/details_view.dart';
import 'package:authh_app/ui/rent_details.dart';
import 'package:authh_app/ui/tenant_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Views extends StatefulWidget {
  // final String docId;
  ////if you have multiple values add here
    final String docID;//if you have multiple values add here
Views(this.docID, {Key? key}): super(key: key);

  @override
  State<Views> createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// #region AppBar()
      
// #endregion
      body:
    // Text(widget.usernameController)
       PageView(
        children: [
          DetailsView(widget.docID),
          Rent_Details(widget.docID),
          TenantDetails(widget.docID),
          AgreementDetails(widget.docID),
          
        ],
      ),
      );

  }}