// import 'dart:io';
// import 'package:flutter/services.dart';
// // import 'file_handle_api.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';
// // import 'package:open_file/open_file.dart';
// import 'package:open_file/open_file.dart';

// class PdfInvoiceApi {
//   static Future<File> generate() async {
//     final pdf = pw.Document();

//     // final iconImage =
//     //     (await rootBundle.load('assets/icon.png')).buffer.asUint8List();

//     final tableHeaders = [
//       'Description',
//       'Quantity',
//       'Unit Price',
//       'VAT',
//       'Total',
//     ];

//     final tableData = [
//       [
//         'Coffee',
//         '7',
//         '\$ 5',
//         '1 %',
//         '\$ 35',
//       ],
//       [
//         'Blue Berries',
//         '5',
//         '\$ 10',
//         '2 %',
//         '\$ 50',
//       ],
//       [
//         'Water',
//         '1',
//         '\$ 3',
//         '1.5 %',
//         '\$ 3',
//       ],
//       [
//         'Apple',
//         '6',
//         '\$ 8',
//         '2 %',
//         '\$ 48',
//       ],
//       [
//         'Lunch',
//         '3',
//         '\$ 90',
//         '12 %',
//         '\$ 270',
//       ],
//       [
//         'Drinks',
//         '2',
//         '\$ 15',
//         '0.5 %',
//         '\$ 30',
//       ],
//       [
//         'Lemon',
//         '4',
//         '\$ 7',
//         '0.5 %',
//         '\$ 28',
//       ],
//     ];

