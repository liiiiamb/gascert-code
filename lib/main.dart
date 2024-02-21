import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gascert/Engineer.dart';
import 'package:gascert/PrevReport.dart';
import 'package:gascert/TestFirestore.dart';
import 'package:gascert/Settings.dart';
import 'package:gascert/CreateReport.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWid;
import 'package:excel/excel.dart' as excel;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'CreateReport.dart';
import 'main.dart';
import 'TestingScreen.dart';
import 'package:permission_handler/permission_handler.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

//void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageScreen(),
    );
  }
}

Future<bool> getEngineer() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isEngineerSet = prefs.getBool('isEngineerSet') ?? false;
  return isEngineerSet;
}

class HomePageScreen extends StatelessWidget {
  //home page screen here
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isApp1Pressed = false;
    bool isApp2Pressed = false;
    bool isApp3Pressed = false;
    bool isApp4Pressed = false;

    String hexColor = "#606060";
    Color circCol =
        Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
    String hexColor2 = "#E5E5E5";
    Color twoCol =
        Color(int.parse(hexColor2.substring(1, 7), radix: 16) + 0xFF000000);
    Color dBlue =
        Color(int.parse('#3A82CB'.substring(1, 7), radix: 16) + 0xFF000000);

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      bool isEngineerSet = await getEngineer();

      if (!isEngineerSet) {
        showDialog(
            context: context,
            barrierDismissible:
                false, //this line makes it so the outside of the dialog box cannot be pressed.
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                //title: Text("Enter Engineer Details"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Sign up to continue",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(
                        height: 20), // Adding space between text and button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Engineer()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                                color: Colors.green, width: 1), // Add border
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "Continue",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                contentTextStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 14),
              );
            });
      }
    });

    return Scaffold(
        //appBar: AppBar(),
        body: Container(
            padding: EdgeInsets.only(top: 180),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Center(
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: 'Gas', style: TextStyle(color: Colors.black)),
                      TextSpan(
                        text: 'Cert',
                        style: TextStyle(color: Colors.green),
                      )
                    ])),
              ),
              SizedBox(height: 105),
              Builder(
                builder: (context) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: twoCol,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: const SizedBox(
                    width: 300,
                    height: 50,
                    child: Center(
                      child: Text(
                        "CREATE NEW REPORT",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    //button to next screen - add next screen nav here
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => CreateReport()),
                    );
                  },
                ),
              ),
              SizedBox(height: 55),
              Builder(
                builder: (context) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: twoCol,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: const SizedBox(
                    width: 300,
                    height: 50,
                    child: Center(
                      child: Text(
                        "PREVIOUS REPORTS",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    //button to next screen - add next screen nav here
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => TestDisplayUser(
                              isAppPressed_One: isApp1Pressed,
                              isAppPressed_Two: isApp2Pressed,
                              isAppPressed_Three: isApp3Pressed,
                              isAppPressed_Four: isApp4Pressed)),
                    );
                  },
                ),
              ),
              SizedBox(height: 55),
              Builder(
                builder: (context) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: twoCol,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: const SizedBox(
                    width: 300,
                    height: 50,
                    child: Center(
                      child: Text(
                        "SETTINGS",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    //button to next screen - add next screen nav here
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
              ),
            ])));
  }
}
