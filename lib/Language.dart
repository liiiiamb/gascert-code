import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gascert/Engineer.dart';
import 'package:gascert/PostReportOptions.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gascert/TestDisplayData.dart';
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
import 'SignUpScreen.dart';
import 'SignInScreen.dart';
import 'ForgPasswordScreen.dart';
import 'main.dart';
import 'TestingScreen.dart';
import 'package:permission_handler/permission_handler.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  bool isEnglish = true;
  bool isSpanish = false;
  bool isGerman = false;
  bool isItalian = false;
  bool isPolish = false;
  bool isArabic = false;
  bool isFrench = false;
  var EnglishController = TextEditingController();
  var SpanishController = TextEditingController();
  var GermanController = TextEditingController();
  var ItalianController = TextEditingController();
  var PolishController = TextEditingController();
  var ArabicController = TextEditingController();
  var FrenchController = TextEditingController();

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
                    'Language',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(
                      width: 10.0), // Adjust the space between text and icon
                  Icon(
                    Icons.translate,
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
                    'Select a Language',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  CheckboxListTile(
                    title: Text("English"),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isEnglish,
                    onChanged: (newValue) {
                      setState(() {
                        isSpanish = false;
                        isGerman = false;
                        isItalian = false;
                        isPolish = false;
                        isArabic = false;
                        isFrench = false;
                        if (newValue != null) {
                          isEnglish = newValue;
                          EnglishController.text = isEnglish ? "Yes" : "No";
                        } else {
                          isEnglish = false;
                          EnglishController.text = "No";
                        }
                      });
                    },
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CheckboxListTile(
                    title: Text("Spanish"),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isSpanish,
                    onChanged: (newValue) {
                      setState(() {
                        isEnglish = false;
                        isGerman = false;
                        isItalian = false;
                        isPolish = false;
                        isArabic = false;
                        isFrench = false;
                        if (newValue != null) {
                          isSpanish = newValue;
                          SpanishController.text = isSpanish ? "Yes" : "No";
                        } else {
                          isSpanish = false;
                          SpanishController.text = "No";
                        }
                      });
                    },
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CheckboxListTile(
                    title: Text("German"),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isGerman,
                    onChanged: (newValue) {
                      setState(() {
                        isEnglish = false;
                        isSpanish = false;
                        //isGerman = false;
                        isItalian = false;
                        isPolish = false;
                        isArabic = false;
                        isFrench = false;
                        if (newValue != null) {
                          isGerman = newValue;
                          GermanController.text = isGerman ? "Yes" : "No";
                        } else {
                          isGerman = false;
                          GermanController.text = "No";
                        }
                      });
                    },
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CheckboxListTile(
                    title: Text("Italian"),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isItalian,
                    onChanged: (newValue) {
                      setState(() {
                        isEnglish = false;
                        isSpanish = false;
                        isGerman = false;
                        //isItalian = false;
                        isPolish = false;
                        isArabic = false;
                        isFrench = false;
                        if (newValue != null) {
                          isItalian = newValue;
                          ItalianController.text = isItalian ? "Yes" : "No";
                        } else {
                          isItalian = false;
                          ItalianController.text = "No";
                        }
                      });
                    },
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CheckboxListTile(
                    title: Text("Polish"),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isPolish,
                    onChanged: (newValue) {
                      setState(() {
                        isEnglish = false;
                        isSpanish = false;
                        isGerman = false;
                        isItalian = false;
                        //isPolish = false;
                        isArabic = false;
                        isFrench = false;
                        if (newValue != null) {
                          isPolish = newValue;
                          PolishController.text = isPolish ? "Yes" : "No";
                        } else {
                          isPolish = false;
                          PolishController.text = "No";
                        }
                      });
                    },
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CheckboxListTile(
                    title: Text("Arabic"),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isArabic,
                    onChanged: (newValue) {
                      setState(() {
                        isEnglish = false;
                        isSpanish = false;
                        isGerman = false;
                        isItalian = false;
                        isPolish = false;
                        //isArabic = false;
                        isFrench = false;
                        if (newValue != null) {
                          isArabic = newValue;
                          ArabicController.text = isArabic ? "Yes" : "No";
                        } else {
                          isArabic = false;
                          ArabicController.text = "No";
                        }
                      });
                    },
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CheckboxListTile(
                    title: Text("French"),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isFrench,
                    onChanged: (newValue) {
                      setState(() {
                        isEnglish = false;
                        isSpanish = false;
                        isGerman = false;
                        isItalian = false;
                        isPolish = false;
                        isArabic = false;
                        //isFrench = false;
                        if (newValue != null) {
                          isFrench = newValue;
                          FrenchController.text = isFrench ? "Yes" : "No";
                        } else {
                          isFrench = false;
                          FrenchController.text = "No";
                        }
                      });
                    },
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 100, top: 5),
                    child: OutlinedButton(
                        onPressed:
                            () {}, //Add onpressed here for opening language screen
                        style: ButtonStyle(
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(width: 1.0, color: Colors.black)),
                            minimumSize: MaterialStateProperty.all<Size>(
                              Size(100.0,
                                  40.0), // Set the width and height of the button
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green.shade200)),
                        child: Text('Save',
                            style: TextStyle(color: Colors.black))),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
