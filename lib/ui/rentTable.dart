import 'dart:io';
import 'package:authh_app/ui/rent_details.dart';
import 'package:authh_app/ui/update_agreement_doc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:number_to_character/number_to_character.dart';
// import 'file_handle_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
// import 'package:open_file/open_file.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart';
// import 'file_handle_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class RentPdfInvoiceApi {
  static Future<File> generate( {required pdfdocs pdfdoc}) async {
    // final font = await rootBundle.load("assets/allura/Allura-Regular.ttf");
    // var data = await rootBundle.load("assets/open-sans.ttf");
//   final font = await rootBundle.load("assets/open-sans.ttf");
// final ttf = Font.ttf(font);


    String jan=pdfdoc.jan;
    String feb=pdfdoc.feb;
    String mar=pdfdoc.mar;
    String apr=pdfdoc.apr;
    String may=pdfdoc.may;
    String jun=pdfdoc.jun;
    String jul=pdfdoc.jul;
    String aug=pdfdoc.aug;
    String sept=pdfdoc.sept;
    String oct=pdfdoc.oct;
    String nov=pdfdoc.nov;
    String dec=pdfdoc.dec;

    String janRent=pdfdoc.janRent;
    String febRent=pdfdoc.febRent;
    String marRent=pdfdoc.marRent;
    String aprRent=pdfdoc.aprRent;
    String mayRent=pdfdoc.mayRent;
    String junRent=pdfdoc.junRent;
    String julRent=pdfdoc.julRent;
    String augRent=pdfdoc.augRent;
    
    String septRent=pdfdoc.septRent;
    String octRent=pdfdoc.octRent;
    String novRent=pdfdoc.novRent;
    String decRent=pdfdoc.decRent;
    // double TotalRent=double.parse(if(janRent=""))+double.parse(febRent!)+double.parse(marRent!)+double.parse(aprRent!)+double.parse(mayRent!)+double.parse(junRent!)+double.parse(julRent!)+double.parse(augRent!)+double.parse(septRent!)+double.parse(octRent!)+double.parse(novRent!)+double.parse(decRent!);
    final pdf = pw.Document();

    // final iconImage =
    //     (await rootBundle.load('assets/icon.png')).buffer.asUint8List();

    final tableHeaders = [
      'Month',
      'Rent',
      'Paid_On'

    ];

    final tableData = [
      [
        'JAN',
        '$jan',
        '$janRent',
        
      ],
      [
        'FEB',
        '$feb',
        '$febRent',
        
      ],
      [
        'MAR',
        '$mar',
        '$marRent',
      
      ],
      [
        'APR',
        '$apr',
        '$aprRent',
        
      ],
      [
        'MAY',
        '$may',
        '$mayRent',
      
      ],
      [
        'JUN',
        '$jun',
        '$junRent',
      
      ],
      [
        'JUL',
        '$jul',
        '$julRent',
       
      ],
      [
        'AUG',
        '$aug',
        '$augRent',
       
      ],
      [
        'SEPT',
        '$sept',
        '$septRent',
       
      ],
      [
        'OCT',
        '$oct',
        '$octRent',
       
      ],
      [
        'NOV',
        '$nov',
        '$novRent',
       
      ],
      [
        'DEC',
        '$dec',
        '$decRent',
       
      ],
    ];

    pdf.addPage(
      pw.MultiPage(
        // header: (context) {
        //   return pw.Text(
        //     'Flutter Approach',
        //     style: pw.TextStyle(font: ttf,
        //       fontWeight: pw.FontWeight.bold,
        //       fontSize: 15.0,
        //     ),
        //   );
        // },
        build: (context) {
          return [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                // pw.Image(
                //   pw.MemoryImage(iconImage),
                //   height: 72,
                //   width: 72,
                // ),
                // pw.SizedBox(width: 1 * PdfPageFormat.mm),
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'RENTAL HISTORY',
                      style: pw.TextStyle(
                        fontSize: 17.0,
                        // fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    

                  ],
                ),
                // pw.Spacer(),
               
              ],
            ),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Divider(),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            // pw.Text(
            //   'Dear John,\nLorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum? Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut? Impedit sit sunt quaerat, odit, tenetur error',
            //   textAlign: pw.TextAlign.justify,
            // ),
            pw.SizedBox(height: 5 * PdfPageFormat.mm),

            ///
            /// PDF Table Create
            ///
            pw.Table.fromTextArray(
              headers: tableHeaders,
              data: tableData,
              border: null,
              headerStyle:
                  pw.TextStyle( ),
              headerDecoration:
                  const pw.BoxDecoration(color: PdfColors.grey300),
              cellHeight: 40.0,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.centerRight,
                2: pw.Alignment.centerRight,
                3: pw.Alignment.centerRight,
                4: pw.Alignment.centerRight,
              },
            ),
            pw.Divider(),
            pw.Container(
              alignment: pw.Alignment.centerRight,
              child: pw.Row(
                children: [
                  pw.Spacer(flex: 6),
                  pw.Expanded(
                    flex: 4,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        // pw.Row(
                        //   children: [
                        //     pw.Expanded(
                        //       child: pw.Text(
                        //         'Net total',
                        //         style: pw.TextStyle(
                                  
                        //           fontWeight: pw.FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //     pw.Text(
                        //       '\$ 464',
                        //       style: pw.TextStyle(
                                
                        //         fontWeight: pw.FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // pw.Row(
                        //   children: [
                        //     pw.Expanded(
                        //       child: pw.Text(
                        //         'Vat 19.5 %',
                        //         style: pw.TextStyle(
                                 
                        //           fontWeight: pw.FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //     pw.Text(
                        //       '\$ 90.48',
                        //       style: pw.TextStyle(
                                
                        //         fontWeight: pw.FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // pw.Divider(),
                        // pw.Row(
                        //   children: [
                        //     pw.Expanded(
                        //       child: pw.Text(
                        //         'Total amount due',
                        //         style: pw.TextStyle(
                                  
                        //           fontSize: 14.0,
                        //           fontWeight: pw.FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //     pw.Text(
                        //       TotalRent.toString(),
                        //       style: pw.TextStyle(
                                
                        //         fontWeight: pw.FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // pw.SizedBox(height: 2 * PdfPageFormat.mm),
                        // pw.Container(height: 1, color: PdfColors.grey400),
                        // pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
                        // pw.Container(height: 1, color: PdfColors.grey400),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        // footer: (context) {
          // return pw.Column(
          //   mainAxisSize: pw.MainAxisSize.min,
          //   children: [
          //     pw.Divider(),
          //     pw.SizedBox(height: 2 * PdfPageFormat.mm),
          //     pw.Text(
          //       'Flutter Approach',
          //       style: pw.TextStyle( fontWeight: pw.FontWeight.bold),
          //     ),
          //     pw.SizedBox(height: 1 * PdfPageFormat.mm),
          //     pw.Row(
          //       mainAxisAlignment: pw.MainAxisAlignment.center,
          //       children: [
          //         pw.Text(
          //           'Address: ',
          //           style:
          //               pw.TextStyle( fontWeight: pw.FontWeight.bold),
          //         ),
          //         pw.Text(
          //           'Merul Badda, Anandanagor, Dhaka 1212',
          //         ),
          //       ],
          //     ),
          //     pw.SizedBox(height: 1 * PdfPageFormat.mm),
          //     pw.Row(
          //       mainAxisAlignment: pw.MainAxisAlignment.center,
          //       children: [
          //         pw.Text(
          //           'Email: ',
          //           style:
          //               pw.TextStyle( fontWeight: pw.FontWeight.bold),
          //         ),
          //         pw.Text(
          //           'flutterapproach@gmail.com',
          //         ),
          //       ],
          //     ),
          //   ],
          // );
        // },
      ),
    );

    return FileHandleApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }
}


class FileHandleApi {
  // save pdf file function
  static Future<File> saveDocument({
    required String name,
    required pw.Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  // open pdf file function
  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}