import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pdfWid;
import 'package:excel/excel.dart' as excel;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:permission_handler/permission_handler.dart';
import 'main.dart';
import 'TestDisplayData.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class TestFirestore extends StatelessWidget {
  TestFirestore({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var postcodeController = TextEditingController();
  var telephoneController = TextEditingController();
  var ageController = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  get data => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () =>
                  _showInputDialog(context, "Name", nameController),
              child: Text('Name'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _showInputDialog(context, "Age", ageController),
              child: Text('Age'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () =>
                  _showInputDialog(context, "Postcode", postcodeController),
              child: Text('Postcode'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () =>
                  _showInputDialog(context, "Telephone", telephoneController),
              child: Text('Telephone'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Your save functionality here
                String name = nameController.text;
                String age = ageController.text;
                String telephone = telephoneController.text;
                String postcode = postcodeController.text;

                var now = new DateTime.now();
                var formatter = new DateFormat('dd-MM-yyyy');
                String formattedDate = formatter.format(now);
                if (name.isNotEmpty &&
                    age.isNotEmpty &&
                    telephone.isNotEmpty &&
                    postcode.isNotEmpty &&
                    formattedDate.isNotEmpty) {
                  firestore.collection("customers").add({
                    "Name": name,
                    "Age": age,
                    "Telephone": telephone,
                    "Postcode": postcode,
                    "Date": formattedDate
                  });
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestDisplayData()),
                );
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  _showInputDialog(
      BuildContext context, String field, TextEditingController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter $field'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter $field'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () {
                // You can perform additional validation here if needed
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                controller.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
