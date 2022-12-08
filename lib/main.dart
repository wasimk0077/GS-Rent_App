import 'package:authh_app/ui/Analytics_page.dart';
import 'package:authh_app/ui/BottomNavbar.dart';
import 'package:authh_app/ui/Chat.dart';
import 'package:authh_app/ui/DiscoverSlider.dart';
// import 'package:authh_app/ui/NewBarchart.dart';
import 'package:authh_app/ui/Pre_add.dart';
import 'package:authh_app/ui/add_property.dart';
import 'package:authh_app/ui/authentication.dart';
import 'package:authh_app/ui/chat_wrtFirm.dart';
import 'package:authh_app/ui/chatwrtTenant.dart';
// import 'package:authh_app/ui/dummy.dart';
import 'package:authh_app/ui/excelgen.dart';
import 'package:authh_app/ui/home_view.dart';
import 'package:authh_app/ui/location.dart';
import 'package:authh_app/ui/property_types.dart';
import 'package:authh_app/ui/rent_details.dart';
import 'package:authh_app/ui/starting_page.dart';
import 'package:authh_app/ui/tenant_details.dart';
import 'package:authh_app/ui/update_agreement_doc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'ui/newwBarchart.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent App',
      // home:Starting_page()
      home:Scaffold(
        body:
        Text("body")
      )
    );
  }
}
