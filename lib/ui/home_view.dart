import 'dart:async';

import 'package:authh_app/net/flutterfire.dart';
import 'package:authh_app/ui/ChangePassword.dart';
import 'package:authh_app/ui/Chat.dart';
import 'package:authh_app/ui/Pre_add.dart';
import 'package:authh_app/ui/Property_type_Res.dart';
import 'package:authh_app/ui/Views.dart';
import 'package:authh_app/ui/add_property.dart';
import 'package:authh_app/ui/auth_as_Admin.dart';
import 'package:authh_app/ui/barchart.dart';
import 'package:authh_app/ui/details_view.dart';
import 'package:authh_app/ui/discover_vacant.dart';
import 'package:authh_app/ui/property_types.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HomeView extends StatefulWidget {
  


  
  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {

int TotalRent=0;
int TotalVacant=0;
getData() async {

  await FirebaseFirestore.instance.collection("property_main").get().then((value) {
    for(var i in value.docs) {
        //  print("nah didnt enter the loop");
        
        TotalRent=TotalRent+int.parse(i["Property_Details"]["Rent"]);
        
       if(i["Property_Details"]["Property_Status"]["Vacant"]==true)
       {
        TotalVacant=TotalVacant+1;
       }


        //  print("nah didnt enter the loop2");
      // print("getdata called");
    }
    // suggestionslist=Properties;
  });
}



  String docId="";
  String downloadURL="";
  
  final Stream<QuerySnapshot> property_main=FirebaseFirestore.instance.collection('property_main').snapshots();
 firebase_storage.FirebaseStorage storage =
  firebase_storage.FirebaseStorage.instanceFor(
      bucket: 'gs://authentiicate.appspot.com/');

  // firebase_storage.Reference imageLink;
  //  Future<void> downloadURLExample() async {
  //   downloadURL = await firebase_storage.FirebaseStorage.instance
  //       .ref('gs://authentiicate.appspot.com/usersImages')
  //       .child(".png")
  //       .getDownloadURL();
        
  // }
  
  @override

  int n = 0;
  Future check() async {
    final user = FirebaseAuth.instance.currentUser;
    var name;
    int temp = 0;
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(user!.uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      name = data['User_type'];
      print(name);
    }
    if (name == 'Admin') {
      temp = 1;
      n = 1;
    } else
      temp = 0;
    return temp;
  }

  void initState() {
    // TODO: implement initState
    () async {
      await check();
      setState(() {
        check();
      });
    }();
    () async {
      await getData();
      setState(() {
        check();
      });
    }();

    super.initState();
  }
  
  

  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
      
      Column(
        children: [
          SizedBox(height: 60,),
          
          InkWell(
            onTap: () {
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PropertyTypes(),
            ),
          );
            },
            child: Column(
            children: [
              PieChart(
              data: const [
                PieChartData(Colors.purple, 50),
                PieChartData(Colors.blue, 5),
                PieChartData(Colors.orange, 15),
                PieChartData(Colors.green, 15),
                PieChartData(Colors.red ,15),
              ],
              radius: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                    'Rental Shares',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Rs " +TotalRent.toString())
                ],
              ),
            ),
            SizedBox(height: 20,),
              Container(
                    width:350,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                              children: [
                                SizedBox(height: 15,),
                                Text(
                            ('Monthly CF'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 17,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                          SizedBox(height: 5,),
                          
                          Text(
                            ("100"),
                            style: TextStyle(
                              // fontWeight:FontWeight.bold,
                              
                              fontSize: 17,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                              ],
                            ),Column(
                              children: [
                                SizedBox(height: 15,),
                                Text(
                            ('Vacant Properties'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 17,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                          SizedBox(height: 5,),
                          
                          Text(
                            (TotalVacant.toString()),
                            style: TextStyle(
                              // fontWeight:FontWeight.bold,
                              
                              fontSize: 17,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                              ],
                            ),
                      ],
                    ),
                  ),
                 

            ],
          ),
          ),
          
          Container(
            
              
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,
          child: StreamBuilder<QuerySnapshot>(stream:property_main,builder:(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasError){
              return Text(('Something went wrong'));
            }
             if(snapshot.connectionState==ConnectionState.waiting)
             {
              return Text("loading");
             }
             final data=snapshot.requireData;

             print(data);
             
             
             return ListView.builder(
              itemCount: data.size,
              itemBuilder: ((context, index) {
              // String url=data.docs[index]['imageurl'];
              // print(url);
              // print("ggs");
              // print(data.docs[index]['imageurl']);
               if (data.docs[index]['Property_Details']['Property_Status']
                                      ['Occupied'] ==
                                  true) {

              return Card(
                

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
                
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Views((data.docs[index].reference.id.toString()),),
                ),
              );
            
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
                          
                          // Text(
                          //   'Colored card',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                  
                          const SizedBox(height: 4),
                          Text(
                            ('${data.docs[index]['Property_Details']['Property_name']}'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                          SizedBox(height: 8),
                          Text(
                            (' ${data.docs[index]['Property_Details']['Carpet_Area']}'),
                            style: TextStyle(
                              // fontWeight:FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            
                          ),
                          Text(
                            ('Firm Name : ${data.docs[index]['Property_Details']['Firm']}'),
                            style: TextStyle(
                              // fontWeight:FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            
                          ),
                          Text(
                            ('Tenant Name : ${data.docs[index]['Property_Details']['Tenant']}'),
                            style: TextStyle(
                              // fontWeight:FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            
                          ),
                          SizedBox(height: 15),
                          Text(
                            ('Yield : ${data.docs[index]['Property_Details']['Yield']}'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          
                  //                    FirebaseFirestore.instance 
                  // .collection('users').document('')
                  // .get()
                  // .then((value) =>
                  // print("Fetched ==>>>"+value.data["username"])),
                  
                  
                  
                            
                             

                              
                  
                             
                       
                          
                      
                            
                        ],
                      ),
                    ),
                    SizedBox(
                      
                      child: 
                    
                     Column(
                        children: [
                          if(data.docs[index]['Property_Details']['imageurl']['image1']=="")  Text("    No Image available") 
            else Image.network(data.docs[index]['Property_Details']['imageurl']['image1'],
                          width: 150,
                          height: 150,
                          ),
                        ]
                ,
                      )
                             
                      
                    )
                  ],
                ),
            ),
            
            
            
            

             ),
             
          );



              }
              else {
                                return const SizedBox(height: 4);
                              }













              
               
               
             }));
                     
          
          }),
          
            
    // );
    


              
          ),
          Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((15.0)),
                  color: Colors.green),
              child: MaterialButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePass(),
                      ),
                    );
                    
                  }
                ,
                child: Text(
                  "Change Password",
                  style: new TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
           SizedBox(height: 15,),
           Column(
            children: [
              if(n==1)
              Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((15.0)),
                  color: Colors.green),
              child: MaterialButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddAdminauth(),
                      ),
                    );
                    
                  }
                ,
                child: Text(
                  "Add Admin",
                  style: new TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            )
            else Container(),
            ],
           )
            
        ],
      ),
      
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => Addproperty(),
      //       ),
      //     );
      //   },
      //   backgroundColor: Colors.black,
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
      floatingActionButton: _getFAB(),
      
      
      
    );
    
    
  }
  Widget _getFAB() {
    if (n==0) {
      return Container();
    } else {
      return FloatingActionButton(
          backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
          onPressed:  () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PreAdd(),
            ),
          );
        });
    }
  }
}
class PieChartData {
  const PieChartData(this.color, this.percent);

