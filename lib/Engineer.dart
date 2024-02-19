import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gascert/Settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:signature/signature.dart';
import 'package:provider/provider.dart';

class Engineer extends StatefulWidget {
  @override
  _EngineerState createState() => _EngineerState();
}

class _EngineerState extends State<Engineer> {
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var postcodeController = TextEditingController();
  var telephoneController = TextEditingController();
  var tradingTitleController = TextEditingController();
  var gasController = TextEditingController();
  var companyController = TextEditingController();
  var emailController = TextEditingController();
  var signatureController = SignatureController();
  bool isEngineerSet = false;
  bool isLogoSet = false;
  String imagePath = '';

  @override
  void initState() {
    super.initState();
    _setDefaultImagePath();
  }

  Future<void> _setDefaultImagePath() async {
    final defaultImagePath = 'assets/defaultlogo.jpg';
    final ByteData data = await rootBundle.load(defaultImagePath);
    final List<int> bytes = data.buffer.asUint8List();
    setState(() {
      imagePath = defaultImagePath;
    });
  }

  Future<void> pickImage(BuildContext context) async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
        isLogoSet = true;
      });
    }
  }

  Timer? _debounceTimer;

  Future<void> _debounce(VoidCallback callback) async {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), callback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 70.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => SettingsPage()),
                      );
                    },
                    child: Icon(
                      Icons.undo,
                      size: 34.0,
                      semanticLabel: 'Go back',
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.only(left: 60.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Engineer Details',
                        style: TextStyle(
                          fontSize: 29.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.0),
                Padding(
                  padding: EdgeInsets.only(left: 80.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Add spacing between text and input field
                      Container(
                        width: 200.0,
                        height: 70.0,
                        padding: EdgeInsets.only(bottom: 40.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'Enter your name',
                          ),
                          controller: nameController,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              _debounce(() {
                                setState(() {
                                  nameController.text = value;
                                  isEngineerSet = true;
                                });
                              });
                            }
                            // String name = nameController.text;
                            // SharedPreferences.getInstance().then((prefs) {
                            //   prefs.setString('Name', name).then((value) {
                            //     setState(() {
                            //       isEngineerSet = true;
                            //       prefs.setBool('isEngineerSet', isEngineerSet);
                            //       // Update other state variables or UI if needed
                            //     });
                            //   });
                            // });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(left: 60.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Add spacing between text and input field
                      Container(
                        width: 250.0,
                        height: 70.0,
                        padding: EdgeInsets.only(bottom: 40.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.home),
                            hintText: 'Enter your address',
                          ),
                          controller: addressController,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(left: 90.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Add spacing between text and input field
                      Container(
                        width: 190.0,
                        height: 70.0,
                        padding: EdgeInsets.only(bottom: 40.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.pin_drop),
                            hintText: 'Enter your postcode',
                          ),
                          controller: postcodeController,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(left: 60.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Add spacing between text and input field
                      Container(
                        width: 260.0,
                        height: 70.0,
                        padding: EdgeInsets.only(bottom: 40.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.call),
                            hintText: 'Enter your telephone number',
                          ),
                          controller: telephoneController,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(left: 60.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Add spacing between text and input field
                      Container(
                        width: 260.0,
                        height: 70.0,
                        padding: EdgeInsets.only(bottom: 40.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.alternate_email),
                            hintText: 'Enter email address',
                          ),
                          controller: emailController,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(left: 60.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Add spacing between text and input field
                      Container(
                        width: 260.0,
                        height: 70.0,
                        padding: EdgeInsets.only(bottom: 40.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.work),
                            hintText: 'Enter your company name',
                          ),
                          controller: companyController,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(left: 60.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Add spacing between text and input field
                      Container(
                        width: 260.0,
                        height: 70.0,
                        padding: EdgeInsets.only(bottom: 40.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.gas_meter),
                            hintText: 'Enter your gas safety number',
                          ),
                          controller: gasController,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 130.0),
                  // child: Signature(
                  //   controller: signatureController,
                  //   height: 200,
                  //   backgroundColor: Colors.white,
                  // ),
                  child: OutlinedButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Draw your Signature'),
                                content: Container(
                                    height: 200,
                                    child: Signature(
                                      controller: signatureController,
                                      height: 200,
                                      backgroundColor: Colors.white,
                                    )),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      final bytes = await signatureController
                                          .toPngBytes();

                                      String base64img = base64Encode(bytes!);

                                      // Save the signature as an image in SharedPreferences
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString('SignatureImg',
                                          base64img); // Store bytes directly
                                      Fluttertoast.showToast(
                                          msg: "Signature Saved");
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Save'),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel'))
                                ],
                              );
                            });
                      }, //Add onpressed here for opening choose company logo screen
                      style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(width: 1.0, color: Colors.black)),
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(150.0,
                                40.0), // Set the width and height of the button
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.green.shade200)),
                      child: Text('Enter Signature',
                          style: TextStyle(color: Colors.black))),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(left: 60.0),
                  child: OutlinedButton(
                      onPressed: () async {
                        pickImage(context);
                      }, //Add onpressed here for opening choose company logo screen
                      style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(width: 1.0, color: Colors.black)),
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(300.0,
                                40.0), // Set the width and height of the button
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.green.shade200)),
                      child: Text('Choose Company Logo',
                          style: TextStyle(color: Colors.black))),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(left: 170.0),
                  child: OutlinedButton(
                      onPressed: () async {
                        String name = nameController.text;
                        String address = addressController.text;
                        String postcode = postcodeController.text;
                        String telephone = telephoneController.text;
                        String trading = tradingTitleController.text;
                        String gas = gasController.text;
                        String email = emailController.text;
                        String company = companyController.text;

                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        if (name.isEmpty) {
                          name = "-";
                        }
                        if (address.isEmpty) {
                          address = "-";
                        }
                        if (postcode.isEmpty) {
                          postcode = "-";
                        }
                        if (telephone.isEmpty) {
                          telephone = "-";
                        }
                        if (trading.isEmpty) {
                          trading = "-";
                        }
                        if (gas.isEmpty) {
                          gas = "-";
                        }
                        if (company.isEmpty) {
                          company = "-";
                        }
                        if (isEngineerSet == true) {
                          prefs.setBool('isEngineerSet', isEngineerSet);
                        }
                        prefs.setString('Name', name);
                        prefs.setString('Address', address);
                        prefs.setString('Postcode', postcode);
                        prefs.setString('Telephone', telephone);
                        prefs.setString('Trading', trading);
                        prefs.setString('Gas', gas);
                        if (isLogoSet == true) {
                          prefs.setString('ImagePath', imagePath ?? '');
                          prefs.setBool('isLogoSet', isLogoSet ?? false);
                        }

                        prefs.setString('Email', email);
                        prefs.setString('Company', company);

                        Fluttertoast.showToast(msg: "Account Created");

                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SettingsPage()),
                        );
                      },
                      style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(width: 1.0, color: Colors.black)),
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(50.0,
                                40.0), // Set the width and height of the button
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.green.shade200)),
                      child:
                          Text('Save', style: TextStyle(color: Colors.black))),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Engineer(),
  ));
}
