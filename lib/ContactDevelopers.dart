import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gascert/Settings.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class ContactDevelopers extends StatefulWidget {
  @override
  _ContactDevelopersState createState() => _ContactDevelopersState();
}

class _ContactDevelopersState extends State<ContactDevelopers> {
  var contactController = TextEditingController();
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
                          'Contact Developers',
                          style: TextStyle(
                            fontSize: 29.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: 400.0,
                    height: 500.0,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0), // Adjust padding as needed
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '...',
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.all(8.0), // Adjust content padding
                        ),
                        controller: contactController,
                        maxLines:
                            null, // Allow the text field to expand vertically
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: EdgeInsets.only(left: 120.0),
                    child: OutlinedButton(
                        onPressed: () async {
                          String feedback = contactController.text;
                          Fluttertoast.showToast(msg: "Message Sent");
                          if (feedback.isNotEmpty) {
                            firestore
                                .collection("contact_messages")
                                .add({"Messages from users": feedback});
                          }
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => SettingsPage()));
                        },
                        style: ButtonStyle(
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(width: 1.0, color: Colors.black)),
                            minimumSize: MaterialStateProperty.all<Size>(
                              Size(150.0,
                                  40.0), // Set the width and height of the button
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green.shade200)),
                        child: Text('Submit',
                            style: TextStyle(color: Colors.black))),
                  ),
                ],
              ))),
    ));
  }
}
