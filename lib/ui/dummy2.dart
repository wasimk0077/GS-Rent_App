// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// // import 'package:fulltext_search/searchservice.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // Future<QuerySnapshot>? postDocumentList;
//   // String usernameText='';
//   // initSearchingPost(String textEntered) {
//   //   postDocumentList = FirebaseFirestore.instance
//   //       .collection('property_main')
//   //       .where("Pro", isGreaterThanOrEqualTo: textEntered)
//   //       .get();

//   //       setState(() {
//   //         postDocumentList;
//   //       });
//   // }

//   //  final TextEditingController _filter = new TextEditingController();
//   //  late AsyncSnapshot<QuerySnapshot> snapshot;
//   // late ListView _listView;

//   @override
//   // void initState() {
//   //   super.initState();

//   //   // The widget is rebuilt every time the search string changes.
//   //   // I tried to use _listView.build(context) instead but it does not work.
//   //   _filter.addListener(() {
//   //     setState(() {});
//   //   });
//   // }

//   // var queryResultSet = [];
//   // var tempSearchStore = [];

//   // initiateSearch(value) {
//   //   if (value.length == 0) {
//   //     setState(() {
//   //       queryResultSet = [];
//   //       tempSearchStore = [];
//   //     });
//   //   }
//   //   final data=snapshot.requireData;

//   //   var capitalizedValue =
//   //       value.substring(0, 1).toUpperCase() + value.substring(1);

//   //   if (queryResultSet.length == 0 && value.length == 1) {
//   //     SearchService().searchByName(value).then((QuerySnapshot docs) {
//   //       for (int i = 0; i < data.docs.length; ++i) {
//   //         queryResultSet.add(data.docs[i].data());
//   //       }
//   //     });
//   //   } else {
//   //     tempSearchStore = [];
//   //     queryResultSet.forEach((element) {
//   //       if (element['property_main'].startsWith(capitalizedValue)) {
//   //         setState(() {
//   //           tempSearchStore.add(element);
//   //         });
//   //       }
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: new AppBar(
//           title: Text('Firestore search'),
//         ),
//         body: ListView(children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: TextField(
//               onChanged: (textEntered) {
//                 setState(() {
//                   usernameText=textEntered;
//                 });
//                 initSearchingPost(textEntered);
//               },
//               decoration: InputDecoration(
//                   prefixIcon: IconButton(
//                     color: Colors.black,
//                     icon: Icon(Icons.arrow_back),
//                     iconSize: 20.0,
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   contentPadding: EdgeInsets.only(left: 25.0),
//                   hintText: 'Search by name',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4.0))),
//             ),
//           ),
//           SizedBox(height: 10.0),
//           GridView.count(
//               padding: EdgeInsets.only(left: 10.0, right: 10.0),
//               crossAxisCount: 2,
//               crossAxisSpacing: 4.0,
//               mainAxisSpacing: 4.0,
//               primary: false,
//               shrinkWrap: true,
//               children: tempSearchStore.map((element) {
//                 return buildResultCard(element);
//               }).toList())
//         ]));
//   }
// }

// Widget buildResultCard(data) {
//   return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       elevation: 2.0,
//       child: Container(
//           child: Center(
//               child: Text(
//         data['property_main']['Property_name'],
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 20.0,
//         ),
//       ))));
// }

// class SearchService {
//   searchByName(String searchField) {
//     return FirebaseFirestore.instance
//         .collection('property_main')
//         .where('searchKey',
//             isEqualTo: searchField.substring(0, 1).toUpperCase())
//         .get();
//   }
// }



























// //  return StreamBuilder(
// //         stream: _buildStream(_user),
// //         builder: (context, snapshot) {  

// //           // Filter the snapshot documents.
// //           var itemList = new List<MyItem>();
// //           var allDocuments = snapshot.data?.documents;
// //           for (var i = 0; i < allDocuments.length; i++) {
// //             var documentSnapshot = allDocuments[i];
// //             MyItem item = MyItem.fromSnapshot(documentSnapshot);
// //             if (item.name.contains(_filter.text)) itemList.add(item);
// //           }

// //           _listView = ListView.builder(
// //             itemCount: itemList.length,
// //             itemBuilder: (context, i) =>
// //                 _buildListItem(context, itemList[i], i),
// //           );
// //           return _listView;
// //         });
// //   }

// //   Stream<QuerySnapshot> _buildStream(User user) {
// //     return Firestore.instance
// //         .collection('items')
// //         .where('testId', isEqualTo: user.ID)
// //         .snapshots();
// //   }