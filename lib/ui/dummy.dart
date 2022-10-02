// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GFG extends StatefulWidget {
 GFG({Key? key}) : super(key: key);
 
  @override
  
  State<GFG> createState() => _GFGState();
}
 
class _GFGState extends State<GFG> {
  List<String> searchItems=[];
  getData() async {
  await FirebaseFirestore.instance.collection("property_main").get().then((value) {
    for(var i in value.docs) {
      searchItems.add(i["Property_Details"]["Property_name"]);
    }
  });
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  final Stream<QuerySnapshot> property_main=FirebaseFirestore.instance.collection('property_main').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "",
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Container(
            
              
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
                
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Views(),
              //   ),
              // );
            
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
    );
  }
}
class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = [
    
 

    "Apple",
    "Banana",
    "Mango",
    // "KHAN"
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];
  
  //        FirebaseFirestore.instance.collection("property_main").get().then((value) {
  //   for(var i in value.docs) {
  //     searchTerms.add(i["Property_Details"]["Property_name"]);
  //   }
  // });
  
getData() async {
  await FirebaseFirestore.instance.collection("property_main").get().then((value) {
    for(var i in value.docs) {
      searchTerms.add(i["Property_Details"]["Property_name"]);
      print("object");
      print(i["Property_Details"]["Property_name"]);
      print("object");   
    }
  });
}


     
  // first overwrite to
  // clear the search text
  @override
 
  
  List<Widget>? buildActions(BuildContext context) {
    // body:
    return [
      IconButton(
        onPressed: () {
          query = '';
          // getData();
          
        },
        icon: Icon(Icons.clear),

      ),
      
    ];
  }
 
  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
        print("------------------------------------");
        
        print("------------------------------------");
        
      },
      icon: Icon(Icons.arrow_back),
    );
  }
 
  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    
  //  FirebaseFirestore.instance.collection("property_main").get().then((value) {
  //   for(var i in value.docs) {
  //     if (i["Property_Details"]["Property_name"].toLowerCase().contains(query.toLowerCase())) {
  //     matchQuery.add(i["Property_Details"]["Property_name"]);
  //   }}
  // });

    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
 
  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    
  // FirebaseFirestore.instance.collection("property_main").get().then((value) {
  //   for(var i in value.docs) {
  //     matchQuery.add(i["Property_Details"]["Property_name"]);
  //   }
  // });

    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}