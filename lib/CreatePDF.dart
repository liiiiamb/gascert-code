import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWid;
import 'package:excel/excel.dart' as excel;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'SignUpScreen.dart';
import 'SignInScreen.dart';
import 'CreatePDF.dart';
import 'ForgPasswordScreen.dart';
import 'TestingScreen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

class CreatePDF extends StatefulWidget {
  final String uniqueID;

  const CreatePDF({Key? key, required this.uniqueID}) : super(key: key);

  @override
  _CreatePDFState createState() => _CreatePDFState();
}

class _CreatePDFState extends State<CreatePDF> {
  late String uniqueID;
  late String imagePath;
  List<Map<String, dynamic>> customersData = []; // List to hold customer data
  late Uint8List signatureBytes = Uint8List(0);

  Future<String> _getImagePathFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('UniqueID', uniqueID);

    return prefs.getString('ImagePath') ?? '';
    // Get stored image path or default empty string
  }

  @override
  void initState() {
    uniqueID = widget.uniqueID;
    super.initState();
    _fetchCustomersData();
    _getImagePathFromSharedPreferences().then((value) => setState(() {
          imagePath = value;
        }));
  }

  Future<void> _fetchCustomersData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('customers')
          .where('Report ID', isEqualTo: widget.uniqueID)
          .get();

      setState(() {
        // Store fetched documents' data as List<Map<String, dynamic>>
        customersData = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    } catch (e) {
      print("Error fetching data: $e");
      // Handle error accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => _createPdf(
            format, uniqueID, customersData, imagePath, signatureBytes),
      ),
    );
  }
}

