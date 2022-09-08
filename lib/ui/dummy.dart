import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
// import 'package:vector_math/vector_math.dart';
class HomePage2 extends StatelessWidget {
  HomePage2({Key? key}) : super(key: key);

  final dataMap = <String, double>{
    "Flutter": 4,
    "ggs":4,
    "gg1":4,
    "gg2":4,
    "gg4":4
    ,
    
  };

  final colorList = <Color>[
    Colors.greenAccent,
    Colors.black,
    Colors.blueAccent,
    Colors.redAccent,
    Colors.yellowAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pie Chart 1"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: PieChart(
              dataMap: dataMap,
              chartType: ChartType.ring,
              baseChartColor: Colors.grey[50]!.withOpacity(0.15),
              colorList: colorList,
              chartValuesOptions: ChartValuesOptions(
                showChartValuesInPercentage: true,
              ),
              totalValue: 20,
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
    );
  }
}