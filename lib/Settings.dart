import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gascert/BackupData.dart';
import 'package:gascert/ContactDevelopers.dart';
import 'package:gascert/Engineer.dart';
import 'package:gascert/Language.dart';
import 'package:gascert/FreqAsked.dart';
import 'package:gascert/Notifications.dart';
import 'package:gascert/PostReportOptions.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'FirestoreDataDisplay';
import 'TestDisplayUser.dart';
import 'dart:convert';
import 'dart:io';
import 'package:pdf/widgets.dart' as pdfWid;
import 'package:excel/excel.dart' as excel;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'main.dart';
import 'TestingScreen.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  late String uniqueId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
              MainAxisAlignment.start, // Align content to the top
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 32.0, top: 70.0), // Adjust top padding
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => HomePageScreen()),
                  );
                },
                child: Icon(
                  Icons.undo,
                  size: 34.0,
                  semanticLabel: 'Go back',
                ),
              ),
            ),
            SizedBox(height: 15.0), // Adjust the gap between icon and text
            Padding(
              padding: EdgeInsets.only(left: 60.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(
                      width: 10.0), // Adjust the space between text and icon
                  Icon(
                    Icons.tune,
                    size: 34.0,
                  ),
                ],
              ),
            ),
            SizedBox(
                height:
                    30.0), // Adjust the gap between "Account" and text below
            Padding(
              padding: EdgeInsets.only(left: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account',
                    style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Engineer Details',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(
                          width:
                              80.0), // Adjust the space between text and icon
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.black),
                          color: Colors.green[200], // Light grey color
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Engineer()),
                            );
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 34.0,
                            semanticLabel: 'Go back',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.0),
                  Text(
                    'App Settings',
                    style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(height: 40.0),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => Language()),
                        );
                      }, //Add onpressed here for opening language screen
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
                      child: Text('Language',
                          style: TextStyle(color: Colors.black))),
                  SizedBox(height: 30.0),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => BackupData()),
                        );
                      }, //Add onpressed here for opening backup screen
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
                      child: Text('Backup Data',
                          style: TextStyle(color: Colors.black))),
                  // SizedBox(height: 30.0),
                  // OutlinedButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => GiveFeedback()),
                  //       );
                  //     }, //Add onpressed here for opening language screen
                  //     style: ButtonStyle(
                  //         side: MaterialStateProperty.all<BorderSide>(
                  //             BorderSide(width: 1.0, color: Colors.black)),
                  //         minimumSize: MaterialStateProperty.all<Size>(
                  //           Size(300.0,
                  //               40.0), // Set the width and height of the button
                  //         ),
                  //         shape:
                  //             MaterialStateProperty.all<RoundedRectangleBorder>(
                  //           RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(10.0)),
                  //         ),
                  //         backgroundColor: MaterialStateProperty.all<Color>(
                  //             Colors.green.shade200)),
                  //     child: Text('Give Feedback',
                  //         style: TextStyle(color: Colors.black))),
                  SizedBox(height: 30.0),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ContactDevelopers()),
                        );
                      }, //Add onpressed here for opening language screen
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
                      child: Text('Contact Developers',
                          style: TextStyle(color: Colors.black))),
                  SizedBox(height: 30.0),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => FreqAsked()),
                        );
                      }, //Add onpressed here for opening language screen
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
                      child:
                          Text('FAQs', style: TextStyle(color: Colors.black))),
                  SizedBox(height: 30.0),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => Notifications()),
                        );
                      }, //Add onpressed here for opening language screen
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
                      child: Text('Notifications',
                          style: TextStyle(color: Colors.black))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
