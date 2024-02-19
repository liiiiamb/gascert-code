// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:gascert/main.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pdfWid;
// import 'package:excel/excel.dart' as excel;
// import 'dart:io';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:printing/printing.dart';
// import 'package:url_launcher/url_launcher.dart' as launcher;
// import 'package:permission_handler/permission_handler.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(SignUpScreen());
// }

// class SignUpScreen extends StatelessWidget {
//   //first sign up screen here
//   SignUpScreen({Key? key}) : super(key: key);

//   var fNameController = TextEditingController();
//   var sNameController = TextEditingController();
//   final _emailController = TextEditingController();
//   var teleController = TextEditingController();
//   var postcodeController = TextEditingController();
//   var addressController = TextEditingController();
//   var traingTitleController = TextEditingController();
//   var gasNumController = TextEditingController();
//   final _password1Controller = TextEditingController();
//   var password2Controller = TextEditingController();
//   final firestore = FirebaseFirestore.instance;
//   get data => null;

//   @override
//   Widget build(BuildContext context) {
//     String hexColor = "#606060";
//     Color circCol =
//         Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
//     String hexColor2 = "#E5E5E5";
//     Color twoCol =
//         Color(int.parse(hexColor2.substring(1, 7), radix: 16) + 0xFF000000);
//     return Scaffold(
//         //appBar: AppBar(),
//         body: Scrollbar(
//             showTrackOnHover: true,
//             thickness: 5,
//             interactive: true,
//             child: ListView(padding: EdgeInsets.only(top: 130), children: [
//               Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//                 Center(
//                     child: Text("CREATE ACCOUNT",
//                         style: TextStyle(
//                             fontSize: 25,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.bold))),
//                 SizedBox(height: 40),
//                 Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: TextFormField(
//                       controller: fNameController,
//                       decoration: InputDecoration(
//                         labelText: 'First Name',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                     )),
//                 SizedBox(height: 40),
//                 Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: TextFormField(
//                       controller: sNameController,
//                       decoration: InputDecoration(
//                         labelText: 'Last Name',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                     )),
//                 SizedBox(height: 40),
//                 Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: TextFormField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         labelText: 'Email Address',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                     )),
//                 SizedBox(height: 40),
//                 SingleChildScrollView(
//                     child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: TextFormField(
//                           controller: teleController,
//                           decoration: InputDecoration(
//                             labelText: 'Telephone Number',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ))),
//                 SizedBox(height: 40),
//                 SingleChildScrollView(
//                     child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: TextFormField(
//                           controller: postcodeController,
//                           decoration: InputDecoration(
//                             labelText: 'Postcode',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ))),
//                 SizedBox(height: 40),
//                 SingleChildScrollView(
//                     child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: TextFormField(
//                           controller: addressController,
//                           decoration: InputDecoration(
//                             labelText: 'Address',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ))),
//                 SizedBox(height: 40),
//                 SingleChildScrollView(
//                     child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: TextFormField(
//                           controller: traingTitleController,
//                           decoration: InputDecoration(
//                             labelText: 'Trading Title',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ))),
//                 SizedBox(height: 40),
//                 SingleChildScrollView(
//                     child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: TextFormField(
//                           controller: gasNumController,
//                           decoration: InputDecoration(
//                             labelText: 'Gas Safety Number',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ))),
//                 SizedBox(height: 40),
//                 SingleChildScrollView(
//                     child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: TextFormField(
//                           controller: _password1Controller,
//                           obscureText: true,
//                           enableSuggestions: true,
//                           autocorrect: false,
//                           decoration: InputDecoration(
//                             labelText: 'Password',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ))),
//                 SizedBox(height: 40),
//                 SingleChildScrollView(
//                     child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: TextFormField(
//                           controller: password2Controller,
//                           obscureText: true,
//                           enableSuggestions: true,
//                           autocorrect: false,
//                           decoration: InputDecoration(
//                             labelText: 'Confirm Password',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
//                         ))),
//                 SizedBox(height: 40),
//                 Builder(
//                   builder: (context) => ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: twoCol,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(100),
//                         side: const BorderSide(
//                           color: Colors.black,
//                           width: 2.0,
//                         ),
//                       ),
//                     ),
//                     child: const SizedBox(
//                       width: 200,
//                       child: Center(
//                         child: Text(
//                           "CREATE ACCOUNT",
//                           style: TextStyle(
//                             fontFamily: 'Inter',
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     onPressed: () async {
//                       //button to next screen - add next screen nav here
//                       String email = _emailController.text;
//                       String password = _password1Controller.text;
//                       String password2 = password2Controller.text;

//                       if ((password == password2) && (password.length > 6)) {
//                         //add toast check test here
//                         try {
//                           final User? user =
//                               (await _auth.createUserWithEmailAndPassword(
//                             email: _emailController.text,
//                             password: _password1Controller.text,
//                           ))
//                                   .user;

//                           Fluttertoast.showToast(
//                               msg: 'User signed up successfully',
//                               toastLength: Toast.LENGTH_SHORT,
//                               gravity: ToastGravity.CENTER);

//                           if (fNameController.text.isNotEmpty &&
//                               sNameController.text.isNotEmpty &&
//                               _emailController.text.isNotEmpty &&
//                               teleController.text.isNotEmpty &&
//                               postcodeController.text.isNotEmpty &&
//                               addressController.text.isNotEmpty &&
//                               traingTitleController.text.isNotEmpty &&
//                               gasNumController.text.isNotEmpty &&
//                               _password1Controller.text.isNotEmpty &&
//                               password2Controller.text.isNotEmpty) {
//                             firestore.collection("Account Information").add({
//                               "First Name": fNameController.text,
//                               "Surname": sNameController.text,
//                               "Email Address": _emailController.text,
//                               "Telephone": teleController.text,
//                               "Postcode": postcodeController.text,
//                               "Address": addressController.text,
//                               "Trading Title": traingTitleController.text,
//                               "Gas Safety Number": gasNumController.text,
//                               "Password 1": _password1Controller.text,
//                               "Password 2": password2Controller.text
//                             });

//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const HomePageScreen()),
//                             );
//                           } else if (password != password2) {
//                             Fluttertoast.showToast(
//                                 msg: 'Passwords do not match',
//                                 toastLength: Toast.LENGTH_SHORT,
//                                 gravity: ToastGravity.CENTER);
//                           } else if (password.length < 6) {
//                             Fluttertoast.showToast(
//                                 msg: 'Password must be above 6 characters',
//                                 toastLength: Toast.LENGTH_SHORT,
//                                 gravity: ToastGravity.CENTER);
//                           }
//                         } on FirebaseAuthException catch (e) {
//                           if (e.code == 'email-already-in-use') {
//                             Fluttertoast.showToast(
//                                 msg: 'Email already used',
//                                 toastLength: Toast.LENGTH_SHORT,
//                                 gravity: ToastGravity.CENTER);
//                           }
//                         }
//                       }
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 40),
//               ]),
//             ])));
//   }
// }
