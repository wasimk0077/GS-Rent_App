


import 'package:authh_app/ui/BottomNavbar.dart';
import 'package:authh_app/ui/Chat.dart';
import 'package:authh_app/ui/Views.dart';
import 'package:authh_app/ui/chatwrtTenant.dart';
import 'package:authh_app/ui/home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ChatwrtFirmPage extends StatefulWidget {
  ChatwrtFirmPage({Key? key}) : super(key: key);
   
  State<ChatwrtFirmPage> createState() => _ChatwrtFirmPageState();
}

class _ChatwrtFirmPageState extends State<ChatwrtFirmPage> {

   TextEditingController _controller = TextEditingController();
   List<PropertyTile> Properties=[];
   var seen = Set<PropertyTile>();
   List<String> searchItems=[
    "a",
    "b",
    "c",
    "d"
    
   
   ];
  
  //  List<String> suggestionslist=[];
    List<PropertyTile> suggestionslist=[];
  getData() async {

  await FirebaseFirestore.instance.collection("property_main").get().then((value) {
    for(var i in value.docs) {
      Properties.add(
        PropertyTile(i["Property_Details"]["Property_name"].toString(),i["Tenant_Details"]["Tenant_name"].toString(),i["Firm_Details"]["Firm_name"].toString(),
        i["Tenant_Details"]["mobile"].toString())

      );
      searchItems.add(i["Property_Details"]["Property_name"]);
      print("getdata called");
    }
    suggestionslist=Properties;
  });
}
launchWhatsApp(String query) async {
  final link = WhatsAppUnilink(
    phoneNumber: query,
    text: "Hey! I'm inquiring about the apartment listing",
  );
  await launch('$link');
}

void search(String query){
  
  
  final suggestions1=Properties.where((element){
    final item=element.Firmname.toLowerCase();
    final input=query.toLowerCase();
    return item.contains(input);
  }).toList();
  
  var seen = Set<String>();
List<PropertyTile> uniquelist = suggestions1.where((student) => seen.add(student.Propertyname)).toList();
  
  setState(() {
    suggestionslist=uniquelist;

  });
}
@override
  void initState()  {
    // TODO: implement initState
    ()async{
      await getData();
      setState(() {
      print("setstate calledd");
      print(searchItems);
      getData();
    });
    }();
     

    print("initSate called\n");
    print(searchItems);
    super.initState();
   
  }

  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>MyNavigationBar(),
                          ),
                        );
                        return true;
      },
    child: Scaffold(
      backgroundColor: Colors.black,
        
        body: 
        Column(
          children: [
            SizedBox(
              height: 65,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>,
                        //   ),
                        // );
                        Navigator.push(context, SlideRightRoute(page: ChatPage()));
                      },
                      child: Text(
                        'Property Name',
                        style: TextStyle(fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF1E1E1E), // background
                        // onPrimary: Colors.green, // foreground
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  SizedBox(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF1E1E1E), // background
                        // onPrimary: Colors.red, // foreground
                      ),
                      onPressed: () async {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DiscoverUpcoming(),
                        //   ),
                        // );
                        // Navigator.push(context, SlideRightRoute(page: ChatwrtFirmPage()));
                      },
                      child: Text(
                        'Firm  Name',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                   SizedBox(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF1E1E1E), // background
                        // onPrimary: Colors.red, // foreground
                      ),
                      onPressed: () async {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DiscoverUpcoming(),
                        //   ),
                        // );
                        Navigator.push(context, SlideleftRoute(page: ChatwrtTenantPage()));
                      },
                      child: Text(
                        'Tenant Name',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 16,16, 16),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search for properties",
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(22),
                  borderSide: const BorderSide(color: Colors.blueAccent)),
                ),
                onChanged: search,
              ),
            ),
            Expanded(child: ListView.builder(itemCount:suggestionslist.length,itemBuilder:(context, index){
              final sea=suggestionslist[index];
              return Card(
                
               color:Color(0xFF1E1E1E),
              // shadowColor: Color.fromARGB(255, 180, 38, 236),
            elevation: 8,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
              child:
             // ignore: unnecessary_new
             new InkWell(
               onTap: () {
                
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => null,
              //   ),
              // );
            
               },
               child: Container(
                
                decoration: BoxDecoration(
                 color: Color.fromARGB(18, 113, 125, 137)
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(

                      width: 200,
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                         Text(sea.Propertyname,
                          style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.white,
                              
                            ),),
                         Text(sea.Tenantname,
                          style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.white,
                              
                            ),),
                         Text(sea.Firmname,
                          style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.white,
                              
                            ),),
                             IconButton(
              onPressed: () => launchWhatsApp(sea.Mobile),
              icon: Icon(Icons.whatsapp),
            ),
                          
                          
                      
                            
                        ],
                      ),
                    ),
                  
                  ],
                ),
            ),
            
            
            
            

             ),
             
          ); ;

            },))
          ],
        )
        ),);
  }
}
//  ListTile(
//                  title: Column(
//                   children: [
//                     Text(sea.Propertyname),
//                     Text(sea.Tenantname),
//                     Text(sea.Firmname)
//                   ],
//                  ),
                 
                 
//               );
class PropertyTile {
  final String  Propertyname;
  final String  Tenantname;
  final String  Firmname;
  final String Mobile;

  PropertyTile(@required this.Propertyname,@required this.Tenantname ,@required this.Firmname,@required this.Mobile);



}



















