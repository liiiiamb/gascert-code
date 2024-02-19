import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Click onto search for customer button, user enter postcode, search for postcode then if it is in the database display user found,
//if not, display user not found.

//On this page want to display all records in firebase DB for customers

final FirebaseAuth _auth = FirebaseAuth.instance;

class SearchCustomerPage extends StatelessWidget {
  final TextEditingController postcodeController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search for Customer'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showSearchDialog(context);
          },
          child: Text('Search for Customer'),
        ),
      ),
    );
  }

  Future<void> _showSearchDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Postcode'),
          content: TextField(
            controller: postcodeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Enter postcode'),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Search'),
              onPressed: () {
                _searchCustomer(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _searchCustomer(BuildContext context) async {
    String enteredPostcode = postcodeController.text;

    // Check if the entered postcode exists in the 'customers' collection
    // QuerySnapshot querySnapshot = await firestore
    //     .collection('customers')
    //     .where('postcode', isEqualTo: enteredPostcode)
    //     .get();

    var result = await FirebaseFirestore.instance
        .collection('customers')
        .where('postcode', isEqualTo: enteredPostcode)
        .get();
    //QuerySnapshot is empty - fix this

    if (result.docs.isNotEmpty) {
      // Postcode found
      Fluttertoast.showToast(
        msg: 'Customer found for postcode: $enteredPostcode',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      print('Entered Postcode: $enteredPostcode');
      print('Query Snapshot: ${result.docs}');
    } else {
      // Postcode not found
      Fluttertoast.showToast(
        msg: 'No customer found for postcode: $enteredPostcode',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      print('Entered Postcode: $enteredPostcode');
      print('Query Snapshot: ${result.docs}');
    }

    // Close the dialog
    Navigator.of(context).pop();
  }
}

void main() {
  runApp(
    MaterialApp(
      home: SearchCustomerPage(),
    ),
  );
}
