// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pdfWid;
// import 'package:excel/excel.dart' as excel;
// import 'dart:io';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:printing/printing.dart';
// import 'package:url_launcher/url_launcher.dart' as launcher;
// import 'SignUpScreen.dart';
// import 'SignInScreen.dart';
// import 'ForgPasswordScreen.dart';
// import 'HomePageScreen.dart';
// import 'TestingScreen.dart';
// import 'package:permission_handler/permission_handler.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(const MyApp());
// }

// final pdf = pdfWid.Document(version: PdfVersion.pdf_1_4, compress: true);

// class UserInfo {
//   late String name;
//   late String address;
//   late String surname;
//   late String password1;
//   late String password2;
//   late String tradingTitle;
//   late String email;
//   late String phoneNum;
//   late String gasNum;
//   late String postcode;
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     String hexColor = "#509A54";
//     Color newCol =
//         Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);

//     String hexColor2 = "#E5E5E5";
//     Color twoCol =
//         Color(int.parse(hexColor2.substring(1, 7), radix: 16) + 0xFF000000);

//     return MaterialApp(
//       home: Builder(
//         builder: (context) => Scaffold(
//           //appBar:
//           //AppBar(backgroundColor: Colors.red, title: const Text('GasCert')),
//           body: Container(
//             alignment: Alignment.center,
//             child: Stack(
//               children: [
//                 Container(
//                     //alignment: ,
//                     width: double.infinity,
//                     height: 430,
//                     decoration: BoxDecoration(
//                         color: newCol,
//                         border: Border(
//                             bottom: BorderSide(color: newCol, width: 40)),
//                         borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(45),
//                             bottomRight: Radius.circular(45)))),
//                 Center(
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(45),
//                       child: Image.asset('assets/logo.png',
//                           width: 120, height: 170, fit: BoxFit.cover)),
//                 ),
//                 Container(
//                   //NEED TO CHANGE STYLE OF BUTTON
//                   alignment: Alignment.center,
//                   margin: const EdgeInsets.only(top: 550),
//                   child: Column(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(100),
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: twoCol,
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(100),
//                               side: const BorderSide(
//                                 color: Colors.black,
//                                 width: 2.0,
//                               ),
//                             ),
//                           ),
//                           child: const SizedBox(
//                             width: 200,
//                             child: Center(
//                               child: Text(
//                                 "SIGN IN",
//                                 style: TextStyle(
//                                   fontFamily: 'Inter',
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => SignInScreen()),
//                             );
//                           },
//                         ),
//                       ),
//                       const SizedBox(
//                           height: 40), // Adjust the spacing as needed
//                       const Text(
//                         "OR",
//                         style: TextStyle(
//                           fontFamily: 'Inter',
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       Builder(
//                         builder: (context) => ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: twoCol,
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(100),
//                               side: const BorderSide(
//                                 color: Colors.black,
//                                 width: 2.0,
//                               ),
//                             ),
//                           ),
//                           child: const SizedBox(
//                             width: 200,
//                             child: Center(
//                               child: Text(
//                                 "SIGN UP",
//                                 style: TextStyle(
//                                   fontFamily: 'Inter',
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             //button to next screen - add next screen nav here
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => SignUpScreen()),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
