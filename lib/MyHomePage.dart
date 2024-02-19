import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gascert/SearchTestingScreen.dart';
import 'SearchCustomerPage.dart';
import 'SearchScreen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  var postcodeController = TextEditingController();
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var teleController = TextEditingController();
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('TextField in Dialog'),
                      content: TextField(
                        controller: ageController,
                        decoration:
                            InputDecoration(hintText: "Text Field in Dialog"),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text('CANCEL'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        ElevatedButton(
                          child: Text('OK'),
                          onPressed: () {
                            print(ageController.text);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  }),
              child: Text('Enter Age'),
            ),
            ElevatedButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('TextField in Dialog'),
                      content: TextField(
                        controller: nameController,
                        decoration:
                            InputDecoration(hintText: "Text Field in Dialog"),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text('CANCEL'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        ElevatedButton(
                          child: Text('OK'),
                          onPressed: () {
                            print(nameController.text);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  }),
              child: Text('Enter Name'),
            ),
            ElevatedButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('TextField in Dialog'),
                      content: TextField(
                        controller: teleController,
                        decoration:
                            InputDecoration(hintText: "Text Field in Dialog"),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text('CANCEL'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        ElevatedButton(
                          child: Text('OK'),
                          onPressed: () {
                            print(teleController.text);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  }),
              child: Text('Enter Telephone'),
            ),
            ElevatedButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('TextField in Dialog'),
                      content: TextField(
                        controller: postcodeController,
                        decoration:
                            InputDecoration(hintText: "Text Field in Dialog"),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text('CANCEL'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        ElevatedButton(
                          child: Text('OK'),
                          onPressed: () {
                            print(postcodeController.text);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  }),
              child: Text('Enter Postcode'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your save logic here

                // Show toast message

                if (nameController.text.isNotEmpty &&
                    ageController.text.isNotEmpty &&
                    postcodeController.text.isNotEmpty &&
                    teleController.text.isNotEmpty) {
                  Fluttertoast.showToast(
                    msg: "Saved!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  firestore.collection('customers').doc().set({
                    "Name": nameController.text,
                    "Age": ageController.text,
                    "Postcode": postcodeController.text,
                    "Telephone Number": teleController.text
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchTestingScreen()),
                  );
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
