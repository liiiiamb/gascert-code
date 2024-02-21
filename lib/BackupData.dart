import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gascert/BackupFileDisplay.dart';
import 'package:gascert/CreatePDF.dart';
import 'package:gascert/Engineer.dart';
import 'package:gascert/PostReportOptions.dart';
import 'package:gascert/Settings.dart';
import 'package:path/path.dart' as Path;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'FirestoreDataDisplay';
import 'PrevReport.dart';
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
import 'package:flutter/material.dart';

class BackupData extends StatefulWidget {
  @override
  _BackupState createState() => _BackupState();
}

class _BackupState extends State<BackupData> {
  late String uniqueId = '';
  late List<Map<String, dynamic>> dataList;

  void initState() {
    super.initState();
    retrieveID();
  }

  Future<void> retrieveID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userID'); // Get stored uniqueId
    if (userId != null && userId.isNotEmpty) {
      setState(() {
        uniqueId = userId; // Set uniqueId with retrieved value
      });
    }
  }

  Future<List<Map<String, dynamic>>> fetchDataFromFire() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentID = prefs.getString('userID');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection('customers')
        .where('UserID', isEqualTo: currentID)
        .get();

    setState(() {
      dataList = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });

    return dataList;
  }

  Future<void> createFile() async {
    List<Map<String, dynamic>> data = await fetchDataFromFire();
    String currentDateTime = DateTime.now().toString().replaceAll(' ', '_');

    String fileName = 'Backup_$currentDateTime.txt';
    String filePath = '';

    try {
      Directory appDir = await getApplicationDocumentsDirectory();
      filePath = '${appDir.path}/$fileName';

      File txtFile = File(filePath);
      IOSink sink = txtFile.openWrite();

      for (var record in data) {
        String jsonRecord = json.encode(record);
        sink.writeln(jsonRecord + '-----');
      }

      await sink.flush();
      await sink.close();

      Fluttertoast.showToast(msg: "File created at: $filePath");
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error creating file: $e');
    }
  }

  Future<void> showBackupFilesDialog() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> files = appDir.listSync();
    List<String> fileNames = [];

    for (var file in files) {
      if (file.path.endsWith('.txt')) {
        fileNames.add(file.path.split('/').last);
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Backup Files'),
          content: SingleChildScrollView(
            child: Column(
              children: fileNames.map((fileName) {
                return ListTile(
                  title: Text(fileName),
                  onTap: () {
                    // Call a method to display content when file is clicked
                    displayFileContent(fileName);
                  },
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<void> displayFileContent(String fileName) async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDir.path}/$fileName';

    try {
      File file = File(filePath);
      if (await file.exists()) {
        String fileContent = await file.readAsString(); // Read entire content

        List<String> fileLines =
            fileContent.split('-----'); // Split by delimiter

        List<Map<String, dynamic>> dataList = [];

        for (String line in fileLines) {
          if (line.isNotEmpty) {
            try {
              // Skip empty lines
              Map<String, dynamic> record =
                  json.decode(line); // Decode JSON from line
              dataList.add(record); // Add data to the list
            } on FormatException catch (e) {
              //Fluttertoast.showToast(msg: 'Error decoding line: $e');
              // Handle or log the error here
            }
          }
        }

        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => BackupFileDisplay(
              fileName: fileName,
              dataList: dataList,
            ),
          ),
        );
      } else {
        Fluttertoast.showToast(msg: 'File not found!');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error reading file: $e');
    }
  }

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
                    MaterialPageRoute(builder: (context) => SettingsPage()),
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
                    'Backup Data',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(
                      width: 10.0), // Adjust the space between text and icon
                  Icon(
                    Icons.backup,
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
                    'Choose a backup option',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60.0),
            Padding(
              padding: EdgeInsets.only(left: 100.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Image.asset('assets/gdrive.png',
                          width: 70, height: 110, fit: BoxFit.cover)),

                  SizedBox(
                      width: 30.0), // Adjust the space between text and icon
                  OutlinedButton(
                      onPressed:
                          () {}, //Add onpressed here for opening language screen
                      style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(width: 1.0, color: Colors.black)),
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(100.0,
                                40.0), // Set the width and height of the button
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.green.shade200)),
                      child: Text('Google Drive',
                          style: TextStyle(color: Colors.black)))
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.only(left: 80.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Image.asset('assets/dropbox.png',
                          width: 110, height: 100, fit: BoxFit.cover)),

                  SizedBox(
                      width: 30.0), // Adjust the space between text and icon
                  OutlinedButton(
                      onPressed:
                          () {}, //Add onpressed here for opening language screen
                      style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(width: 1.0, color: Colors.black)),
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(100.0,
                                40.0), // Set the width and height of the button
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.green.shade200)),
                      child: Text('Dropbox',
                          style: TextStyle(color: Colors.black)))
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.only(left: 90.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.smartphone,
                    size: 90.0,
                  ),

                  SizedBox(
                      width: 30.0), // Adjust the space between text and icon
                  OutlinedButton(
                      onPressed: () async {
                        await createFile();
                      }, //Add onpressed here for opening language screen
                      style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(width: 1.0, color: Colors.black)),
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(100.0,
                                40.0), // Set the width and height of the button
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.green.shade200)),
                      child: Text('This Device',
                          style: TextStyle(color: Colors.black))),
                ],
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.only(left: 120.0),
              child: OutlinedButton(
                  onPressed: () async {
                    print(uniqueId);
                    if (uniqueId == "-") {
                      Fluttertoast.showToast(msg: "No reports created");
                    } else {
                      showBackupFilesDialog();
                      Fluttertoast.showToast(msg: "Reports created");
                    }
                  },
                  style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(width: 1.0, color: Colors.black)),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(50.0,
                            40.0), // Set the width and height of the button
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade200)),
                  child: Text('View backed up reports',
                      style: TextStyle(color: Colors.black))),
            ),
          ],
        ),
      ),
    );
  }
}
