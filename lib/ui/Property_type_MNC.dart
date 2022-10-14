import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PropertyTypeMNC extends StatefulWidget {
  const PropertyTypeMNC({Key? key}) : super(key: key);

  @override
  State<PropertyTypeMNC> createState() => _PropertyTypeMNCState();
}

class _PropertyTypeMNCState extends State<PropertyTypeMNC> {
  int MNCPropsTotal = 0;
  int MNCPropsVacant = 0;
  int MNCTotalRent = 0;
  int MNCTotalAsset = 0;
  int MNCPropsOcc = 0;
  int MNCPropsUpcom = 0;
  int yield = 0;

  getData() async {
    await FirebaseFirestore.instance
        .collection("property_main")
        .get()
        .then((value) {
      for (var i in value.docs) {
        print("nah didnt enter the loop");
        if ((i["Property_Details"]["Property_Types"]["MNC"]) == true) {
          print(" entered the loop");
          MNCPropsTotal = MNCPropsTotal + 1;
          print(MNCPropsTotal);
        }
        print("nah didnt enter the loop2");
        print("getdata called");
      }
      // suggestionslist=Properties;
    });

    await FirebaseFirestore.instance
        .collection("property_main")
        .get()
        .then((value) {
      for (var i in value.docs) {
        print("getdata2 nah didnt enter the loop");
        if (((i["Property_Details"]["Property_Types"]["MNC"]) == true) &&
            (i["Property_Details"]["Property_Status"]["Vacant"] == true)) {
          MNCPropsVacant = MNCPropsVacant + 1;
          print(MNCPropsVacant);
        }

        print("getdata called");
      }
      // suggestionslist=Properties;
    });

    await FirebaseFirestore.instance
        .collection("property_main")
        .get()
        .then((value) {
      for (var i in value.docs) {
        if ((i["Property_Details"]["Property_Types"]["MNC"]) == true) {
          if ((i["Property_Details"]["Asset"]) != "") {
            MNCTotalAsset =
                MNCTotalAsset + int.parse((i["Property_Details"]["Asset"]));
          }
          print((i["Property_Details"]["Asset"]));
        }
      }
      // suggestionslist=Properties;
    });

    await FirebaseFirestore.instance
        .collection("property_main")
        .get()
        .then((value) {
      for (var i in value.docs) {
        if ((i["Property_Details"]["Property_Types"]["MNC"]) == true) {
          if ((i["Property_Details"]["Rent"]) != "") {
            MNCTotalRent =
                MNCTotalRent + int.parse((i["Property_Details"]["Rent"]));
          }
        }
      }
      // suggestionslist=Properties;
    });

    await FirebaseFirestore.instance
        .collection("property_main")
        .get()
        .then((value) {
      for (var i in value.docs) {
        print("getdata2 nah didnt enter the loop");
        if (((i["Property_Details"]["Property_Types"]["MNC"]) == true) &&
            (i["Property_Details"]["Property_Status"]["Occupied"] == true)) {
          MNCPropsOcc = MNCPropsOcc + 1;
          print(MNCPropsVacant);
        }

        print("getdata called");
      }
      // suggestionslist=Properties;
    });

    await FirebaseFirestore.instance
        .collection("property_main")
        .get()
        .then((value) {
      for (var i in value.docs) {
        print("getdata2 nah didnt enter the loop");
        if (((i["Property_Details"]["Property_Types"]["MNC"]) == true) &&
            (i["Property_Details"]["Property_Status"]["Upcoming"] == true)) {
          MNCPropsUpcom = MNCPropsUpcom + 1;
          print(MNCPropsVacant);
        }

        print("getdata called");
      }

      if (MNCTotalAsset != 0) {
        yield = (((MNCTotalRent) * 100) / (MNCTotalAsset)).toInt();
      }
      // suggestionslist=Properties;
    });
  }

  // getData2() async {
  //   await FirebaseFirestore.instance
  //       .collection("property_main")
  //       .get()
  //       .then((value) {
  //     for (var i in value.docs) {
  //       print("getdata2 nah didnt enter the loop");
  //       if (((i["Property_Details"]["Property_Types"]["Bank"]) == true) &&
  //           (i["Property_Details"]["Property_Status"]["Vacant"] == true)) {
  //         BankPropsVacant = BankPropsVacant + 1;
  //         print(BankPropsVacant);
  //       }

  //       print("getdata called");
  //     }
  //     // suggestionslist=Properties;
  //   });
  // }

  // getData3() async {
  //   await FirebaseFirestore.instance
  //       .collection("property_main")
  //       .get()
  //       .then((value) {
  //     for (var i in value.docs) {
  //       BankTotalAsset =
  //           BankTotalAsset + int.parse((i["Property_Details"]["Asset"]));
  //       print((i["Property_Details"]["Asset"]));
  //     }
  //     // suggestionslist=Properties;
  //   });
  // }

