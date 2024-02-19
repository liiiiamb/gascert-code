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
// import 'main.dart';
// import 'SignInScreen.dart';
// import 'ForgPasswordScreen.dart';
// import 'package:permission_handler/permission_handler.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(SignInScreen());
// }

// class SignInScreen extends StatelessWidget {
//   final bool _success = false;
//   final String _userEmail = '';
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   //sign in screen here
//   SignInScreen({Key? key}) : super(key: key);

//   final firestore = FirebaseFirestore.instance;

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
//         //appBar: AppBar(),
//         body: ListView(padding: EdgeInsets.only(top: 180), children: [
//       Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//         Center(
//             child: Text("SIGN IN",
//                 style: TextStyle(
//                     fontSize: 25,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.bold))),
//         SizedBox(height: 100),
//         Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email Address',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             )),
//         SizedBox(height: 50),
//         Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: TextFormField(
//               controller: _passwordController,
//               obscureText: true,
//               enableSuggestions: true,
//               autocorrect: false,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             )),
//         SizedBox(height: 100),
//         Builder(
//           builder: (context) => ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: twoCol,
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(100),
//                   side: const BorderSide(
//                     color: Colors.black,
//                     width: 2.0,
//                   ),
//                 ),
//               ),
//               child: const SizedBox(
//                 width: 200,
//                 child: Center(
//                   child: Text(
//                     "SIGN IN",
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               onPressed: () async {
//                 String email = _emailController.text;
//                 String password = _passwordController.text;

//                 if ((email == " ") || (password == " ")) {
//                   Fluttertoast.showToast(
//                       msg: "Enter email/password",
//                       toastLength: Toast.LENGTH_SHORT,
//                       gravity: ToastGravity.CENTER);
//                 } else {
//                   try {
//                     UserCredential userCredential =
//                         (await _auth.signInWithEmailAndPassword(
//                             email: _emailController.text,
//                             password: _passwordController.text));

//                     Fluttertoast.showToast(
//                         msg: 'User signed in successfully',
//                         toastLength: Toast.LENGTH_SHORT,
//                         gravity: ToastGravity.CENTER);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const HomePageScreen()),
//                     );
//                   } on FirebaseAuthException catch (e) {
//                     if (e.code == 'user-not-found') {
//                       Fluttertoast.showToast(
//                           msg: "User not found",
//                           toastLength: Toast.LENGTH_SHORT,
//                           gravity: ToastGravity.CENTER);
//                     } else if (e.code == 'wrong-password') {
//                       Fluttertoast.showToast(
//                           msg: "Incorrect password",
//                           toastLength: Toast.LENGTH_SHORT,
//                           gravity: ToastGravity.CENTER);
//                     }
//                   }
//                 }
//               }),
//         ),
//         SizedBox(height: 50),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ForgPasswordScreen()),
//             );
//           },
//           child: Text('Forgotten Password',
//               style: TextStyle(
//                   fontSize: 14,
//                   color: dBlue,
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.bold,
//                   decoration: TextDecoration.underline)),
//         ),
//       ]),
//     ]));
//   }
// }
