import 'package:flutter/material.dart';

import 'pie_chart.dart';
// import 'package:pie_chart.dart';

class PieChartView extends StatefulWidget {
  // const TenantDetails({Key? key}) : super(key: key);
  
  //
  // //if you have multiple values add here
  final String ResProp;
  final String MNCProp;
  final String WareProp;
  final String CommProp;
  final String BankProp;

  PieChartView( this.ResProp,this.MNCProp,this.WareProp,this.CommProp,this.BankProp,{Key? key}) : super(key: key);

  @override
  State<PieChartView> createState() => _PieChartViewState();
}

class _PieChartViewState extends State<PieChartView> {
 





Widget build(BuildContext context) 
{
   final kCategories2 = [
  Category('Residential', amount:double.parse(widget.ResProp)),
  Category('MNC', amount: double.parse(widget.MNCProp)),
  Category('WareHouse', amount: double.parse(widget.WareProp)),
  Category('Commercial', amount: double.parse(widget.CommProp)),
  Category('Bank', amount: double.parse(widget.BankProp)),
  // Category('fees', amount: 20.00),
];
  
    return Expanded(
      
      flex: 4,
      child: LayoutBuilder(
        builder: (context, constraint) => Container(
          decoration: BoxDecoration(
            color:Colors.black,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 17,
                offset: Offset(-5, -5),
                color: Colors.white,
              ),
              BoxShadow(
                spreadRadius: -2,
                blurRadius: 10,
                offset: Offset(7, 7),
                color: Color.fromARGB(255, 12, 12, 12),
              )
            ],
          ),
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: constraint.maxWidth * 0.6,
                  child: CustomPaint(
                    child: Center(),
                    foregroundPainter: PieChart(
                      width: constraint.maxWidth * 0.5,
                      categories: kCategories2,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: constraint.maxWidth * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        offset: Offset(-1, -1),
                        color: Colors.black,
                      ),
                      BoxShadow(
                        spreadRadius: -2,
                        blurRadius: 10,
                        offset: Offset(5, 5),
                        color: Colors.black.withOpacity(0.5),
                      )
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Text('Rental Income',style: TextStyle(color: Colors.white,
                    fontWeight: 
                    FontWeight.bold),),
                    Text('Rs 10000',style: TextStyle(color: Colors.white,
                    fontWeight: 
                    FontWeight.bold),),
                      ],
                    )
                    
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
