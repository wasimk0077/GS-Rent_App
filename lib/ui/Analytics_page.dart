
import 'package:authh_app/ui/bar_chart_graph.dart';
import 'package:authh_app/ui/bar_chart_model.dart';
import 'package:authh_app/ui/bar_chart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';
class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {


  int TotalResProp=0;
  int TotalBankProp=0;
  int TotalCommProp=0;
  int TotalWareProp=0;
  int TotalMNCProp=0;

  double TotalBankRent=0;
  double TotalResRent=0;
  double TotalCommRent=0;
  double TotalMNCRent=0;
  double TotalWareRent=0;
  // String rent_paid="";
  // String rent="dummy";
  // funq() async {
  //   var name;
  //   var cur_month_str;
  //   var collection = FirebaseFirestore.instance.collection('property_main');
  //   var docSnapshot = await collection.doc(widget.docID).get();
  //   if (docSnapshot.exists) {
  //     Map<String, dynamic> data = docSnapshot.data()!;
  //     rent = data['Property_Details']['Rent'];
  //     print(rent);
  //     DateTime now = new DateTime.now();
  //     var cur_year = now.year.toString();
  //     int cur_month_int = now.month;
  //     if (cur_month_int == 1)
  //       cur_month_str = 'Jan';
  //     else if (cur_month_int == 2)
  //       cur_month_str = 'Feb';
  //     else if (cur_month_int == 3)
  //       cur_month_str = 'Mar';
  //     else if (cur_month_int == 4)
  //       cur_month_str = 'Apr';
  //     else if (cur_month_int == 5)
  //       cur_month_str = 'May';
  //     else if (cur_month_int == 6)
  //       cur_month_str = 'Jun';
  //     else if (cur_month_int == 7)
  //       cur_month_str = 'Jul';
  //     else if (cur_month_int == 8)
  //       cur_month_str = 'Aug';
  //     else if (cur_month_int == 9)
  //       cur_month_str = 'Sept';
  //     else if (cur_month_int == 10)
  //       cur_month_str = 'Oct';
  //     else if (cur_month_int == 11)
  //       cur_month_str = 'Nov';
  //     else if (cur_month_int == 12) cur_month_str = 'Dec';
  //     rent_paid = data['Rent_Details'][cur_year][cur_month_str]["Rent_Paid"];
  //     print(rent_paid);
  //   }
  // }
  getData() async {

  await FirebaseFirestore.instance.collection("property_main").get().then((value) {
    for(var i in value.docs) {
        //  print("nah didnt enter the loop");
        
        if((i["Property_Details"]["Property_Types"]["Residential"])==true)
        {
          print(" entered the loop");
          TotalResProp=TotalResProp+1;
            TotalResRent=TotalResRent+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
          print("Totalt rent 11");
          print(TotalResProp);
        }
        if(i["Property_Details"]["Property_Types"]["Bank"]==true)
        {
            TotalBankProp=TotalBankProp+1;
            
            TotalBankRent=TotalBankRent+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
             print(TotalBankProp);
             print("Totalt bank rent 11");
            print(TotalBankRent);
        }
         if(i["Property_Details"]["Property_Types"]["Commercial"]==true)
        {
            TotalCommProp=TotalCommProp+1;
              TotalCommRent=TotalCommRent+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
             print(TotalCommProp);
             print("Totalt comm rent 11");
            print(TotalCommRent);
        
        }
        
         if(i["Property_Details"]["Property_Types"]["MNC"]==true)
        {
            TotalMNCProp=TotalMNCProp+1;
              TotalMNCRent=TotalMNCRent+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
        }
         if(i["Property_Details"]["Property_Types"]["Warehouse"]==true)
        {
            TotalWareProp=TotalWareProp+1;
              TotalMNCRent=TotalMNCRent+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
        }
       

        //  print("nah didnt enter the loop2");
      // print("getdata called");
    }
    // suggestionslist=Properties;
  });
}
getData2() async {

  await FirebaseFirestore.instance.collection("property_main").get().then((value) {
    for(var i in value.docs) {
        //  print("nah didnt enter the loop");
        
        if((i["Property_Details"]["Property_Types"]["Residential"])==true)
        {
          print(" entered the loop");
          TotalResProp=TotalResProp+1;
            TotalResRent=TotalResRent+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
          print("Totalt rent 11");
          print(TotalResProp);
        }
        
       

        //  print("nah didnt enter the loop2");
      // print("getdata called");
    }
    // suggestionslist=Properties;
  });
}



