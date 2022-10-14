import 'dart:io';
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


class PdfInvoiceApi {
  static Future<File> generate({required Agremeent_info agreemment_info}) async {
    final pdf = pw.Document();
    
    DateTime now=DateTime.now();

    int day=now.day;
    int month=now.month;
    int year=now.year;
    
   String Agr_City=agreemment_info.Agr_City;
  String Agr_State=agreemment_info.Agr_State;
  String LandLord_Name=agreemment_info.LandLord_Name;
  String Landlord_Address=agreemment_info.Landlord_Address;
  String Landlord_City=agreemment_info.Landlord_City;
  String Landlord_State=agreemment_info.Landlord_State;
  String Landlord_PinCode=agreemment_info.Landlord_PinCode;


    String Landlord_Address2=agreemment_info.Landlord_Address2;
  String Landlord_City2=agreemment_info.Landlord_City2;
  String Landlord_State2=agreemment_info.Landlord_State2;
    String Landlord_PinCode2=agreemment_info.Landlord_PinCode2;

    String Tenant_Name=agreemment_info.Tenant_Name;
  String Tenant_Address=agreemment_info.Tenant_Address;
  String Tenant_City=agreemment_info.Tenant_City;
  String Tenant_State=agreemment_info.Tenant_State;
    String Tenant_PinCode=agreemment_info.Tenant_PinCode;
    String Tenant_Address2=agreemment_info.Tenant_Address2;
  String Tenant_City2=agreemment_info.Tenant_City2;
  String Tenant_State2=agreemment_info.Tenant_State2;
  String Tenant_PinCode2=agreemment_info.Tenant_PinCode2;
    
    String Firm_Name=agreemment_info.Firm_Name;
    String GST_Number=agreemment_info.GST_Number;
    String Firm_Address=agreemment_info.Firm_Address;
  String Firm_City=agreemment_info.Firm_City;
  String Firm_State=agreemment_info.Firm_State;
  String Firm_PinCode=agreemment_info.Firm_PinCode;

    String Property_Address=agreemment_info.Property_Address;
  String Property_City=agreemment_info.Property_City;
  String Property_State=agreemment_info.Property_State;
  String Property_PinCode=agreemment_info.Property_PinCode;


  String Bathroom=agreemment_info.Bathroom;
  String Bedroom=agreemment_info.Bedroom;
  String CarPark=agreemment_info.CarPark;

  String SquareFeet=agreemment_info.SquareFeet;
  String Rent_Value=agreemment_info.Rent_Value;

  String _LockinPeriod= agreemment_info.LockinPeriod;
String _Rent_Escalation = agreemment_info.Rent_Escalation;
String _Notice_Period = agreemment_info.Notice_Period;
String _Termination_Period = agreemment_info.Termination_Period;
String _K_Number = agreemment_info.K_Number;
String _Starting_Meter_Reading = agreemment_info.Starting_Meter_Reading;

String Witness1_Name=agreemment_info.Witness1_Name;
  String Witness1_Address=agreemment_info.Witness1_Address;
  String Witness1_City=agreemment_info.Witness1_City;
  String Witness1_State=agreemment_info.Witness1_State;

  String Witness2_Name=agreemment_info.Witness2_Name;
  String Witness2_Address=agreemment_info.Witness2_Address;
  String Witness2_City=agreemment_info.Witness2_City;
  String Witness2_State=agreemment_info.Witness2_State;

  String Item1=agreemment_info.Item1;
  String Item2=agreemment_info.Item2;
  String Item3=agreemment_info.Item3;

  String Start_Date=agreemment_info.Start_Date;
  String End_Date=agreemment_info.End_Date;
  String Property_Type=agreemment_info.PropertyType;

   var a = DateTime.utc(int.parse(Start_Date.substring(0,4)),int.parse(Start_Date.substring(5,7)), int.parse(Start_Date.substring(8,10)));
  var b = DateTime.utc(int.parse(End_Date.substring(0,4)),int.parse(End_Date.substring(5,7)), int.parse(End_Date.substring(8,10)));
    var years = a.difference(b);
  print(years.inDays~/30 );
  String LeaseTerm=(years.inDays~/30).toString();


  var converter = NumberToCharacterConverter('en');
  String Rupeesin_Words=converter.convertDouble(double.parse(Rent_Value.toString()));
  String Security_Deposit=(double.parse(Rent_Value.toString())*3).toString();
   String SecurityDepositin_Words=converter.convertDouble(double.parse(Rent_Value.toString())*3);
  

    var collection = FirebaseFirestore.instance.collection('property_main');
    // var docSnapshot = await collection.doc(docId).get();
    // if (docSnapshot.exists) {
    //   Map<String, dynamic> data = docSnapshot.data()!;
    //   Propertyname= data["Property_Details"]['Property_name'];
    //   Carpet_Area=data["Property_Details"]['Carpet_Area'];
    //   Floor=data["Property_Details"]['Floor'];
    //   Rent=data["Property_Details"]["Rent"];
    //   Asset=data["Property_Details"]["Asset"];
    
      
    // }
   
  

    // final iconImage =
    //     (await rootBundle.load('assets/icon.png')).buffer.asUint8List();


    pdf.addPage(
      pw.MultiPage(
        // header: (context) {
        //   return pw.Text(
        //     'Flutter Approach',
        //     style: pw.TextStyle(
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
                      'RENTAL AGREEMENT',
                      style: pw.TextStyle(
                        fontSize: 17.0,
                        fontWeight: pw.FontWeight.bold,
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
            pw.Text(
              'This agreement made at $Agr_City, $Agr_State on this $day, $month, $year between $LandLord_Name, residing at $Landlord_Address,$Landlord_Address2 $Landlord_City, $Landlord_State hereinafter referred to as the `LESSOR` of the One Part AND $Tenant_Name, residing at  $Tenant_Address,$Tenant_Address2 $Tenant_City, $Tenant_State under $Firm_Name  with $GST_Number having a registered office at $Firm_Address, $Firm_City, $Firm_State hereinafter referred to as the `LESSEE` of the other Part;',
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 5 * PdfPageFormat.mm),
            
            
            pw.Text(
              'WHEREAS the Lessor is the lawful owner of, and otherwise well sufficiently entitled to $Property_Address, $Property_City, $Property_State falling in the category, $Property_Type Property and comprising of $Bedroom Bedrooms, $Bathroom Bathrooms, $CarPark Carparks with an extent of  $Property_Type space of$CarPark Square Feet hereinafter referred to as the `said premises`; ' ,
              textAlign: pw.TextAlign.justify,
            ),
          
             pw.Text(
              'AND WHEREAS at the request of the Lessee, the Lessor has agreed to let the said premises to the tenant for a term of $LeaseTerm months commencing from $Start_Date in the manner hereinafter appearing. Total lease period is $LeaseTerm months.' ,
              textAlign: pw.TextAlign.justify,
            ),
             pw.Text(
              '. Intentional space\n - \n -\n -',
              textAlign: pw.TextAlign.justify,
            ),
             pw.Text(
              'NOW THIS AGREEMENT WITNESSETH AND IT IS HEREBY AGREED BY AND BETWEEN THE PARTIES AS UNDER:' ,
              textAlign: pw.TextAlign.justify,
              
            ),
             pw.Text(
              'For the said Premises, The Lessee will pay a sum of [3, months] of Security deposit [eg. INR $Security_Deposit/- (Indian Rupees $SecurityDepositin_Words only)] interest free refundable security deposit (Security Deposit). The Rent payable by the Lessee to the Lessor from the Rent Commencement Date shall be [Rent eg. INR $Rent_Value /- (Indian Rupees $Rupeesin_Words only)] (Rent) per month. Further, the lease term is $LeaseTerm months out of which there s a Lock-In of $_LockinPeriod months. The Parties agree that the Rent shall be escalated by $_Rent_Escalation% at the end of every 11 months on the last paid Rent.' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.Spacer(),
             pw.Text(
              '1 .	That the Lessor hereby grant to the Lessee, the right to enter into and use and remain in the said premises along with the existing fixtures and fittings listed in Annexure 1 to this Agreement and that the Lessee shall be entitled to peacefully possess, and enjoy possession of the said premises, and the other rights herein.' ,
              textAlign: pw.TextAlign.justify,
            ),        
            pw.SizedBox(height: 2* PdfPageFormat.mm),
             pw.Text(
              '2 .	That the lease hereby granted shall, unless cancelled earlier under any provision of this Agreement, remain in force for a period of $LeaseTerm. ' ,
              textAlign: pw.TextAlign.justify,
              
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
             pw.Text(
              '3 . 	That the Lessee will have the option to terminate this lease by giving $_Notice_Period months in writing to the Lessor.' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),

             pw.Text(
              '4 .	That the Lessee shall have no right to create any sub-lease or assign or transfer in any manner the lease or give to any one the possession of the said premises or any part thereof.' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
              pw.Text(
              '5 .	That the Lessee shall use the said premises only for $Property_Type - Property type purposes.' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
              pw.Text(
              '6 .	That the Lessor shall, before handing over the said premises, ensure the working of sanitary, electrical and water supply connections and other fittings pertaining to the said premises. It is agreed that it shall be the responsibility of the Lessor for their return in the working condition at the time of re-possession of the said premises (reasonable wear and tear and loss or damage by fire, flood, rains, accident, irresistible force or act of God excepted). Any damage any negligence of tenant to the premise will attract and that shall be recovered from Lessee' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
              pw.Text(
              '7 .	That the Lessee is not authorized to make any alteration in the construction of the said premises. The Lessee may however install and remove his own fittings and fixtures, provided this is done without causing any excessive damage or loss to the said premise and proper consent is taken from the Lessor in writing.' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
              pw.Text(
              '8 .	That the day to day repair jobs such as fuse blow out, replacement of light bulbs/tubes, leakage of water taps, maintenance of the water pump and other minor repairs, etc., shall be effected by the Lessee at its own cost, and any major repairs, either structural or to the electrical or water connection, plumbing leaks, water seepage shall be attended to by the Lessor. Considering it is not caused due to negligence of the Lessee. ' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
              pw.Text(
              '9 .	That the Lessor or its duly authorized agent shall have the right to enter into or upon the said premises or any part thereof at a mutually arranged convenient time for the purpose of inspection. ' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
              pw.Text(
              '10 .	That the Lessee shall use the said premises along with its fixtures and fitting in careful and responsible manner and shall handover the premises to the Lessor in working condition (reasonable wear and tear and loss or damage by fire, flood, rains, accidents, irresistible force or act of God excepted).' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
              pw.Text(
              '11 . That in consideration of use of the said premises the Lessee agrees that he shall pay to the Lessor during the period of this agreement, a monthly rent at the rate of [Monthly Rental in Number & Words]. The amount will be paid in advance on or before the date of [1st day] of every English calendar month and a grace period of 2 days will be given, on failure of which The Tenant will be charged an additional amount of 1% of Monthly Rent charged daily till the rent is paid along with the penalty on any rent or other money lawfully due which is in arrears for more than ten days after the day on which it became due. ' ,
              textAlign: pw.TextAlign.justify,

            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
              pw.Text(
              '12 .	It is hereby agreed that if default is made by the lessee in payment of the rent for a period of one months, or in observance and performance of any of the covenants and stipulations hereby contained and on the part to be observed and performed by the lessee, then on such default, the lessor shall be entitled in addition to or in the alternative to any other remedy that may be available to him at this discretion, to terminate the lease and eject the lessee from the said premises; and to take possession thereof as full and absolute owner thereof, provided that a notice in verbal or writing shall be given by the lessor to the lessee of his intention to terminate the lease and to take possession of the said premises. If the arrears of rent are paid or the lessee comply with or carry out the covenants and conditions or stipulations, within [seven] days from the service of such notice, then the lessor shall not be entitled to take possession of the said premises.' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
              pw.Text(
              '13 .	That in addition to the compensation mentioned above, the Lessee shall pay the actual electricity, shared maintenance, water, telephone, internet and cable  bills and any charges and taxes applicable  for the period of the agreement directly to the authorities concerned. Lessee is responsible for the direct payment of the following utilities and other charges in relation to the Premises. Upon failure to do so will attract a penalty charged as additional amount of 1% of Monthly Rent charged daily.  The relevant `start date` meter readings having a [K Number] is [Starting Meter Reading]. ' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
            pw.Text(
              '14 .	The Tenant will also directly pay for the following utilities and other charges in relation to the Premises: Any damages to property ; Any legal charges ; Any changes in the Tax Code (GST / VAT) ; Any other property related expenses. ' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
            pw.Text(
              '15 .	The Tenant may erect, install and maintain a sign of a kind and size in a location, all in accordance with the Landlords design criteria for the Building and as first approved in writing by the Landlord. All other signs, as well as the advertising practices of the Tenant, will comply with all applicable rules and regulations of the Lessor. The Tenant will not erect, install or maintain any sign other than in accordance with this section.' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
            pw.Text(
              '16 .	That the Lessee has paid to the Lessor a sum of $Rupeesin_Words as deposit, free of interest, which the Lessor does accept and acknowledge. This deposit is for the due performance and observance of the terms and conditions of this Agreement. The deposit shall be returned to the Lessee simultaneously with the Lessee vacating the said premises after deducting the amount for penalty (if any). In the event of failure on the part of the Lessor to refund the said deposit amount to the Lessee as aforesaid, the Lessee shall be entitled to continue to use and occupy the said premises without payment of any rent until the Lessor refunds the said amount (without prejudice to the Lessee`s rights and remedies in law to recover the deposit). ' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
            pw.Text(
              '17 .	The Parties agree that the Rent shall be escalated by $_Rent_Escalation% at the end of every 11 months on the last paid Rent.' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
            pw.Text(
              '18 . The Lessee is hereby advised and understands that the personal property of the Lessee is not insured by the Lessor for either damage or loss, and the Lessor assumes no liability for any such loss. The Lessee is advised that, if insurance coverage is desired by the Lessee, the Lessee should inquire of Lessees insurance agent regarding a Lessees policy of insurance.' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
            pw.Text(
              '19 .	That the Lessor shall be responsible for the payment of all taxes and levies pertaining to the said premises including but not limited to House Tax, Property Tax, other cesses, if any, and any other statutory taxes, levied by the Government or Governmental Departments. During the term of this Agreement, the Lessor shall comply with all rules, regulations and requirements of any statutory authority, local, state and central government and governmental departments in relation to the said premises.' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
            pw.Text(
              '20 .	 In the event of any sale, transfer or lease by the Lessor of the Building or any interest in the Building or portion of the Building containing the Premises or assignment by the Lessor of this Lease or any interest of the Lessor in the Lease to the extent that the purchaser, transferee, Lessee or assignee assumes the covenants and obligations of the Lessor under this Lease, the Lessor will without further written agreement be freed and relieved of liability under such covenants and obligations. This Lease may be assigned by the Lessor to any mortgagee or encumbrancee of the Building as security. If there is a conflict between any provision of this Lease and the applicable to Jaipur jusrisdiction(the "Act"), the Act will prevail and such provisions of the Lease will be amended or deleted as necessary in order to comply with the Act. Further, any provisions that are required by the Act are incorporated into this Lease.' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
            pw.Text(
              '21 .	The Lessee would be responsible for any damage, injuries or death to humans or animals caused on the property during their stay at the property for whatever reasons such as, but not limited to, accident, theft, short circuit, fire, flood, act of god, etc. The Lessor under no circumstances can be held liable for the same. . In case of any Police Reports / FIR / Cases / Any other legal obligation - the Lessee would be solely responsible for the same. ' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
            pw.Text(
              '22 .	If any injury or death happens after the completion or tenure due to Lessees leftover items / inability of the Lessee to clear the premises properly - the Lessee would be held liable for the same. ' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
            pw.Text(
              '23 .	If during the Term, title is taken to the whole or any part of the Building by any competent authority under the power of land acquisition, which taking, in the reasonable opinion of the Lessor, does not leave a sufficient remainder to constitute an economically viable building, the Lessor may at its option, terminate this Lease on the date possession is taken by or on behalf of such authority. Upon such termination, the Lessee will immediately deliver up possession of the Premises, Base Rent and any Additional Rent will be payable up to the date of such termination, and the Lessee will be entitled to be repaid by the Landlord any rent paid in advance and unearned or an appropriate portion of that rent. In the event of any such taking, the Lessee will have no claim upon the Landlord for the value of its property or the unexpired portion of the Term, but the Parties will each be entitled to separately advance their claims for compensation for the loss of their respective interests and to receive and retain such compensation as may be awarded to each respectively. If an award of compensation made to the Landlord specifically includes an award for the Lessee, the Landlord will account for that award to the Lessee and vice versa.' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
            pw.Text(
              '24 .	The Lessee will not engage in any illegal trade or activity on or about the Premises. ' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
           
            pw.Text(
              '25 .	The Lessee will not keep or have on the Premises any article or thing of a dangerous, flammable, or explosive character that might unreasonably increase the danger of fire on the Premises or that might be considered hazardous by any responsible insurance company. ' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
             pw.Text(
              '26 .	The Lessee will obey all rules and regulations posted by the Landlord regarding the use and care of the Building, parking lot and other common facilities that are provided for the use of the Lessee in and around the Building on the Premises. ' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
             pw.Text(
              '27 .	The Lessee will be charged an additional amount of Rs 500 for first dishonoured cheque or cheque returned by the Lessees financial institution and thereafter Rs 2000 for dishonoured cheque or cheque returned by the Lessees financial institution' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 2* PdfPageFormat.mm),
             pw.Text(
              '28 .	Nothing contained in this Lease is intended by the Parties to create a relationship of principal and agent, partnership, nor joint venture. The Parties intend only to create a relationship of landlord and tenant.' ,
              textAlign: pw.TextAlign.justify,
            ),
             pw.SizedBox(height: 2* PdfPageFormat.mm),
             pw.Text(
              'IN WITNESS WHEREOF, the parties hereto have set their hands on the day and year first hereinabove mentioned. ' ,
              textAlign: pw.TextAlign.justify,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
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
                      'Lessor,',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        // fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      '$LandLord_Name,',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        
                      ),
                    ),
                    pw.Text(
                      '$Landlord_Address,',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        
                      ),
                    ),
                    pw.Text(
                      '$Landlord_City,$Landlord_State,$Landlord_PinCode,',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        
                      ),
                    ),
                    pw.SizedBox(height: 2* PdfPageFormat.mm),
                    pw.Text(
                      'WITNESS ONE',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        // fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      '$Witness1_Name,',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        
                      ),
                    ),
                    pw.Text(
                      '$Witness1_Address,',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        
                      ),
                    ),
                    pw.Text(
                      '$Witness1_City,$Witness1_State',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        
                      ),
                    ),

                    
                    

                  ],
                ),
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Lessee,',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                     pw.Text(
                      '$Tenant_Name,',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        
                      ),
                    ),
                    pw.Text(
                      '$Tenant_Address,',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        
                      ),
                    ),
                    pw.Text(
                      '$Tenant_City,$Tenant_State,$Tenant_PinCode,',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        
                      ),
                    ),
                    pw.SizedBox(height: 2* PdfPageFormat.mm),
                    pw.Text(
                      'WITNESS TWO',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      '$Witness2_Name,',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        
                      ),
                    ),
                    pw.Text(
                      '$Witness2_Address,',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        
                      ),
                    ),
                    pw.Text(
                      '$Witness2_City,$Witness2_State',
                      style: pw.TextStyle(
                        fontSize: 10.0,
                        
                      ),
                    ),
                    

                  ],
                ),
                // pw.Spacer(),
               
              ],
            ),
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
                      'ANNEXURE 1',
                      style: pw.TextStyle(
                        fontSize: 17.0,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    

                  ],
                ),

                // pw.Spacer(),
               
              ],
            ),
            pw.SizedBox(height: 3* PdfPageFormat.mm),
             pw.Text(
              'List of fixtures and fittings provided in $Property_Address,$Property_City,$Property_State, $Property_PinCode:  ' ,
              textAlign: pw.TextAlign.justify,


            ),
            pw.Text(
              '1. $Item1  ' ,
              textAlign: pw.TextAlign.justify,

              
            ),
             pw.Text(
              '2. $Item2  ' ,
              textAlign: pw.TextAlign.justify,

              
            ),
              pw.Text(
              '3. $Item3  ' ,
              textAlign: pw.TextAlign.justify,

              
            ),



            ///
            ///
            /// PDF Table Create
            ///
            // pw.Table.fromTextArray(
            //   headers: tableHeaders,
            //   data: tableData,
            //   border: null,
            //   headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            //   headerDecoration:
            //       const pw.BoxDecoration(color: PdfColors.grey300),
            //   cellHeight: 30.0,
            //   cellAlignments: {
            //     0: pw.Alignment.centerLeft,
            //     1: pw.Alignment.centerRight,
            //     2: pw.Alignment.centerRight,
            //     3: pw.Alignment.centerRight,
            //     4: pw.Alignment.centerRight,
            //   },
            // ),
            // pw.Divider(),
            // pw.Container(
            //   alignment: pw.Alignment.centerRight,
            //   child: pw.Row(
            //     children: [
            //       pw.Spacer(flex: 6),
            //       pw.Expanded(
            //         flex: 4,
            //         child: pw.Column(
            //           crossAxisAlignment: pw.CrossAxisAlignment.start,
            //           children: [
            //             pw.Row(
            //               children: [
            //                 pw.Expanded(
            //                   child: pw.Text(
            //                     'Net total',
            //                     style: pw.TextStyle(
            //                       fontWeight: pw.FontWeight.bold,
            //                     ),
            //                   ),
            //                 ),
            //                 pw.Text(
            //                   '\$ 464',
            //                   style: pw.TextStyle(
            //                     fontWeight: pw.FontWeight.bold,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             pw.Row(
            //               children: [
            //                 pw.Expanded(
            //                   child: pw.Text(
            //                     'Vat 19.5 %',
            //                     style: pw.TextStyle(
            //                       fontWeight: pw.FontWeight.bold,
            //                     ),
            //                   ),
            //                 ),
            //                 pw.Text(
            //                   '\$ 90.48',
            //                   style: pw.TextStyle(
            //                     fontWeight: pw.FontWeight.bold,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             pw.Divider(),
            //             pw.Row(
            //               children: [
            //                 pw.Expanded(
            //                   child: pw.Text(
            //                     'Total amount due',
            //                     style: pw.TextStyle(
            //                       fontSize: 14.0,
            //                       fontWeight: pw.FontWeight.bold,
            //                     ),
            //                   ),
            //                 ),
            //                 pw.Text(
            //                   '\$ 554.48',
            //                   style: pw.TextStyle(
            //                     fontWeight: pw.FontWeight.bold,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             pw.SizedBox(height: 2 * PdfPageFormat.mm),
            //             pw.Container(height: 1, color: PdfColors.grey400),
            //             pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
            //             pw.Container(height: 1, color: PdfColors.grey400),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ];
        },
        // footer: (context) {
        //   return pw.Column(
        //     mainAxisSize: pw.MainAxisSize.min,
        //     children: [
        //       pw.Divider(),
        //       pw.SizedBox(height: 2 * PdfPageFormat.mm),
        //       pw.Text(
        //         'Property 001',
        //         style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //       ),
        //       pw.SizedBox(height: 1 * PdfPageFormat.mm),
        //       pw.Row(
        //         mainAxisAlignment: pw.MainAxisAlignment.center,
        //         children: [
        //           pw.Text(
        //             'Address:gandhi nagar ',
        //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //           ),
        //           pw.Text(
        //             'Merul Badda, Anandanagor,bengaluru 1212',
        //           ),
        //         ],
        //       ),
        //       pw.SizedBox(height: 1 * PdfPageFormat.mm),
        //       pw.Row(
        //         mainAxisAlignment: pw.MainAxisAlignment.center,
        //         children: [
        //           pw.Text(
        //             'Email: ',
        //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //           ),
        //           pw.Text(
        //             'abc@gmail.com',
        //           ),
        //         ],
        //       ),
        //     ],
        //   );
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
// class Agremeent_info{


//   final String  Agr_City;
//   final String  Agr_State;
//   final String  LandLord_Name;
//   final String  Landlord_Address;
//   final String  Landlord_City;
//   final String  Landlord_State;
//   final String  Landlord_Address2;
//   final String  Landlord_City2;
//   final String  Landlord_State2;

//   final String  Tenant_Name;
//   final String  Tenant_Address;
//   final String  Tenant_City;
//   final String  Tenant_State;
//   final String  Tenant_Address2;
//   final String  Tenant_City2;
//   final String  Tenant_State2;
//    final String  Firm_Address;
//   final String  Firm_City;
//   final String  Firm_State;
//    final String  Property_Address;
//   final String  Property_City;
//   final String  Property_State;

//   final String Bathroom;
//   final String Bedroom;
//   final String CarPark;

//   final String SquareFeet;
//   final String Rent_Value;
//   final String LockinPeriod;
// final String Rent_Escalation ;
// final String Notice_Period ;
// final String Termination_Period ;
// final String K_Number ;
// final String Starting_Meter_Reading ;

// final String Witness1_Name ;
//   final String Witness1_Address ;
//   final String Witness1_City ;
//   final String Witness1_State ;

//   final String Witness2_Name ;
//   final String Witness2_Address ;
//   final String Witness2_City ;
//   final String Witness2_State ;
//   Agremeent_info(this.Agr_City,this.Agr_State,this.LandLord_Name,this.Landlord_Address,this.Landlord_City,this.Landlord_State,this.Landlord_Address2,this.Landlord_City2,this.Landlord_State2,this.Tenant_Name,this.Tenant_Address,this.Tenant_City,this.Tenant_State,this.Tenant_Address2,this.Tenant_City2,this.Tenant_State2,this.Firm_Address,this.Firm_City,this.Firm_State,this.Property_Address,this.Property_City,this.Property_State,this.Bathroom,this.Bedroom,this.CarPark,this.SquareFeet,this.Rent_Value,this.LockinPeriod,this.Rent_Escalation,this.Notice_Period,this.Termination_Period,this.K_Number,this.Starting_Meter_Reading,this.Witness1_Name,this.Witness1_Address,this.Witness1_City,this.Witness1_State,this.Witness2_Name,this.Witness2_Address,this.Witness2_City,this.Witness2_State);


// }  