Future<Uint8List> _createPdf(
  PdfPageFormat format,
  String userAddress,
  List<Map<String, dynamic>> customers,
  String imagePath,
  Uint8List? signatureBytes,
) async {
  final pdf = pdfWid.Document(
    version: PdfVersion.pdf_1_5,
    compress: true,
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String title = prefs.getString('title') ?? '';
  String firstName = prefs.getString('firstName') ?? '';
  String lastName = prefs.getString('lastName') ?? '';
  String post = prefs.getString('post') ?? '';
  String address = prefs.getString('address') ?? '';
  String town = prefs.getString('town') ?? '';
  String location = prefs.getString('location') ?? '';
  String type = prefs.getString('type') ?? '';
  String manafacturer = prefs.getString('manafacturer') ?? '';
  String model = prefs.getString('model') ?? '';
  String ownedBy = prefs.getString('ownedBy') ?? '';
  String applianceInspect = prefs.getString('applianceInspect') ?? '';
  String flueType = prefs.getString('flueType') ?? '';
  String opPress = prefs.getString('opPress') ?? '';
  String safetyCorrect = prefs.getString('safetyCorrect') ?? '';
  String satisfactory = prefs.getString('satisfactory') ?? '';
  String visual = prefs.getString('visual') ?? '';
  String termination = prefs.getString('termination') ?? '';
  String fluePerformance = prefs.getString('fluePerformance') ?? '';
  String applianceService = prefs.getString('applianceService') ?? '';
  String applianceSafe = prefs.getString('applianceSafe') ?? '';
  String CO1 = prefs.getString('CO1') ?? '';
  String CO2 = prefs.getString('CO2') ?? '';
  String ratio = prefs.getString('ratio') ?? '';
  String CO1_2 = prefs.getString('CO1_2') ?? '';
  String CO2_2 = prefs.getString('CO2_2') ?? '';
  String ratio_2 = prefs.getString('ratio_2') ?? '';
  String defects = prefs.getString('defects') ?? '';
  String remedial = prefs.getString('remedial') ?? '';
  String warningNotice = prefs.getString('warningNotice') ?? '';
  String location2 = prefs.getString('location2') ?? '';
  String type2 = prefs.getString('type2') ?? '';
  String manafacturer2 = prefs.getString('manafacturer2') ?? '';
  String model2 = prefs.getString('model2') ?? '';
  String ownedBy2 = prefs.getString('ownedBy2') ?? '';
  String applianceInspect2 = prefs.getString('applianceInspect2') ?? '';
  String flueType2 = prefs.getString('flueType2') ?? '';
  String opPress2 = prefs.getString('opPress2') ?? '';
  String safetyCorrect2 = prefs.getString('safetyCorrect2') ?? '';
  String satisfactory2 = prefs.getString('satisfactory2') ?? '';
  String visual2 = prefs.getString('visual2') ?? '';
  String termination2 = prefs.getString('termination2') ?? '';
  String fluePerformance2 = prefs.getString('fluePerformance2') ?? '';
  String applianceService2 = prefs.getString('applianceService2') ?? '';
  String applianceSafe2 = prefs.getString('applianceSafe2') ?? '';
  String CO12 = prefs.getString('CO1_2') ?? '';
  String CO22 = prefs.getString('CO2_2') ?? '';
  String ratio2 = prefs.getString('ratio_2') ?? '';
  String CO1_2_2 = prefs.getString('CO1_2_2') ?? '';
  String CO2_2_2 = prefs.getString('CO2_2_2') ?? '';
  String ratio_2_2 = prefs.getString('ratio_2_2') ?? '';
  String defects2 = prefs.getString('defects2') ?? '';
  String remedial2 = prefs.getString('remedial2') ?? '';
  String warningNotice2 = prefs.getString('warningNotice2') ?? '';
  String location3 = prefs.getString('location3') ?? '';
  String type3 = prefs.getString('type3') ?? '';
  String manafacturer3 = prefs.getString('manafacturer3') ?? '';
  String model3 = prefs.getString('model3') ?? '';
  String ownedBy3 = prefs.getString('ownedBy3') ?? '';
  String applianceInspect3 = prefs.getString('applianceInspect3') ?? '';
  String flueType3 = prefs.getString('flueType3') ?? '';
  String opPress3 = prefs.getString('opPress3') ?? '';
  String safetyCorrect3 = prefs.getString('safetyCorrect3') ?? '';
  String satisfactory3 = prefs.getString('satisfactory3') ?? '';
  String visual3 = prefs.getString('visual3') ?? '';
  String termination3 = prefs.getString('termination3') ?? '';
  String fluePerformance3 = prefs.getString('fluePerformance3') ?? '';
  String applianceService3 = prefs.getString('applianceService3') ?? '';
  String applianceSafe3 = prefs.getString('applianceSafe3') ?? '';
  String CO13 = prefs.getString('CO1_3') ?? '';
  String CO23 = prefs.getString('CO2_3') ?? '';
  String ratio3 = prefs.getString('ratio_3') ?? '';
  String CO1_2_3 = prefs.getString('CO1_2_3') ?? '';
  String CO2_2_3 = prefs.getString('CO2_2_3') ?? '';
  String ratio_2_3 = prefs.getString('ratio_2_3') ?? '';
  String defects3 = prefs.getString('defects3') ?? '';
  String remedial3 = prefs.getString('remedial3') ?? '';
  String warningNotice3 = prefs.getString('warningNotice3') ?? '';
  String location4 = prefs.getString('location4') ?? '';
  String type4 = prefs.getString('type4') ?? '';
  String manafacturer4 = prefs.getString('manafacturer4') ?? '';
  String model4 = prefs.getString('model4') ?? '';
  String ownedBy4 = prefs.getString('ownedBy4') ?? '';
  String applianceInspect4 = prefs.getString('applianceInspect4') ?? '';
  String flueType4 = prefs.getString('flueType4') ?? '';
  String opPress4 = prefs.getString('opPress4') ?? '';
  String safetyCorrect4 = prefs.getString('safetyCorrect4') ?? '';
  String satisfactory4 = prefs.getString('satisfactory4') ?? '';
  String visual4 = prefs.getString('visual4') ?? '';
  String termination4 = prefs.getString('termination4') ?? '';
  String fluePerformance4 = prefs.getString('fluePerformance4') ?? '';
  String applianceService4 = prefs.getString('applianceService4') ?? '';
  String applianceSafe4 = prefs.getString('applianceSafe4') ?? '';
  String CO14 = prefs.getString('CO1_4') ?? '';
  String CO24 = prefs.getString('CO2_4') ?? '';
  String ratio4 = prefs.getString('ratio_4') ?? '';
  String CO1_2_4 = prefs.getString('CO1_2_4') ?? '';
  String CO2_2_4 = prefs.getString('CO2_2_4') ?? '';
  String ratio_2_4 = prefs.getString('ratio_2_4') ?? '';
  String defects4 = prefs.getString('defects4') ?? '';
  String remedial4 = prefs.getString('remedial4') ?? '';
  String warningNotice4 = prefs.getString('warningNotice4') ?? '';
  String gasInstall = prefs.getString('gasInstall') ?? '';
  String gasSupply = prefs.getString('gasSupply') ?? '';
  String gasTight = prefs.getString('gasTight') ?? '';
  String control = prefs.getString('emergencyControl') ?? '';
  String protective = prefs.getString('protective') ?? '';
  String alarm = prefs.getString('alarmPresent') ?? '';
  String smoke = prefs.getString('smokePresent') ?? '';
  bool isApp1Used = prefs.getBool('isApp1Used') ?? false;
  bool isApp2Used = prefs.getBool('isApp2Used') ?? false;
  bool isApp3Used = prefs.getBool('isApp3Used') ?? false;
  bool isApp4Used = prefs.getBool('isApp4Used') ?? false;
  String? base64img = prefs.getString('SignatureImg');

  Uint8List? decodedImg;
  if (base64img != null && base64img.isNotEmpty) {
    decodedImg = base64Decode(base64img);
  }

  final ByteData data = await rootBundle.load('assets/defaultlogo.jpg');
  final Uint8List imageBytes = data.buffer.asUint8List();
  final pdfImage = pdfWid.MemoryImage(imageBytes);
  //final Uint8List? signatureUint8List = signatureBytes;

  pdf.addPage(
    pdfWid.Page(
      pageFormat: format,
      build: (context) {
        return pdfWid.Stack(
          children: [
            // Displaying customer data from the List<Map<String, dynamic>>
            for (var customer in customers)
              pdfWid.Stack(
                children: [
                  pdfWid.Row(
                    mainAxisAlignment: pdfWid.MainAxisAlignment.end,
                    children: [
                      pdfWid.Container(
                        width: 1000,
                        height: 1000,
                        //child: pdfWid.Image(pdfImage),
                      ),
                    ],
                  ),
                  pdfWid.Positioned(
                    top: 10,
                    left: 10,
                    child: pdfWid.Text(
                      'GAS SAFETY REPORT',
                      style: pdfWid.TextStyle(
                        fontSize: 32,
                        fontWeight: pdfWid.FontWeight.bold,
                      ),
                    ),
                  ),
                  // pdfWid.Positioned(
                  //   top: 50,
                  //   left: 10,
                  //   child: pdfWid.Text(
                  //     'First Name: ${customer['Customer First Name'] ?? 'N/A'}',
                  //     style: pdfWid.TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: pdfWid.FontWeight.normal,
                  //     ),
                  //   ),
                  // ),
                  // pdfWid.Positioned(
                  //   top: 200,
                  //   left: 50,
                  //   child: pdfWid.Text(
                  //     'Last Name: ${customer['Customer Last Name'] ?? 'N/A'}',
                  //     style: pdfWid.TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: pdfWid.FontWeight.normal,
                  //     ),
                  //   ),
                  // ),
                  // pdfWid.Positioned(
                  //   top: 200,
                  //   left: 50,
                  //   child: pdfWid.Text(
                  //     'Address: ${customer['Customer Address'] ?? 'N/A'}',
                  //     style: pdfWid.TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: pdfWid.FontWeight.normal,
                  //     ),
                  //   ),
                  // ),
                  // pdfWid.Positioned(
                  //   top: 200,
                  //   left: 50,
                  //   child: pdfWid.Text(
                  //     'Engineer Name: $firstName',
                  //     style: pdfWid.TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: pdfWid.FontWeight.normal,
                  //     ),
                  //   ),
                  // ),
                  // pdfWid.Positioned(
                  //   top: 200,
                  //   left: 50,
                  //   child: pdfWid.Text(
                  //     'Engineer Address: $address',
                  //     style: pdfWid.TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: pdfWid.FontWeight.normal,
                  //     ),
                  //   ),
                  // ),
                  // pdfWid.Positioned(
                  //   top: 200,
                  //   left: 50,
                  //   child: pdfWid.Text(
                  //     'Engineer Postcode: $postcode',
                  //     style: pdfWid.TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: pdfWid.FontWeight.normal,
                  //     ),
                  //   ),
                  // ),
                  // pdfWid.Positioned(
                  //   top: 200,
                  //   left: 50,
                  //   child: pdfWid.Text(
                  //     'Engineer Telephone: $telephone_engineer',
                  //     style: pdfWid.TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: pdfWid.FontWeight.normal,
                  //     ),
                  //   ),
                  // ),
                  // pdfWid.Positioned(
                  //   top: 200,
                  //   left: 50,
                  //   child: pdfWid.Text(
                  //     'Engineer Trading Title: $trading',
                  //     style: pdfWid.TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: pdfWid.FontWeight.normal,
                  //     ),
                  //   ),
                  // ),
                  // pdfWid.Positioned(
                  //   top: 200,
                  //   left: 50,
                  //   child: pdfWid.Text(
                  //     'Engineer Gas Safety Number: $gas',
                  //     style: pdfWid.TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: pdfWid.FontWeight.normal,
                  //     ),
                  //   ),
                  // ),
                  // pdfWid.Positioned(
                  //   top: 200,
                  //   left: 50,
                  //   child: pdfWid.Text(
                  //     'Engineer Company: $company',
                  //     style: pdfWid.TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: pdfWid.FontWeight.normal,
                  //     ),
                  //   ),
                  // ),
                  pdfWid.Positioned(
                    top: 200,
                    left: 50,
                    child: pdfWid.Container(
                      width: 300,
                      height: 200,
                      // Display the image if it exists
                      child: decodedImg != null
                          ? pdfWid.Image(pdfWid.MemoryImage(decodedImg))
                          : pdfWid.Text(''),
                    ),
                  ),
                  pdfWid.Positioned(
                      top: 10,
                      left: 360,
                      child: pdfWid.Image(pdfImage, width: 100, height: 100)),
                ],
              ),
          ],
        );
      },
    ),
  );

  // Check if imagePath is empty or "-"
  // if (imagePath.isEmpty || imagePath == "-") {

  // } else {
  //   final ByteData data = await rootBundle.load('assets/defaultlogo.jpg');
  //   final Uint8List imageBytes = data.buffer.asUint8List();
  //   final pdfImage = pdfWid.MemoryImage(imageBytes);
  //   //final Uint8List? signatureUint8List = signatureBytes;

  //   pdf.addPage(
  //     pdfWid.Page(
  //       pageFormat: format,
  //       build: (context) {
  //         return pdfWid.Stack(
  //           children: [
  //             // Displaying customer data from the List<Map<String, dynamic>>
  //             for (var customer in customers)
  //               pdfWid.Stack(
  //                 children: [
  //                   pdfWid.Row(
  //                     mainAxisAlignment: pdfWid.MainAxisAlignment.end,
  //                     children: [
  //                       pdfWid.Container(
  //                         width: 1000,
  //                         height: 1000,
  //                         //child: pdfWid.Image(pdfImage),
  //                       ),
  //                     ],
  //                   ),
  //                   pdfWid.Positioned(
  //                     top: 10,
  //                     left: 10,
  //                     child: pdfWid.Text(
  //                       'GAS SAFETY REPORT',
  //                       style: pdfWid.TextStyle(
  //                         fontSize: 32,
  //                         fontWeight: pdfWid.FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                   pdfWid.Positioned(
  //                     top: 50,
  //                     left: 10,
  //                     child: pdfWid.Text(
  //                       'First Name: ${customer['First Name'] ?? 'N/A'}',
  //                       style: pdfWid.TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: pdfWid.FontWeight.normal,
  //                       ),
  //                     ),
  //                   ),
  //                   pdfWid.Positioned(
  //                     top: 200,
  //                     left: 50,
  //                     child: pdfWid.Text(
  //                       'Last Name: ${customer['Last Name'] ?? 'N/A'}',
  //                       style: pdfWid.TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: pdfWid.FontWeight.normal,
  //                       ),
  //                     ),
  //                   ),
  //                   pdfWid.Positioned(
  //                     top: 200,
  //                     left: 50,
  //                     child: pdfWid.Text(
  //                       'Address: ${customer['Address'] ?? 'N/A'}',
  //                       style: pdfWid.TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: pdfWid.FontWeight.normal,
  //                       ),
  //                     ),
  //                   ),
  //                   // pdfWid.Positioned(
  //                   //   top: 200,
  //                   //   left: 50,
  //                   //   child: pdfWid.Text(
  //                   //     'Engineer Name: $name',
  //                   //     style: pdfWid.TextStyle(
  //                   //       fontSize: 20,
  //                   //       fontWeight: pdfWid.FontWeight.normal,
  //                   //     ),
  //                   //   ),
  //                   // ),
  //                   // pdfWid.Positioned(
  //                   //   top: 200,
  //                   //   left: 50,
  //                   //   child: pdfWid.Text(
  //                   //     'Engineer Address: $address_engineer',
  //                   //     style: pdfWid.TextStyle(
  //                   //       fontSize: 20,
  //                   //       fontWeight: pdfWid.FontWeight.normal,
  //                   //     ),
  //                   //   ),
  //                   // ),
  //                   // pdfWid.Positioned(
  //                   //   top: 200,
  //                   //   left: 50,
  //                   //   child: pdfWid.Text(
  //                   //     'Engineer Postcode: $postcode_engineer',
  //                   //     style: pdfWid.TextStyle(
  //                   //       fontSize: 20,
  //                   //       fontWeight: pdfWid.FontWeight.normal,
  //                   //     ),
  //                   //   ),
  //                   // ),
  //                   // pdfWid.Positioned(
  //                   //   top: 200,
  //                   //   left: 50,
  //                   //   child: pdfWid.Text(
  //                   //     'Engineer Telephone: $telephone_engineer',
  //                   //     style: pdfWid.TextStyle(
  //                   //       fontSize: 20,
  //                   //       fontWeight: pdfWid.FontWeight.normal,
  //                   //     ),
  //                   //   ),
  //                   // ),
  //                   // pdfWid.Positioned(
  //                   //   top: 200,
  //                   //   left: 50,
  //                   //   child: pdfWid.Text(
  //                   //     'Engineer Trading Title: $trading',
  //                   //     style: pdfWid.TextStyle(
  //                   //       fontSize: 20,
  //                   //       fontWeight: pdfWid.FontWeight.normal,
  //                   //     ),
  //                   //   ),
  //                   // ),
  //                   // pdfWid.Positioned(
  //                   //   top: 200,
  //                   //   left: 50,
  //                   //   child: pdfWid.Text(
  //                   //     'Engineer Gas Safety Number: $gas',
  //                   //     style: pdfWid.TextStyle(
  //                   //       fontSize: 20,
  //                   //       fontWeight: pdfWid.FontWeight.normal,
  //                   //     ),
  //                   //   ),
  //                   // ),
  //                   // pdfWid.Positioned(
  //                   //   top: 200,
  //                   //   left: 50,
  //                   //   child: pdfWid.Text(
  //                   //     'Engineer Company: $company',
  //                   //     style: pdfWid.TextStyle(
  //                   //       fontSize: 20,
  //                   //       fontWeight: pdfWid.FontWeight.normal,
  //                   //     ),
  //                   //   ),
  //                   // ),
  //                   pdfWid.Positioned(
  //                     top: 200,
  //                     left: 50,
  //                     child: pdfWid.Container(
  //                       width: 300,
  //                       height: 200,
  //                       // Display the image if it exists
  //                       child: decodedImg != null
  //                           ? pdfWid.Image(pdfWid.MemoryImage(decodedImg))
  //                           : pdfWid.Text(''),
  //                     ),
  //                   ),
  //                   pdfWid.Positioned(
  //                       top: 10,
  //                       left: 360,
  //                       child: pdfWid.Image(pdfImage, width: 100, height: 100)),
  //                 ],
  //               ),
  //           ],
  //         );
  //       },
  //     ),
  //   );
  // }

  return pdf.save();
}