  // getData4() async {
  //   await FirebaseFirestore.instance
  //       .collection("property_main")
  //       .get()
  //       .then((value) {
  //     for (var i in value.docs) {
  //       BankTotalRent =
  //           BankTotalRent + int.parse((i["Property_Details"]["Rent"]));
  //     }
  //     // suggestionslist=Properties;
  //   });
  // }

  // getData5() async {
  //   await FirebaseFirestore.instance
  //       .collection("property_main")
  //       .get()
  //       .then((value) {
  //     for (var i in value.docs) {
  //       print("getdata2 nah didnt enter the loop");
  //       if (((i["Property_Details"]["Property_Types"]["Bank"]) == true) &&
  //           (i["Property_Details"]["Property_Status"]["Occupied"] == true)) {
  //         BankPropsOcc = BankPropsOcc + 1;
  //         print(BankPropsVacant);
  //       }

  //       print("getdata called");
  //     }
  //     // suggestionslist=Properties;
  //   });
  // }

  // getData6() async {
  //   await FirebaseFirestore.instance
  //       .collection("property_main")
  //       .get()
  //       .then((value) {
  //     for (var i in value.docs) {
  //       print("getdata2 nah didnt enter the loop");
  //       if (((i["Property_Details"]["Property_Types"]["Bank"]) == true) &&
  //           (i["Property_Details"]["Property_Status"]["Upcoming"] == true)) {
  //         BankPropsUpcom = BankPropsUpcom + 1;
  //         print(BankPropsVacant);
  //       }

  //       print("getdata called");
  //     }
  //     // suggestionslist=Properties;
  //   });
  // }

  void initState() {
    // TODO: implement initState
    () async {
      await getData();
      setState(() {
        // getData();
        // getData2();
      });
    }();
    // () async {
    //   await getData2();
    //   setState(() {
    //     // getData2();
    //     // getData2();
    //   });
    // }();
    // () async {
    //   await getData3();
    //   setState(() {
    //     // getData3();
    //     // getData2();
    //   });
    // }();
    // () async {
    //   await getData4();
    //   setState(() {
    //     // getData4();
    //     // getData2();
    //   });
    // }();
    // () async {
    //   await getData5();
    //   setState(() {
    //     // getData5();
    //     // getData2();
    //   });
    // }();
    // () async {
    //   await getData6();
    //   setState(() {
    //     // getData6();
    //     // getData2();
    //   });
    // }();

    // print("initSate called\n");
    // print(searchItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 13,
        ),
        // PieChart(
        //   data: const [
        //     PieChartData(Colors.purple, 50),
        //     PieChartData(Colors.blue, 5),
        //     PieChartData(Colors.orange, 15),
        //     PieChartData(Colors.green, 15),
        //     PieChartData(Colors.red, 15),
        //   ],
        //   radius: 60,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: const [
        //       Text(
        //         'Bank',
        //         style: TextStyle(
        //             fontWeight: FontWeight.bold, color: Colors.orange),
        //       ),
        //       Text(''),
        //     ],
        //   ),
        // ),
        Card(
          // shadowColor: Color.fromARGB(255, 180, 38, 236),
          color: Color(0xFF221A2C),
          elevation: 8,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child:
              // ignore: unnecessary_new
              Container(
            decoration: BoxDecoration(color: Color.fromARGB(18, 113, 125, 137)),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 13,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(height: 4),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                        ),
                        FittedBox(
                          child: Text(
                            "MNC",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.030,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height * 0.14,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // SizedBox(width: 2,),
                          Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.025,
                              ),
                              FittedBox(
                                child: Text(
                                  "Occupied",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              FittedBox(
                                child: Text(
                                  (((MNCPropsOcc)).toString()),
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.025,
                              ),
                              FittedBox(
                                child: Text(
                                  "Upcoming",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              FittedBox(
                                child: Text(
                                  ((MNCPropsUpcom).toString()),
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.025,
                              ),
                              FittedBox(
                                child: Text(
                                  "Vacant",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              FittedBox(
                                child: Text(
                                  ((MNCPropsVacant).toString()),
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.025,
                              ),
                              FittedBox(
                                child: Text(
                                  "Total",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              FittedBox(
                                child: Text(
                                  ((MNCPropsTotal).toString()),
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.08,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            FittedBox(
                              child: Text(
                                "Total Rent",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            FittedBox(
                              child: Text(
                                ((MNCTotalRent).toString()),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.08,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            FittedBox(
                              child: Text(
                                "Asset value",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            FittedBox(
                              child: Text(
                                ((MNCTotalAsset).toString()),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.045,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.38,
                        ),
                        Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey, shape: BoxShape.circle),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: Text(
                                    (yield.toString() + "%"),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ],
                            )),
                      ],
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
