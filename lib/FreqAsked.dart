import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gascert/Settings.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class FreqAsked extends StatefulWidget {
  @override
  _FreqAskedState createState() => _FreqAskedState();
}

class _FreqAskedState extends State<FreqAsked> {
  var newFeaturesController = TextEditingController();
  final firestore = FirebaseFirestore.instance;

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
                    'FAQs',
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
                padding: EdgeInsets.only(left: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How can I create a PDF file?',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'To create a PDF file from a created report, you must click on a report within the past reports section of the app, then click Create PDF.',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto'),
                    ),
                  ],
                )),
            SizedBox(height: 25.0),
            Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How can I set a logo for my company?',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'To set a logo to be placed on each PDF, enter the Settings of the app, then click on the button to the right of Engineer Details, then click on Choose a Company Logo.',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto'),
                    ),
                  ],
                )),
            SizedBox(height: 25.0),
            Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How can I request new features?',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'To request new features to be added to the application, click on Contact Developers then submit a new feature, or any other feedback for developers.',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto'),
                    ),
                  ],
                )),
            SizedBox(height: 25.0),
            Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How can I recieve notifications for future reports?',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'To recieve future notifications, enter a phone number into your engineer information section, then enable future updates in the notification section of this apps settings. You will recieve a link through SMS to add an event to your calendar for the next gas safety report.',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto'),
                    ),
                  ],
                )),
          ]),
    ))));
  }
}