 getrentData() async{
  await FirebaseFirestore.instance
    .collection('property_main')
    .get()
    .then((value) {
       return value.docs; // Access your after your get the data
     });
}
  
   
  
  
  void initState()  {
    ()async{
      await getData();
      setState(() {
        
      });
    }();

      super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    print("----------------------------------------");
    print(TotalResProp);
    print("----------------------------------------");
     final List<ChartData> chartData = [
            ChartData('Residential', TotalResProp.toDouble(), Colors.teal),
            ChartData('Bank', TotalBankProp.toDouble(), Colors.orange),
            ChartData('MNC', TotalMNCProp.toDouble(), Colors.brown),
            ChartData('Commercial', TotalCommProp.toDouble(), Colors.deepOrange),
            ChartData('Warehouse', TotalWareProp.toDouble(), Colors.green)
        ];
        final List<ChartData> chartData2= [
            ChartData('Residential', TotalResRent.toDouble(), Colors.teal),
            ChartData('Bank', TotalBankRent.toDouble(), Colors.orange),
            ChartData('MNC', TotalMNCRent.toDouble(), Colors.brown),
            ChartData('Commercial', TotalCommRent.toDouble(), Colors.deepOrange),
            ChartData('Warehouse', TotalWareRent.toDouble(), Colors.green)
        ];
    return Scaffold(
     body:ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 60,),
        Padding(
          padding: const EdgeInsets.only(left: 50.0,right:50.0),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                              ('Monthly Rental Income'),
                              style: TextStyle(
                                fontWeight:FontWeight.bold,
                                
                                fontSize: 20,
                                color: Colors.black,
                                
                              ),
                              
                            ),
                            Text(
                              (' 56'),
                              style: TextStyle(
                                fontWeight:FontWeight.bold,
                                
                                fontSize: 20,
                                color: Colors.black,
                                
                              ),
                              
                            ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 50.0,right:50.0),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                              ('Average Yield'),
                              style: TextStyle(
                                fontWeight:FontWeight.bold,
                                
                                fontSize: 20,
                                color: Colors.black,
                                
                              ),
                              
                            ),
                            Text(
                              (' 56'),
                              style: TextStyle(
                                fontWeight:FontWeight.bold,
                                
                                fontSize: 20,
                                color: Colors.black,
                                
                              ),
                              
                            ),
            ],
          ),
        ),
        SizedBox(height: 45,),
        InkWell(
            onTap: () {
              
            },
            child: Column(
            children: [
              PieChart(
              data: const [
                PieChartData(Colors.purple, 55),
                PieChartData(Colors.blue, 45),
                
              ],
              radius: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),
                  Text('163',
                  style: TextStyle(
                    fontSize: 20
                  ),),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Padding(padding:  const EdgeInsets.only(left: 15.0,right:15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                              width: 30,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                            ),
                            
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      child: Text(
                        'Vacant : 39',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                    ),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                              width: 30,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple,
                              ),
                            ),
                            
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      child: Text(
                        'Occupied : 134',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                    ),
                  ],
                ),
                
              ],
            )
