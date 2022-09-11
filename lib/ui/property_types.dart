



import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PropertyTypes extends StatefulWidget {
  const PropertyTypes({Key? key}) : super(key: key);

  @override
  State<PropertyTypes> createState() => _PropertyTypesState();
}

class _PropertyTypesState extends State<PropertyTypes> {
  final dataMap = <String, double>{
    "Residential": 4,
    "Warehouse":4,
    "Banks":4,
    "MNC's":4,
    "Commercial":4
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
         body: Column(children: [
          Container(
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
          Card(
                

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
                 
            
               },
               child: Container(
                
                decoration: BoxDecoration(
                 color: Color.fromARGB(18, 113, 125, 137)
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(height: 30,),
                    SizedBox(

                      width: 200,
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                       
                          const SizedBox(height: 4),
                          Text(
                            ('Residential'),
                            style: TextStyle(
                              fontWeight:FontWeight.bold,
                              
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                            
                          ),
                         
                          
                         
                          
                  //                    FirebaseFirestore.instance 
                  // .collection('users').document('')
                  // .get()
                  // .then((value) =>
                  // print("Fetched ==>>>"+value.data["username"])),
                  
                  
                  
                            
                             

                              
                  
                             
                            //  Image.network(downloadURL.toString())





                                  // StorageReference imageLink = storage.ref().child(documentSnapshot['imageurl']);
                                  // final imageUrl = await imageLink.getDownloadUrl();
                                  // Image.network(imageUrl.toString());
                                  
                        //                 Image.network(firebase_storage.FirebaseStorage.instance
                        // .ref('gs://authentiicate.appspot.com/usersImages')
                        // .child(".png")
                        // .getDownloadURL();
                        // ),
                          
                          
                          
                          
                       Table(  
                    defaultColumnWidth: FixedColumnWidth(120.0),  
                    border: TableBorder.all(  
                        color: Colors.black,  
                        style: BorderStyle.solid,  
                        width: 2),  
                    children: [  
                      TableRow( children: [  
                        Column(children:[Text('Occupied', style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text('Total', style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text('Vacant', style: TextStyle(fontSize: 20.0))]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[Text('32')]),  
                        Column(children:[Text('4')]),  
                        Column(children:[Text('36')]),  
                      ]),  
                      
                     
                    ],  
                  ),  
                
                            
                        ],
                      ),
                    ),
                   
                  ],
                ),
            ),
            
            
            
            

             ),
             
          ),

         ]),
    );
  }
}