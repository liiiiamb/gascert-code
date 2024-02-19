import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gascert/Settings.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notifications extends StatefulWidget {
  @override
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notifications> {
  var newFeaturesController = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  bool isUpdateEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(backgroundColor: Colors.green.shade300),
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
                    CupertinoPageRoute(builder: (context) => SettingsPage()),
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
                    'Notifications',
                    style: TextStyle(
                      fontSize: 29.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.only(left: 60.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Enable future updates",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Inter',
                    ),
                  ),

                  SizedBox(width: 30.0),
                  Switch(
                      value: isUpdateEnabled,
                      activeColor: Colors.green.shade200,
                      onChanged: (bool value) {
                        setState(() {
                          isUpdateEnabled = value;
                        });
                      }), // Adjust the space between text and icon
                ],
              ),
            ),
            SizedBox(height: 505.0),
            Padding(
              padding: EdgeInsets.only(left: 140.0),
              child: OutlinedButton(
                  onPressed: () async {
                    String isUpdateString = isUpdateEnabled.toString();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('isUpdate', isUpdateString);
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => SettingsPage()),
                    );
                  }, //Add onpressed here for opening language screen
                  style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(width: 1.0, color: Colors.black)),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(100.0,
                            40.0), // Set the width and height of the button
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade200)),
                  child: Text('Save', style: TextStyle(color: Colors.black))),
            ),
          ]),
    ))));
  }
}
