
import 'package:authh_app/ui/NewBarchart.dart';
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

  double TotalRentpermonth=0;
  int TotalProperties=0;
  int TotalVacant=0;
  int TotalOccupied=0;
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
  int jan = 0;
  int feb = 0;
  int mar = 0;
  int apr = 0;
  int may = 0;
  int jun = 0;
  int july = 0;
  int aug = 0;
  int sept = 0;
  int oct = 0;
  int nov = 0;
  int dec = 0;
  getData2() async {
    final now = DateTime.now();
    var cur_year = now.year;
    var cur_mon = now.month;
    await FirebaseFirestore.instance
        .collection('property_main')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc['Rent_Details'][cur_year.toString()].containsKey('1')) {
          jan = jan +
              int.parse(
                  doc['Rent_Details'][cur_year.toString()]['1']['Rent_Paid']);
        }

        if (doc['Rent_Details'][cur_year.toString()].containsKey('2')) {
          feb = feb +
              int.parse(
                  doc['Rent_Details'][cur_year.toString()]['2']['Rent_Paid']);
        }

        if (doc['Rent_Details'][cur_year.toString()].containsKey('3')) {
          mar = mar +
              int.parse(
                  doc['Rent_Details'][cur_year.toString()]['3']['Rent_Paid']);
        }

        if (doc['Rent_Details'][cur_year.toString()].containsKey('4')) {
          apr = apr +
              int.parse(
                  doc['Rent_Details'][cur_year.toString()]['4']['Rent_Paid']);
        }

        if (doc['Rent_Details'][cur_year.toString()].containsKey('5')) {
          may = may +
              int.parse(
                  doc['Rent_Details'][cur_year.toString()]['5']['Rent_Paid']);
        }

        if (doc['Rent_Details'][cur_year.toString()].containsKey('6')) {
          jun = jun +
              int.parse(
                  doc['Rent_Details'][cur_year.toString()]['6']['Rent_Paid']);
        }

        if (doc['Rent_Details'][cur_year.toString()].containsKey('7')) {
          july = july +
              int.parse(
                  doc['Rent_Details'][cur_year.toString()]['7']['Rent_Paid']);
        }

        if (doc['Rent_Details'][cur_year.toString()].containsKey('8')) {
          aug = aug +
              int.parse(
                  doc['Rent_Details'][cur_year.toString()]['8']['Rent_Paid']);
        }

        if (doc['Rent_Details'][cur_year.toString()].containsKey('9')) {
          sept = sept +
              int.parse(
                  doc['Rent_Details'][cur_year.toString()]['9']['Rent_Paid']);
        }

        if (doc['Rent_Details'][cur_year.toString()].containsKey('10')) {
          oct = oct +
              int.parse(
                  doc['Rent_Details'][cur_year.toString()]['10']['Rent_Paid']);
        }

        if (doc['Rent_Details'][cur_year.toString()].containsKey('11')) {
          nov = nov +
              int.parse(
                  doc['Rent_Details'][cur_year.toString()]['11']['Rent_Paid']);
        }

        if (doc['Rent_Details'][cur_year.toString()].containsKey('12')) {
          dec = dec +
              int.parse(
                  doc['Rent_Details'][cur_year.toString()]['12']['Rent_Paid']);
        }

        if (cur_mon < 12) {
          int prev_year_mon = cur_mon + 1;
          int prev_year = cur_year - 1;
          if (doc['Rent_Details'].containsKey(cur_year.toString())) {
            while (prev_year_mon <= 12) {
              if (doc['Rent_Details'][cur_year.toString()]
                  .containsKey(prev_year_mon.toString())) {
                if (prev_year_mon == 1)
                  jan = jan +
                      int.parse(doc['Rent_Details'][cur_year.toString()]
                          [prev_year_mon.toString()]['Rent_Paid']);

                if (prev_year_mon == 2)
                  feb = feb +
                      int.parse(doc['Rent_Details'][cur_year.toString()]
                          [prev_year_mon.toString()]['Rent_Paid']);

                if (prev_year_mon == 3)
                  mar = mar +
                      int.parse(doc['Rent_Details'][cur_year.toString()]
                          [prev_year_mon.toString()]['Rent_Paid']);

                if (prev_year_mon == 4)
                  apr = apr +
                      int.parse(doc['Rent_Details'][cur_year.toString()]
                          [prev_year_mon.toString()]['Rent_Paid']);

                if (prev_year_mon == 5)
                  may = may +
                      int.parse(doc['Rent_Details'][cur_year.toString()]
                          [prev_year_mon.toString()]['Rent_Paid']);

                if (prev_year_mon == 6)
                  jun = jun +
                      int.parse(doc['Rent_Details'][cur_year.toString()]
                          [prev_year_mon.toString()]['Rent_Paid']);

                if (prev_year_mon == 7)
                  july = july +
                      int.parse(doc['Rent_Details'][cur_year.toString()]
                          [prev_year_mon.toString()]['Rent_Paid']);

                if (prev_year_mon == 8)
                  aug = aug +
                      int.parse(doc['Rent_Details'][cur_year.toString()]
                          [prev_year_mon.toString()]['Rent_Paid']);

                if (prev_year_mon == 9)
                  sept = sept +
                      int.parse(doc['Rent_Details'][cur_year.toString()]
                          [prev_year_mon.toString()]['Rent_Paid']);

                if (prev_year_mon == 10)
                  oct = oct +
                      int.parse(doc['Rent_Details'][cur_year.toString()]
                          [prev_year_mon.toString()]['Rent_Paid']);

                if (prev_year_mon == 11)
                  nov = nov +
                      int.parse(doc['Rent_Details'][cur_year.toString()]
                          [prev_year_mon.toString()]['Rent_Paid']);

                if (prev_year_mon == 12)
                  dec = dec +
                      int.parse(doc['Rent_Details'][cur_year.toString()]
                          [prev_year_mon.toString()]['Rent_Paid']);
              }
              prev_year_mon += 1;
            }
          }
        }
      });
    });
      DateTime now2=DateTime.now();
    int curmonth=now.month;
    int curmonth2=1;
    int curmonth3=now.month+1;
    
    
    while(curmonth3<=12){
      if(curmonth3==1)
       {
        chartdata3.add(ChartData('JAN', jan.toDouble(), Colors.teal),);
       }
       if(curmonth3==2)
       {
        chartdata3.add(ChartData('FEB', feb.toDouble(), Colors.teal),);
       }
       if(curmonth3==3)
       {
        chartdata3.add(ChartData('MAR', mar.toDouble(), Colors.teal),);
       }
       if(curmonth3==4)
       {
        chartdata3.add(ChartData('APR', apr.toDouble(), Colors.teal),);
       }
       if(curmonth3==5)
       {
        chartdata3.add(ChartData('MAY', may.toDouble(), Colors.teal),);
       }
       if(curmonth3==6)
       {
        chartdata3.add(ChartData('JUN', jun.toDouble(), Colors.teal),);
       }
       if(curmonth3==7)
       {
        chartdata3.add(ChartData('JUL', july.toDouble(), Colors.teal),);
       }
       if(curmonth3==8)
       {
        chartdata3.add(ChartData('AUG', aug.toDouble(), Colors.teal),);
       }
       if(curmonth3==9)
       {
        chartdata3.add(ChartData('SEPT', sept.toDouble(), Colors.teal),);
       }if(curmonth3==10)
       {
        
        chartdata3.add(ChartData('OCT', oct.toDouble(), Colors.teal),);
       }if(curmonth3==11)
       {
        chartdata3.add(ChartData('NOV', nov.toDouble(), Colors.teal),);
       }if(curmonth3==12)
       {
        chartdata3.add(ChartData('DEC', dec.toDouble(), Colors.teal),);
       }
      curmonth3++;

    }
    
      
      while(curmonth2<=curmonth)
      {
        if(curmonth2==1)
       {
        chartdata3.add(ChartData('JAN', jan.toDouble(), Colors.teal),);
       }
       if(curmonth2==2)
       {
        chartdata3.add(ChartData('FEB', feb.toDouble(), Colors.teal),);
       }
       if(curmonth2==3)
       {
        chartdata3.add(ChartData('MAR', mar.toDouble(), Colors.teal),);
       }
       if(curmonth2==4)
       {
        chartdata3.add(ChartData('APR', apr.toDouble(), Colors.teal),);
       }
       if(curmonth2==5)
       {
        chartdata3.add(ChartData('MAY', may.toDouble(), Colors.teal),);
       }
       if(curmonth2==6)
       {
        chartdata3.add(ChartData('JUN', jun.toDouble(), Colors.teal),);
       }
       if(curmonth2==7)
       {
        chartdata3.add(ChartData('JUL', july.toDouble(), Colors.teal),);
       }
       if(curmonth2==8)
       {
        chartdata3.add(ChartData('AUG', aug.toDouble(), Colors.teal),);
       }
       if(curmonth2==9)
       {
        chartdata3.add(ChartData('SEPT', sept.toDouble(), Colors.teal),);
       }if(curmonth2==10)
       {
      
        chartdata3.add(ChartData('OCT', oct.toDouble(), Colors.teal),);
       }if(curmonth2==11)
       {
        chartdata3.add(ChartData('NOV', nov.toDouble(), Colors.teal),);
       }if(curmonth2==12)
       {
        chartdata3.add(ChartData('DEC', dec.toDouble(), Colors.teal),);
       }
       curmonth2++;
      }
      // chartdata3=chartdata3.reversed.toList();
      // chartdata3=List.from(chartdata3.reversed);
    
    
    
  }
  getData() async {

  await FirebaseFirestore.instance.collection("property_main").get().then((value) {
    for(var i in value.docs) {

      if (i["Property_Details"]["Property_Status"]["Upcoming"] != true ){
TotalProperties++;
      }
        
        //  print("nah didnt enter the loop");
        TotalRentpermonth=TotalRentpermonth+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
        // TotalProperties++;
        if (i["Property_Details"]["Property_Status"]["Vacant"] == true ) {
          TotalVacant = TotalVacant + 1;
        }

        if(i["Property_Details"]["Property_Status"]["Occupied"]==true)
        {
           TotalOccupied++;
           print("totaloccuipied");
        }
        if((i["Property_Details"]["Property_Types"]["Residential"])==true && i["Property_Details"]["Property_Status"]["Upcoming"] != true )
        {
          print(" entered the loop");
          TotalResProp=TotalResProp+1;
            TotalResRent=TotalResRent+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
          print("Totalt rent 11");
          print(TotalResProp);
        }
        if(i["Property_Details"]["Property_Types"]["Bank"]==true && i["Property_Details"]["Property_Status"]["Upcoming"] != true )
        {
            TotalBankProp=TotalBankProp+1;
            
            TotalBankRent=TotalBankRent+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
             print(TotalBankProp);
             print("Totalt bank rent 11");
            print(TotalBankRent);
        }
         if(i["Property_Details"]["Property_Types"]["Commercial"]==true && i["Property_Details"]["Property_Status"]["Upcoming"] != true)
        {
            TotalCommProp=TotalCommProp+1;
              TotalCommRent=TotalCommRent+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
             print(TotalCommProp);
             print("Totalt comm rent 11");
            print(TotalCommRent);
        
        }
        
         if(i["Property_Details"]["Property_Types"]["MNC"]==true && i["Property_Details"]["Property_Status"]["Upcoming"] != true)
        {
            TotalMNCProp=TotalMNCProp+1;
              TotalMNCRent=TotalMNCRent+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
        }
         if(i["Property_Details"]["Property_Types"]["Warehouse"]==true && i["Property_Details"]["Property_Status"]["Upcoming"] != true)
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
  double Rentpermonthyield=0;
  double Assetpermonthyield=0;
  List<double> Yields=[];
  double TotalYield=0;
  double Noofproperties=0;
  double averageYield=0;
  
  double one=0;
  double two=0;
  double three=0;
  double four=0;
  double five=0;
  double finalone=0;
  double finaltwo=0;
  double finalthree=0;
  double finalfour=0;
  double finalfive=0;
double ResRentpermonthyield=0;
  double ResAssetpermonthyield=0;
    double BankRentpermonthyield=0;
  double BankAssetpermonthyield=0;
    double MNCRentpermonthyield=0;
  double MNCAssetpermonthyield=0;
    double WareRentpermonthyield=0;
  double WareAssetpermonthyield=0;
    double CommRentpermonthyield=0;
  double CommAssetpermonthyield=0;
   
   int res=0;
    int bank=0;
     int comm=0;
      int mnc=0;
       int ware=0;
       
  getData3() async {

  await FirebaseFirestore.instance.collection("property_main").get().then((value) {
    for(var i in value.docs) {
        
        //  print("nah didnt enter the loop");

 if (i["Property_Details"]["Property_Status"]["Upcoming"] != true ){
        Noofproperties++;
        Rentpermonthyield=Rentpermonthyield+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
        Assetpermonthyield=Assetpermonthyield+double.parse(i["Property_Details"]["Asset"]);
        TotalYield=TotalYield+(Rentpermonthyield*100/Assetpermonthyield);  
        Yields.add((double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"])*100/double.parse(i["Property_Details"]["Asset"])));


      }
        
        
        


        if((i["Property_Details"]["Property_Types"]["Residential"])==true)
        {
        
           ResRentpermonthyield=ResRentpermonthyield+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
        ResAssetpermonthyield=ResAssetpermonthyield+double.parse(i["Property_Details"]["Asset"]);
          one=one +(ResRentpermonthyield*100/ResAssetpermonthyield);
          
          res++;
        }
        if(i["Property_Details"]["Property_Types"]["Bank"]==true)
        {
            BankRentpermonthyield=BankRentpermonthyield+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
        BankAssetpermonthyield=BankAssetpermonthyield+double.parse(i["Property_Details"]["Asset"]);
        two=two+(BankRentpermonthyield*100/BankAssetpermonthyield);
        bank++;
        print("ggggggggggggggggggggggggggggggggggggg");
        print(two);
        print("ggggggggggggggggggggggggggggggggggggg");
        }
         if(i["Property_Details"]["Property_Types"]["Commercial"]==true)
        {
           CommRentpermonthyield=CommRentpermonthyield+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
        CommAssetpermonthyield=CommAssetpermonthyield+double.parse(i["Property_Details"]["Asset"]);
        three=three+(CommRentpermonthyield*100/CommAssetpermonthyield);
        comm++;
        }
        
         if(i["Property_Details"]["Property_Types"]["MNC"]==true)
        {
          MNCRentpermonthyield=MNCRentpermonthyield+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
        MNCAssetpermonthyield=MNCAssetpermonthyield+double.parse(i["Property_Details"]["Asset"]);
        four=four+(MNCRentpermonthyield*100/MNCAssetpermonthyield);
        mnc++;
        }
         if(i["Property_Details"]["Property_Types"]["Warehouse"]==true)
        {
            WareRentpermonthyield=WareRentpermonthyield+double.parse(i["Rent_Details"][DateTime.now().year.toString()][DateTime.now().month.toString()]["Rent_Paid"]);
        WareAssetpermonthyield=WareAssetpermonthyield+double.parse(i["Property_Details"]["Asset"]);
        five=five + (WareRentpermonthyield*100/WareAssetpermonthyield);
        ware++;
        }
       

        //  print("nah didnt enter the loop2");
      // print("getdata called");

    
    }
     if(res!=0)
     {
         finalone=one/res;
   
     }
     if(bank!=0)
     {
         finaltwo=two/bank;
   
     }
     if(comm!=0)
     {
         finalthree=three/comm;
   
     }
     if(mnc!=0)
     {
         finalfour=four/mnc;
   
     }
     if(ware!=0)
     {
         finalfive=five/ware;
   
     }
     averageYield=(TotalYield/Noofproperties);
     Yields.sort();
    // suggestionslist=Properties;
  });
}
// getData2() async {

//   await FirebaseFirestore.instance.collection("property_main").get().then((value) {
//     if(value.)
//     // suggestionslist=Properties;
//   });
// }



 getrentData() async{
  await FirebaseFirestore.instance
    .collection('property_main')
    .get()
    .then((value) {
       return value.docs; // Access your after your get the data
     });
}
  List<ChartData> chartdata3=[];
 
  
  
  void initState()  {
    ()async{
      await getData();
      setState(() {
        // getData();
      });
    }();
    ()async{
      await getData2();
      setState(() {
        
      });
    }();
    ()async{
      await getData3();
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
         final List<ChartData> chartData4= [
            ChartData('Residential',finalone, Colors.teal),
            ChartData('Bank', finaltwo, Colors.orange),
            ChartData('Commercial',finalthree, Colors.brown),
            ChartData('MNC',finalfour, Colors.deepOrange),
            ChartData('Warehouse', finalfive, Colors.green)
        ];
        
    return Scaffold(
      backgroundColor: Colors.black,
     body:ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 60,),
        Text(
                              ('Overall Overview'),
                              style: TextStyle(
                                fontWeight:FontWeight.bold,
                                
                                fontSize: 25,
                                color: Colors.white,
                                
                              ),
                              
                            ),
        Card(
                color: Color(0xFF1E1E1E),
                            elevation: 8,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),

                child:Column(
                   children:
                    
                    [Padding(
          padding: const EdgeInsets.only(left: 50.0,right:50.0),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                              ('Monthly Rental Income'),
                              style: TextStyle(
                                // fontWeight:FontWeight.bold,
                                
                                fontSize: 20,
                                color: Colors.white,
                                
                              ),
                              
                            ),
                            Text(
                              (TotalRentpermonth.toInt().toString()),
                              style: TextStyle(
                                // fontWeight:FontWeight.bold,
                                
                                fontSize: 15,
                                color: Colors.white,
                                
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
                                // fontWeight:FontWeight.bold,
                                
                                fontSize: 20,
                                color: Colors.white,
                                
                              ),
                              
                            ),
                            Text(
          (((averageYield).toInt()).toString()),
                              style: TextStyle(
                                // fontWeight:FontWeight.bold,
                                
                                fontSize: 20,
                                color: Colors.white,
                                
                              ),
                              
                            ),
            ],
          ),
        ),],

                )
              ),
        // SizedBox(height: 45,),
//         InkWell(
//             onTap: () {
              
//             },
//             child: Column(
//             children: [
//               PieChart(
//               data: const [
//                 PieChartData(Colors.purple, 55),
//                 PieChartData(Colors.blue, 45),
                
//               ],
//               radius: 90,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:  [
//                   Text(
//                     'Total',
//                     style: TextStyle(
//                       // fontWeight: FontWeight.bold,
//                       fontSize: 25,
//                       color: Colors.white
//                     ),
//                   ),
//                   Text((TotalProperties).toString(),
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white
//                   ),),
//                 ],
//               ),
//             ),
//             SizedBox(height: 40,),
//             Padding(padding:  const EdgeInsets.only(left: 15.0,right:15.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                               width: 30,
//                               height: 20,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.blue,
//                               ),
//                             ),
                            
//                     Container(
//                       width: MediaQuery.of(context).size.width/3,
//                       child: Text(
//                         'Vacant : $TotalVacant',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                           color: Colors.white
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                  Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Container(
//                               width: 30,
//                               height: 20,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.purple,
//                               ),
//                             ),
                            
//                     Container(
//                       width: MediaQuery.of(context).size.width/3,
//                       child: Text(
//                         'Occupied : $TotalOccupied',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                           color: Colors.white
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
                
//               ],
//             )
// ,),
// SizedBox(height: 50,),
      
             

                 
     
//             ],
//           ),
//           ),Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Card(
              
    
//             // shadowColor: Color.fromARGB(255, 180, 38, 236),
//             color: Color(0xFF1E1E1E),
//           elevation: 8,
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(24),
//           ),
//             child:
//            // ignore: unnecessary_new
           
              
             
//               Container(
              
//               decoration: BoxDecoration(
//                color: Color.fromARGB(18, 113, 125, 137)
//               ),
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
                 
//                                Container(
//                               width: 30,
//                               height: 20,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.purple,
//                               ),
//                             ),
//                             SizedBox(height: 10,),
                            
                      
//                          Text(
//                         (TotalProperties).toString(),
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 25,
//                           color: Colors.white
//                         ),
//                       ),
//                       SizedBox(height: 10,),
//                         Text(
//                         'Total Properties',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                           color: Colors.white
//                         ),
//                       ),
       
                  
                 
        
//        ],
//               ),
              
//           ),
          
          
          
          
    
           
           
//         ),
//         Card(
              
    
//             // shadowColor: Color.fromARGB(255, 180, 38, 236),
//             color: Color(0xFF1E1E1E),
//           elevation: 8,
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(24),
//           ),
//             child:
//            // ignore: unnecessary_new
           
              
             
//               Container(
              
//               decoration: BoxDecoration(
//                color: Color.fromARGB(18, 113, 125, 137)
//               ),
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
                 
//                                Container(
//                               width: 30,
//                               height: 20,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.purple,

//                               ),
//                             ),
//                             SizedBox(height: 10,),
                            
                      
//                          Text(
//                         TotalOccupied.toString(),
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 25,
//                           color: Colors.white
//                         ),
//                       ),
//                       SizedBox(height: 10,),
//                         Text(
//                         'Occupied Properties',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                           color: Colors.white
//                         ),
//                       ),
       
                  
                 
        
//        ],
//               ),
              
//           ),
          
          
          
          
    
           
           
//         ),
//         ],
//       ),

      // Text("Asdsad"),
      Card(
                color: Color(0xFF1E1E1E),
                            elevation: 8,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),

                child:Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width:MediaQuery.of(context).size.width/2 ,
            child: Card(
              
    
            // shadowColor: Color.fromARGB(255, 180, 38, 236),
            color: Color(0xFF1E1E1E),
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
                                color:Colors.blue,
                              ),
                            ),
                            SizedBox(height: 10,),
                            
                      
                         Text(
                        (TotalVacant).toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 10,),
                        Text(
                        'Vacant Properties',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white
                        ),
                      ),
       
                  
                 
        
       ],
              ),
              
          ),
          
          
          
          
    
           
           
        ),
          ),
        Container(
          width: MediaQuery.of(context).size.width/2,
          child: Card(
              
    
            // shadowColor: Color.fromARGB(255, 180, 38, 236),
            color: Color(0xFF1E1E1E),
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
                        TotalOccupied.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 10,),
                        Text(
                        'Occupied Properties',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white
                        ),
                      ),
       
                  
                 
        
       ],
              ),
              
          ),
          
          
          
          
    
           
           
        ),
        )
        ],
      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2.5,
                      height: MediaQuery.of(context).size.width/2.5 ,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [PieChart(
              data: const [
                PieChartData(Colors.purple, 55),
                PieChartData(Colors.blue, 45),
                
              ],
              radius: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                    'Total',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white
                    ),
                  ),
                  Text((TotalProperties).toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                  ),),
                ],
              ),
            ),]
            ,)


                    )
                  ],
                )
              ),
           Container(
             width: MediaQuery.of(context).size.width,
            height: 420,
            child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Card(
                color: Color(0xFF1E1E1E),
                            elevation: 8,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),

                child:Column(
                children: [
                  // Text("No of Property types",
                  // style: TextStyle(color: Colors.white),),
                  Container(
                width: MediaQuery.of(context).size.width,
                
                    child: BarChartSample1()
                ),
                ],
              ) ,
              ),
              Card(
                color: Color(0xFF1E1E1E),
                            elevation: 8,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),

                child:Column(
                children: [
                  Text("Total Rent per Property Type",
                  style: TextStyle(color: Colors.white),),
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
              ),
              
              Card(
                color: Color(0xFF1E1E1E),
                            elevation: 8,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),

                child:Column(
                children: [
                  Text("TTM",
                  style: TextStyle(color: Colors.white),),
                  Container(
                width: 400,
                
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                          
                        ),
                        series: <CartesianSeries>[
                            ColumnSeries<ChartData, String>(
                                dataSource: chartdata3,
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
              ),
              Card(
                color: Color(0xFF1E1E1E),
                            elevation: 8,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),

                child:Column(
                children: [
                  Text("Yield",
                  style: TextStyle(color: Colors.white),),
                  Container(
                width: 380,
                
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                          
                        ),
                        series: <CartesianSeries>[
                            ColumnSeries<ChartData, String>(
                                dataSource: chartData4,
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
                          fontSize: 25,
                          color: Colors.white
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
                        Yields.last.toInt().toString(),
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
                        Yields.first.toInt().toString(),
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
    this.strokeWidth = 11,
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


