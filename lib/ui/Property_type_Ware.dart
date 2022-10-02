import 'package:flutter/material.dart';

class PropertyTypeWare extends StatefulWidget {
  const PropertyTypeWare({Key? key}) : super(key: key);

  @override
  State<PropertyTypeWare> createState() => _PropertyTypeWareState();
}

class _PropertyTypeWareState extends State<PropertyTypeWare> {
 
  

  @override
  Widget build(BuildContext context) {
     return Scaffold(
         body: Column(children: [
          SizedBox(height: 60,),
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
                children: const [
                  Text(
                    'Warehouse',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                    ),
                  ),
                  Text(''),
                ],
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
                child: Row(
                  
                  children: [
                    SizedBox(height: 150,),
                    Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                       
                          const SizedBox(height: 4),
                      Container(
                        width: 350,
                        height: 60,
                        child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text(
                            ('Warehouse'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                        ],
                       ),
                      ),
                         
                       Container(
                        width:350,
                        height: 100,
                        decoration:  BoxDecoration(
                          border: Border.all(
                          color: Colors.black,
                      ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                         ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // SizedBox(width: 2,),
                            Column(
                              children: [
                                SizedBox(height: 15,),
                                Text(
                            ('Occupied'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                          SizedBox(height: 5,),
                          
                          Text(
                            ('32'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                              ],
                            ),Column(
                              children: [
                                SizedBox(height: 15,),
                                Text(
                            ('Total'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                          SizedBox(height: 5,),
                          
                          Text(
                            ('4'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                              ],
                            ),Column(
                              children: [
                                SizedBox(height: 15,),
                                Text(
                            ('Vacant'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                          SizedBox(height: 5,),
                          
                          Text(
                            ('36'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                              ],
                            )
                            
                          ],
                        ),
                         

                       ),

                  Container(
                    width:350,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                              children: [
                                SizedBox(height: 15,),
                                Text(
                            ('Total Rent'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                          SizedBox(height: 5,),
                          
                          Text(
                            ('Rs 300'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                              ],
                            ),Column(
                              children: [
                                SizedBox(height: 15,),
                                Text(
                            ('Asset Value'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                          SizedBox(height: 5,),
                          
                          Text(
                            ('Rs 600'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                              ],
                            ),
                      ],
                    ),
                  ),
                  
                 Container(
                  width: 350,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                    height: 50,
                    width: 50,
      
      decoration: BoxDecoration(
        color:Colors.blueGrey,
        shape: BoxShape.circle

      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
                            ('10%'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.white,
                              
                            ),
                            
                          ),
        ],
      )
                  ),
                    ],
                  ),
                 )
                   ],
                      ),
                       
                       
                        
                   
                  ],
                ),
            ),
            
            
            
            

             
             
          ),

          

         ]),
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