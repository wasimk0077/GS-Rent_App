import 'dart:async';

import 'package:authh_app/ui/add_property.dart';
import 'package:authh_app/ui/details_view.dart';
import 'package:authh_app/ui/property_types.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
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





  final dataMap = <String, double>{
    "Residential": 4,
    "Warehouse":4,
    "Banks":4,
    "MNC's":4,
    "Commercial":4
    ,
    
  };

  final colorList = <Color>[
    Colors.greenAccent,
    Colors.black,
    Colors.blueAccent,
    Colors.redAccent,
    Colors.yellowAccent
  ];
  
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

  
  
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
      
      Column(
        children: [
          SizedBox(height: 60,),
          
          Column(
            children: [
              PieChart(
              data: const [
                PieChartData(Colors.purple, 80),
                PieChartData(Colors.blue, 5),
                PieChartData(Colors.orange, 15),
              ],
              radius: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Rental Shares',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Rs 50 Cr'),
                ],
              ),
            ),
            SizedBox(height: 20,),
             Table(  
        
                        defaultColumnWidth: FixedColumnWidth(190.0),  
                        border: TableBorder.all(  
                            color: Colors.white,  
                            style: BorderStyle.solid,  
                            width: 2),  
                        children: [  
                          TableRow( children: [  
                            Column(children:[Text('Monthly CF', style: TextStyle(fontSize: 20.0),)]),  
                            Column(children:[Text('Vacant Properties', style: TextStyle(fontSize: 20.0))]),  
                          
                          ]),  
                          TableRow( 
                            
                            children: [  
                            Column(children:[Text('2.5%')]),  
                            Column(children:[Text('250')]),  
                          
                          ]),  
                          
                        ],  
                      ),
                 

            ],
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
                  builder: (context) => DetailsView(),
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
                  
                  
                  
                            
                             

                              
                  
                             
                            //  Image.network(downloadURL.toString())





                                  // StorageReference imageLink = storage.ref().child(documentSnapshot['imageurl']);
                                  // final imageUrl = await imageLink.getDownloadUrl();
                                  // Image.network(imageUrl.toString());
                                  
                        //                 Image.network(firebase_storage.FirebaseStorage.instance
                        // .ref('gs://authentiicate.appspot.com/usersImages')
                        // .child(".png")
                        // .getDownloadURL();
                        // ),
                          
                          
                          
                          
                      
                            
                        ],
                      ),
                    ),
                    SizedBox(
                      
                      child: 
                      
                      Column(
                        children: [
                          Image.network(data.docs[index]['Property_Details']['imageurl']['image1'],
                          width: 150,
                          height: 150,
                          )
                          
                        ],
                      )
                             
                      
                    )
                  ],
                ),
            ),
            
            
            
            

             ),
             
          );

















              
               
               
             }));
                     
          
          }),
          
            
    // );
    


              
          ),
        ],
      ),
      bottomNavigationBar:BottomNavigationBar(  
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        
        
        items: const <BottomNavigationBarItem>[  
          
          BottomNavigationBarItem(  
            
            icon: Icon(Icons.incomplete_circle_outlined),
            label: '',
              
            backgroundColor: Colors.white  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.chat),  
            // title :  Text('Search'),
            label: 'Chat'  ,
            
            // backgroundColor: Colors.black 
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.lightbulb_outlined),  
            // title: Text('Profile'),
            label: 'helloo',  
            // backgroundColor: Colors.black,
          ),  
           BottomNavigationBarItem(  
            icon: Icon(Icons.analytics_outlined),  
            // title: Text('Profile'),
            label: 'helloo',  
            // backgroundColor: Colors.black,
          ),
           BottomNavigationBarItem(  
            icon: Icon(Icons.settings),  
            // title: Text('Profile'),
            label: 'helloo',  
            // backgroundColor: Colors.black,
          ),
        ],  
        type: BottomNavigationBarType.shifting,  
        currentIndex: 0,  
        selectedItemColor: Colors.black,  
        iconSize: 40,  
        onTap: null,  
        elevation: 5  
      ), 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Addproperty(),
            ),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      
      
    );
    
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




