  final Color color;
  final double percent;
}

// our pie chart widget
class PieChart extends StatelessWidget {
  PieChart({
    required this.data,
    required this.radius,
    this.strokeWidth = 8,
    this.child,
    Key? key,
  })  : // make sure sum of data is never ovr 100 percent
        assert(data.fold<double>(0, (sum, data) => sum + data.percent) <= 100),
        super(key: key);

  final List<PieChartData> data;
  // radius of chart
  final double radius;
  // width of stroke
  final double strokeWidth;
  // optional child; can be used for text for example
  final Widget? child;

  @override
  Widget build(context) {
    return CustomPaint(
      painter: _Painter(strokeWidth, data),
      size: Size.square(radius),
      child: SizedBox.square(
        // calc diameter
        dimension: radius * 2,
        child: Center(
          child: child,
        ),
      ),
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

// responsible for painting our chart
class _PainterData {
  const _PainterData(this.paint, this.radians);

  final Paint paint;
  final double radians;
}

class _Painter extends CustomPainter {
  _Painter(double strokeWidth, List<PieChartData> data) {
    // convert chart data to painter data
    dataList = data
        .map((e) => _PainterData(
              Paint()
                ..color = e.color
                ..style = PaintingStyle.stroke
                ..strokeWidth = strokeWidth
                ..strokeCap = StrokeCap.round,
              // remove padding from stroke
              (e.percent - _padding) * _percentInRadians,
            ))
        .toList();
  }

  static const _percentInRadians = 0.062831853071796;
  static const _padding = 4;
  static const _paddingInRadians = _percentInRadians * _padding;
  // 0 radians is to the right, but since we want to start from the top
  // we'll use -90 degrees in radians
  static const _startAngle = -1.570796 + _paddingInRadians / 2;

  late final List<_PainterData> dataList;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    // keep track of start angle for next stroke
    double startAngle = _startAngle;

    for (final data in dataList) {
      final path = Path()..addArc(rect, startAngle, data.radians);

      startAngle += data.radians + _paddingInRadians;

      canvas.drawPath(path, data.paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}




















