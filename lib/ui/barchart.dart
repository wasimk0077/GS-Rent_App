import 'package:authh_app/ui/bar_chart_graph.dart';
import 'package:authh_app/ui/bar_chart_model.dart';
import 'package:flutter/material.dart';
// import 'package/auth_app/bar_chart_graph.dart';
// import 'package:flutter_animated_bar_chart/bar_chart_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class BarChartDemo extends StatefulWidget {
  @override
  _BarChartDemoState createState() => _BarChartDemoState();
}

class _BarChartDemoState extends State<BarChartDemo> {

  final List<BarChartModel> data = [
    BarChartModel(
      year: "Feb",
      financial: 250,
      color: charts.ColorUtil.fromDartColor(Color(0xFF47505F)),
      month:"abc"
    ),
    BarChartModel(
      year: "Mar",
      financial: 300,
      
      color: charts.ColorUtil.fromDartColor(Colors.red),
      month:"abc"
    ),
    BarChartModel(
      year: "APr",
      financial: 100,
      color: charts.ColorUtil.fromDartColor(Colors.green),
      month:"abc"
    ),
    BarChartModel(
      year: "2017",
      financial: 450,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
      month:"abc"
    ),
    BarChartModel(
      year: "2018",
      financial: 630,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
      month:"abc"
    ),
    BarChartModel(
      year: "2019",
      financial: 1000,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
      month:"abc"
    ),
    BarChartModel(
      year: "2020",
      financial: 400,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
      month:"abc"
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Animated Bar Chart Demo"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              BarChartGraph(
                data: data,
              ),

            ],
          ),

        ),
      ),
    );
  }
}