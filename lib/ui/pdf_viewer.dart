

// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';



// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_file_manager/flutter_file_manager.dart';
// import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
// import 'package:path_provider_ex/path_provider_ex.dart';

// class PDFViewer extends StatefulWidget {
//   const PDFViewer({Key? key}) : super(key: key);

//   @override
//   State<PDFViewer> createState() => _PDFViewerState();
// }

// class _PDFViewerState extends State<PDFViewer> {
//    var files;
 
//  List<dynamic> filesList = [];
//  Future listDir() async {
// Directory dir =  Directory(
//     '/storage/emulated/0/pdf_viewer');

// await for (FileSystemEntity entity
//     in dir.list(recursive: true, followLinks: false)) {
//   FileSystemEntityType type = await FileSystemEntity.type(entity.path);
//   if (type == FileSystemEntityType.file &&
//       entity.path.endsWith('.pdf')) {
//     filesList.add(entity.path);
//   }
// }
// }
// Future<File?> pickFile() async {
//   final result = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions: ['pdf'],
//   );
//   if (result == null) return null;
//   return File(result.paths.first ?? '');
// }
// @override
//   void initState() {
   
//       //call getFiles() function on initial state. 
//     super.initState();
//     listDir();
//   }

// Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:Text("PDF File list from SD Card"),
//         backgroundColor: Colors.redAccent
//       ),
//       body:filesList == null? Text("Searching Files"):
      
//            ListView.builder(  //if file/folder list is grabbed, then show here
//               itemCount: filesList.length,
//               itemBuilder: (context, index) {
//                     return Card(
//                       child:ListTile(
//                          title: Text(filesList[index].path.split('/').last),
//                          leading: Icon(Icons.picture_as_pdf),
//                          trailing: Icon(Icons.arrow_forward, color: Colors.redAccent,),
//                          onTap: (){
//                            Navigator.push(context, MaterialPageRoute(builder: (context){
//                              return ViewPDF(pathPDF:filesList[index].path.toString());
//                              //open viewPDF page on click
//                            }));
//                          },
//                       )
//                     );
//               },
//           )
//     );
//   }
// }

// class ViewPDF extends StatelessWidget {
//   String pathPDF = "";
//   // ignore: use_key_in_widget_constructors
//   ViewPDF({required this.pathPDF});

//   @override
//   Widget build(BuildContext context) {
//     return PDFViewerScaffold( //view PDF 
//         appBar: AppBar(
//           title: Text("Document"),
//           backgroundColor: Colors.deepOrangeAccent,
//         ),
//         path: pathPDF
//     );
//   }
// }