,),
SizedBox(height: 50,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
              
    
            // shadowColor: Color.fromARGB(255, 180, 38, 236),
          elevation: 8,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
            child:
           // ignore: unnecessary_new
           
              
             
              Container(
              
              decoration: BoxDecoration(
               color: Color.fromARGB(18, 113, 125, 137)
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                               Container(
                              width: 30,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple,
                              ),
                            ),
                            SizedBox(height: 10,),
                            
                      
                         Text(
                        '164',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),
                      SizedBox(height: 10,),
                        Text(
                        'Total Properties',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
       
                  
                 
        
       ],
              ),
              
          ),
          
          
          
          
    
           
           
        ),
        Card(
              
    
            // shadowColor: Color.fromARGB(255, 180, 38, 236),
          elevation: 8,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
            child:
           // ignore: unnecessary_new
           
              
             
              Container(
              
              decoration: BoxDecoration(
               color: Color.fromARGB(18, 113, 125, 137)
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                               Container(
                              width: 30,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple,
                              ),
                            ),
                            SizedBox(height: 10,),
                            
                      
                         Text(
                        '139',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),
                      SizedBox(height: 10,),
                        Text(
                        'Occupied Properties',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
       
                  
                 
        
       ],
              ),
              
          ),
          
          
          
          
    
           
           
        ),
        ],
      )
             

                 
     
            ],
          ),
          ),
           Container(
             width: MediaQuery.of(context).size.width,
            height: 350,
            child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Column(
                children: [
                  Text("No of Property types"),
                  Container(
                width: 380,
                
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                          
                        ),
                        series: <CartesianSeries>[
                            ColumnSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Map color for each data points from the data source
                                pointColorMapper: (ChartData data, _) => data.color
                            )
                        ]
                    )
                ),
                ],
              ),
              Column(
                children: [
                  Text("Total Rent per Property Type"),
                  Container(
                width: 380,
                
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                          
                        ),
                        series: <CartesianSeries>[
                            ColumnSeries<ChartData, String>(
                                dataSource: chartData2,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Map color for each data points from the data source
                                pointColorMapper: (ChartData data, _) => data.color
                            )
                        ]
                    )
                ),
                ],
              ),
                // Container(
                //   width: 380,

                //     child: SfCartesianChart(
                //         primaryXAxis: CategoryAxis(
                          
                //         ),
                //         series: <CartesianSeries>[
                //             ColumnSeries<ChartData, String>(
                //                 dataSource: chartData2,
                //                 xValueMapper: (ChartData data, _) => data.x,
                //                 yValueMapper: (ChartData data, _) => data.y,
                //                 // Map color for each data points from the data source
                //                 pointColorMapper: (ChartData data, _) => data.color
                //             )
                //         ]
                //     )
                // ),
            ]
           ),
           ),

        //   Container(
        //   child: ListView(
        //     scrollDirection: Axis.vertical,
        //     shrinkWrap: true,
        //     children: [
        //       BarChartGraph(
        //         data: data,
        //       ),

        //     ],
        //   ),

        // ),
        SizedBox(height: 30,),
        Text(
                        'Performance',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),
                      SizedBox(height: 20,),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
              
    
            // shadowColor: Color.fromARGB(255, 180, 38, 236),
          elevation: 8,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
            child:
           // ignore: unnecessary_new
           
              
             
              Container(
              
              decoration: BoxDecoration(
               color: Color.fromARGB(255, 157, 226, 204)
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                            
                            
                      
                         Text(
                        '15%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),
                      SizedBox(height: 10,),
                        Text(
                        'Yield',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
       
                  
                 
        
       ],
              ),
              
          ),
          
          
          
          
    
           
           
        ),
        Card(
              
    
            // shadowColor: Color.fromARGB(255, 180, 38, 236),
          elevation: 8,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
            child:
           // ignore: unnecessary_new
           
              
             
              Container(
              
              decoration: BoxDecoration(
               color: Color.fromARGB(18, 255, 51, 0)
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                            
                            
                      
                         Text(
                        '3.1%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),
                      SizedBox(height: 10,),
                        Text(
                        'Yield',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
       
                  
                 
        
       ],
              ),
              
          ),
          
          
          
          
    
           
           
        ),
        ],
      )

      ],
     ),
  ],
)
    );
  }}


class PropertyTile {
  final String  RentPaid;
  final String  Carpet_Area;
  final String  Floor;
  final String  Rent;
  final String  Asset;
  final bool Residential;

  PropertyTile(@required this.RentPaid,@required this.Carpet_Area ,@required this.Floor,@required this.Rent,@required this.Asset,@required this.Residential);



}

    class ChartData {
        ChartData(this.x, this.y, this.color);
            final String x;
            final double? y;
            final Color? color;
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
    this.strokeWidth = 14,
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


