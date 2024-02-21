import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWid;
import 'package:excel/excel.dart' as excel;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'main.dart';
import 'TestingScreen.dart';
import 'package:permission_handler/permission_handler.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class TestingScreen extends StatelessWidget {
  //home page screen here
  const TestingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    final gasNum = user?.email;

    String hexColor = "#606060";
    Color circCol =
        Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
    String hexColor2 = "#E5E5E5";
    Color twoCol =
        Color(int.parse(hexColor2.substring(1, 7), radix: 16) + 0xFF000000);
    Color dBlue =
        Color(int.parse('#3A82CB'.substring(1, 7), radix: 16) + 0xFF000000);

    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('Account Information')
          .where('Email Address', isEqualTo: _auth.currentUser?.email)
          .get(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          final docs = snapshot.data?.docs;
          if (docs != null && docs.isNotEmpty) {
            final data = docs[0].data() as Map<String, dynamic>;
            final gasSafetyNumber = data.containsKey('Gas Safety Number')
                ? data['Gas Safety Number']
                : 'N/A';
            final postcode =
                data.containsKey('Postcode') ? data['Postcode'] : 'N/A';
            final firstname =
                data.containsKey('First Name') ? data['First Name'] : 'N/A';
            final surname =
                data.containsKey('Surname') ? data['Surname'] : 'N/A';
            final address =
                data.containsKey('Address') ? data['Address'] : 'N/A';
            final telephone =
                data.containsKey('Telephone') ? data['Telephone'] : 'N/A';
            final tradingTitle = data.containsKey('Trading Title')
                ? data['Trading Title']
                : 'N/A';
            return Scaffold(
              body: ListView(
                children: [
                  ListTile(
                    title: Text('Gas Safety Number: $gasSafetyNumber'),
                  ),
                  ListTile(
                    title: Text('Postcode: $postcode'),
                  ),
                  ListTile(
                    title: Text('First name: $firstname'),
                  ),
                  ListTile(
                    title: Text('Surname: $surname'),
                  ),
                  ListTile(
                    title: Text('Address: $address'),
                  ),
                  ListTile(
                    title: Text('Telephone: $telephone'),
                  ),
                  ListTile(
                    title: Text('Trading Title: $tradingTitle'),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        } else {
          return Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }
}