//     pdf.addPage(
//       pw.MultiPage(
//         // header: (context) {
//         //   return pw.Text(
//         //     'Flutter Approach',
//         //     style: pw.TextStyle(
//         //       fontWeight: pw.FontWeight.bold,
//         //       fontSize: 15.0,
//         //     ),
//         //   );
//         // },
//         build: (context) {
//           return [
//             pw.Row(
//               children: [
//                 // pw.Image(
//                 //   pw.MemoryImage(iconImage),
//                 //   height: 72,
//                 //   width: 72,
//                 // ),
//                 pw.SizedBox(width: 1 * PdfPageFormat.mm),
//                 pw.Column(
//                   mainAxisSize: pw.MainAxisSize.min,
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text(
//                       'AGREEMENT CONTRACT',
//                       style: pw.TextStyle(
//                         fontSize: 17.0,
//                         fontWeight: pw.FontWeight.bold,
//                       ),
//                     ),
//                     pw.Container(
//                     width: 350,
//                     child:pw.Text(
//                       'THIS AGREEMENT CONTRACT DATED THIS DAY 7 OF DECEMBER BETWEEN NATURES CLOSET PRIVATE LIMITED.',
//                       style: const pw.TextStyle(
//                         fontSize: 10.0,
//                         color: PdfColors.grey700,
//                       ),
//                     )
//                     ,)

//                   ],
//                 ),
//                 pw.Spacer(),
//                 pw.Column(
//                   mainAxisSize: pw.MainAxisSize.min,
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text(
//                       'Wasim khan',
//                       style: pw.TextStyle(
//                         fontSize: 15.5,
//                         fontWeight: pw.FontWeight.bold,
//                       ),
//                     ),
//                     pw.Text(
//                       'wasim@gmail.com',
//                     ),
//                     pw.Text(
//                       DateTime.now().toString(),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             pw.SizedBox(height: 1 * PdfPageFormat.mm),
//             pw.Divider(),
//             pw.SizedBox(height: 1 * PdfPageFormat.mm),
//             pw.Text(
//               'Dear Wasim ,\nLorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error',
//               textAlign: pw.TextAlign.justify,
//             ),
//             pw.SizedBox(height: 5 * PdfPageFormat.mm),
//             pw.Text(
//                       'Commencement Date and Term ',
//                       style: pw.TextStyle(
//                         fontSize: 15.5,
//                         fontWeight: pw.FontWeight.bold,
//                       ),
//                     ),
            
//             pw.Text(
//               'The Employee will commence Internship with the Employer on the 11th August, 2022 (the "Commencement Date")' ,
//               textAlign: pw.TextAlign.justify,
//             ),
//             pw.Text(
//                       'Confidentiality',
//                       style: pw.TextStyle(
//                         fontSize: 15.5,
//                         fontWeight: pw.FontWeight.bold,
//                       ),
//                     ),
//              pw.Text(
//               'The Employee acknowledges that, in any position the Employee may hold, in and as a result of the Employees employment by the Employer, the Employee will, or may, be making use of, acquiring or adding to information which is confidential to the Employer (the "Confidential Information") and the Confidential Information is the exclusive property of the Employer.The Confidential Information will include all data and information stored in application or cloud and data relating to the business and management of the Employer, including but not limited to, proprietary and trade secret technology and accounting records to which access obtained by the Employee, including Work Product, Computer Software, Other Proprietary Data, Business Operations, Marketing and Development Operations, and Customer Information.Customer Information means customer information, including but not limited to, names of customers and their representatives, contracts and their contents and parties, customer services, data provided by customers and the type, quantity and specifications of products and services purchased, leased, licensed or received by customers of the Employer are subjected to confidentiality clause. ' ,
//               textAlign: pw.TextAlign.justify,
//             ),
//             pw.Text(
//                       'N WITNESS WHEREOF, the parties have duly affixed their signatures under hand and seal on this 7 day of December, 2022. ',
//                       style: pw.TextStyle(
//                         fontSize: 15.5,
//                         fontWeight: pw.FontWeight.bold,
//                       ),
//                     ),
                    
//             ///
//             /// PDF Table Create
//             ///
//             // pw.Table.fromTextArray(
//             //   headers: tableHeaders,
//             //   data: tableData,
//             //   border: null,
//             //   headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//             //   headerDecoration:
//             //       const pw.BoxDecoration(color: PdfColors.grey300),
//             //   cellHeight: 30.0,
//             //   cellAlignments: {
//             //     0: pw.Alignment.centerLeft,
//             //     1: pw.Alignment.centerRight,
//             //     2: pw.Alignment.centerRight,
//             //     3: pw.Alignment.centerRight,
//             //     4: pw.Alignment.centerRight,
//             //   },
//             // ),
//             pw.Divider(),
//             // pw.Container(
//             //   alignment: pw.Alignment.centerRight,
//             //   child: pw.Row(
//             //     children: [
//             //       pw.Spacer(flex: 6),
//             //       pw.Expanded(
//             //         flex: 4,
//             //         child: pw.Column(
//             //           crossAxisAlignment: pw.CrossAxisAlignment.start,
//             //           children: [
//             //             pw.Row(
//             //               children: [
//             //                 pw.Expanded(
//             //                   child: pw.Text(
//             //                     'Net total',
//             //                     style: pw.TextStyle(
//             //                       fontWeight: pw.FontWeight.bold,
//             //                     ),
//             //                   ),
//             //                 ),
//             //                 pw.Text(
//             //                   '\$ 464',
//             //                   style: pw.TextStyle(
//             //                     fontWeight: pw.FontWeight.bold,
//             //                   ),
//             //                 ),
//             //               ],
//             //             ),
//             //             pw.Row(
//             //               children: [
//             //                 pw.Expanded(
//             //                   child: pw.Text(
//             //                     'Vat 19.5 %',
//             //                     style: pw.TextStyle(
//             //                       fontWeight: pw.FontWeight.bold,
//             //                     ),
//             //                   ),
//             //                 ),
//             //                 pw.Text(
//             //                   '\$ 90.48',
//             //                   style: pw.TextStyle(
//             //                     fontWeight: pw.FontWeight.bold,
//             //                   ),
//             //                 ),
//             //               ],
//             //             ),
//             //             pw.Divider(),
//             //             pw.Row(
//             //               children: [
//             //                 pw.Expanded(
//             //                   child: pw.Text(
//             //                     'Total amount due',
//             //                     style: pw.TextStyle(
//             //                       fontSize: 14.0,
//             //                       fontWeight: pw.FontWeight.bold,
//             //                     ),
//             //                   ),
//             //                 ),
//             //                 pw.Text(
//             //                   '\$ 554.48',
//             //                   style: pw.TextStyle(
//             //                     fontWeight: pw.FontWeight.bold,
//             //                   ),
//             //                 ),
//             //               ],
//             //             ),
//             //             pw.SizedBox(height: 2 * PdfPageFormat.mm),
//             //             pw.Container(height: 1, color: PdfColors.grey400),
//             //             pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
//             //             pw.Container(height: 1, color: PdfColors.grey400),
//             //           ],
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//           ];
//         },
//         footer: (context) {
//           return pw.Column(
//             mainAxisSize: pw.MainAxisSize.min,
//             children: [
//               pw.Divider(),
//               pw.SizedBox(height: 2 * PdfPageFormat.mm),
//               pw.Text(
//                 'Property 001',
//                 style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//               ),
//               pw.SizedBox(height: 1 * PdfPageFormat.mm),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'Address:gandhi nagar ',
//                     style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                   ),
//                   pw.Text(
//                     'Merul Badda, Anandanagor,bengaluru 1212',
//                   ),
//                 ],
//               ),
//               pw.SizedBox(height: 1 * PdfPageFormat.mm),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'Email: ',
//                     style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                   ),
//                   pw.Text(
//                     'abc@gmail.com',
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );

//     return FileHandleApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
//   }
// }
// class FileHandleApi {
//   // save pdf file function
//   static Future<File> saveDocument({
//     required String name,
//     required pw.Document pdf,
//   }) async {
//     final bytes = await pdf.save();

//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/$name');
//     await file.writeAsBytes(bytes);
//     return file;
//   }

//   // open pdf file function
//   static Future openFile(File file) async {
//     final url = file.path;

//     await OpenFile.open(url);
//   }
// }
