import 'dart:async';
import 'dart:math';

// import 'package:example/utils/color_extensions.dart';
import 'package:authh_app/ui/Analytics_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample4 extends StatefulWidget {

  // const BarChartSample1({key});
List<ChartData> chartdata;
  
   //if you have multiple values add here
  BarChartSample4(this.chartdata, {Key? key}) : super(key: key);

  List<Color> get availableColors => const <Color>[
        Colors.purpleAccent,
        Colors.yellow,
        Colors.lightBlue,
        Colors.orange,
        Colors.pink,
        Colors.redAccent,
      ];

  @override
  State<StatefulWidget> createState() => BarChartSample4State();
}

class BarChartSample4State extends State<BarChartSample4> {
  final Color barBackgroundColor =  Color(0xFF1E1E1E);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color:  Color(0xFF1E1E1E),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    'Yield',
                    style: TextStyle(
                      color: Colors.white
                ,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  // const Text(
                  //   'Grafik konsumsi kalori',
                  //   style: TextStyle(
                  //     color: Color(0xff379982),
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 38,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: BarChart(
                        isPlaying ? randomData() : mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8),
            //   child: Align(
            //     alignment: Alignment.topRight,
            //     child: IconButton(
            //       icon: Icon(
            //         isPlaying ? Icons.pause : Icons.play_arrow,
            //         color: const Color(0xff0f4a3c),
            //       ),
            //       onPressed: () {
            //         setState(() {
            //           isPlaying = !isPlaying;
            //           if (isPlaying) {
            //             refreshState();
            //           }
            //         });
            //       },
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor =Colors.yellow,
    double width = 15,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ?Colors.green : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: Colors.green)
              : const BorderSide(color: Colors.green, width: 0),
          // backDrawRodData: BackgroundBarChartRodData(
          //   show: true,
          //   toY: 20,
          //   color:Colors.white,
          // ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(12, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, widget.chartdata[i].y, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, widget.chartdata[i].y, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, widget.chartdata[i].y, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, widget.chartdata[i].y, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4,widget.chartdata[i].y, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, widget.chartdata[i].y, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, widget.chartdata[i].y, isTouched: i == touchedIndex);
            case 7:
            return makeGroupData(7, widget.chartdata[i].y, isTouched: i == touchedIndex);
            case 8:
            return makeGroupData(8, widget.chartdata[i].y, isTouched: i == touchedIndex);
            case 9:
            return makeGroupData(9, widget.chartdata[i].y, isTouched: i == touchedIndex);
            case 10:
            return makeGroupData(10, widget.chartdata[i].y, isTouched: i == touchedIndex);
            case 11:
            return makeGroupData(11, widget.chartdata[i].y, isTouched: i == touchedIndex);
            case 12:
            return makeGroupData(12, widget.chartdata[i].y, isTouched: i == touchedIndex);

          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueGrey,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = '';
                break;
              case 1:
                weekDay = '';
                break;
              case 2:
                weekDay = '';
                break;
              case 3:
                weekDay = '';
                break;
              case 4:
                weekDay = '';
                break;
              case 5:
                weekDay = '';
                break;
              case 6:
                weekDay = '';
                break;
                case 7:
                weekDay = '';
                break;
                case 8:
                weekDay = '';
                break;
                case 9:
                weekDay = '';
                break;
                case 10:
                weekDay = '';
                break;
                case 11:
                weekDay = '';
                break;
                case 12:
                weekDay = '';
                break;
               
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      // fontWeight: FontWeight.bold,
      fontSize: 11,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(widget.chartdata[value.toInt()].x, style: style);
        break;
      case 1:
        text =  Text(widget.chartdata[value.toInt()].x, style: style);
        break;
      case 2:
        text =  Text(widget.chartdata[value.toInt()].x, style: style);
        break;
      case 3:
        text =  Text(widget.chartdata[value.toInt()].x, style: style);
        break;
      case 4:
        text =  Text(widget.chartdata[value.toInt()].x, style: style);
        break;
      case 5:
        text =  Text(widget.chartdata[value.toInt()].x, style: style);
        break;
      case 6:
        text =  Text(widget.chartdata[value.toInt()].x, style: style);
        break;
        case 7:
        text =  Text(widget.chartdata[value.toInt()].x, style: style);
        break;
        case 8:
        text =  Text(widget.chartdata[value.toInt()].x, style: style);
        break;
        case 9:
        text =  Text(widget.chartdata[value.toInt()].x, style: style);
        break;
        
        case 10:
        text =  Text(widget.chartdata[value.toInt()].x, style: style);
        break;
        case 11:
        text =  Text(widget.chartdata[value.toInt()].x, style: style);
        break;
        case 12:
        text =  Text(widget.chartdata[value.toInt()].x, style: style);
        break;
      default:
        text =  Text(widget.chartdata[value.toInt()].x, style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
              0,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 1:
            return makeGroupData(
              1,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 2:
            return makeGroupData(
              2,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 3:
            return makeGroupData(
              3,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 4:
            return makeGroupData(
              4,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 5:
            return makeGroupData(
              5,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 6:
            return makeGroupData(
              6,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
            case 67:
            return makeGroupData(
              7,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
            case 8:
            return makeGroupData(
              8,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
            case 9:
            return makeGroupData(
              9,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
            case 10:
            return makeGroupData(
              10,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
            case 11:
            return makeGroupData(
              11,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
            case 12:
            return makeGroupData(
              12,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );

          default:
            return throw Error();
        }
      }),
      gridData: FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}