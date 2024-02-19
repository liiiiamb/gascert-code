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
// import 'TestingScreen.dart';
// import 'package:permission_handler/permission_handler.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;

// class ForgPasswordScreen extends StatelessWidget {
//   //sign in screen here
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _password2Controller = TextEditingController();
//   ForgPasswordScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String hexColor = "#606060";
//     Color circCol =
//         Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
//     String hexColor2 = "#E5E5E5";
//     Color twoCol =
//         Color(int.parse(hexColor2.substring(1, 7), radix: 16) + 0xFF000000);
//     String darkBlueHex = '#3A82CB';
//     Color dBlue =
//         Color(int.parse(darkBlueHex.substring(1, 7), radix: 16) + 0xFF000000);

//     return Scaffold(
//         body: Container(
//             padding: EdgeInsets.only(top: 190),
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//               Center(
//                   child: Text("RESET PASSWORD",
//                       style: TextStyle(
//                           fontSize: 25,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.bold))),
//               SizedBox(height: 155),
//               Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   child: TextFormField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       labelText: 'Email Address',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                     ),
//                   )),
//               SizedBox(height: 125),
//               Builder(
//                 builder: (context) => ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: twoCol,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(100),
//                       side: const BorderSide(
//                         color: Colors.black,
//                         width: 2.0,
//                       ),
//                     ),
//                   ),
//                   child: const SizedBox(
//                     width: 200,
//                     child: Center(
//                       child: Text(
//                         "CONTINUE",
//                         style: TextStyle(
//                           fontFamily: 'Inter',
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   onPressed: () async {
//                     String emailString = _emailController.text;
//                     try {
//                       await _auth.sendPasswordResetEmail(email: emailString);

//                       Fluttertoast.showToast(
//                           msg: "Check email for reset password link",
//                           toastLength: Toast.LENGTH_SHORT,
//                           gravity: ToastGravity.CENTER);

//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => SignInScreen()),
//                       );
//                     } on FirebaseAuthException catch (e) {
//                       if (e.code == 'invalid-email') {
//                         Fluttertoast.showToast(
//                             msg: "Invalid email",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.CENTER);
//                       } else if (e.code == 'missing-email') {
//                         Fluttertoast.showToast(
//                             msg: "Invalid email1",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.CENTER);
//                       } else if (e.code == 'user-not-found') {
//                         Fluttertoast.showToast(
//                             msg: "Invalid email2",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.CENTER);
//                       }
//                     }
//                     //button to next screen - add next screen nav here
//                   },
//                 ),
//               ),
//             ])));
//   }
// }
