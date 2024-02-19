import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';
import 'TestDisplayUser.dart';
import 'main.dart';

// void main() {
//   runApp(DisplayReport(
//     uniqueID: '',
//     isAppPressed1_One: true,
//     isAppPressed2_Two: true,
//     isAppPressed3_Three: true,
//     isAppPressed4_Four: true,
//   ));
// }

// class DisplayReport extends StatelessWidget {
//   // late final String uniqueID;
//   // final bool isAppPressed1_One;
//   // final bool isAppPressed2_Two;
//   // final bool isAppPressed3_Three;
//   // final bool isAppPressed4_Four;

//   // DisplayReport(
//   //     {required this.isAppPressed1_One,
//   //     required this.isAppPressed2_Two,
//   //     required this.isAppPressed3_Three,
//   //     required this.isAppPressed4_Four,
//   //     required this.uniqueID});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Report",
//       home: DisplayReportPage(uniqueID: uniqueID),
//     );
//   }
// }

class DisplayReportPage extends StatefulWidget {
  late final String uniqueID;

  DisplayReportPage({required this.uniqueID});
  @override
  _DisplayReportState createState() => _DisplayReportState();
}

class _DisplayReportState extends State<DisplayReportPage> {
  late List<Map<String, dynamic>> customerDetails;
  late String uniqueID;

  @override
  void initState() {
    super.initState();
    uniqueID = widget.uniqueID;

    // print('isAppPressed1_One: ${widget.isAppPressed1_One}');
    // print('isAppPressed2_Two: ${widget.isAppPressed2_Two}');
    // print('isAppPressed3_Three: ${widget.isAppPressed3_Three}');
    // print('isAppPressed4_Four: ${widget.isAppPressed3_Three}');
    _fetchDetails();
  }

  Future<void> _fetchDetails() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('customers')
          .where('ReportID', isEqualTo: widget.uniqueID)
          .get();

      setState(() {
        // Extract documents' data and store in a list
        customerDetails = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    } catch (e) {
      print('Error fetching customer details: $e');
    }
  }

  // String generateUniqueFileName() {
  //   String fName = reportData["First Name"] ?? "";
  //   String lName = reportData["Last Name"] ?? "";
  //   String post = reportData["Postcode"] ?? "";

  //   return '$fName$lName$post.json';
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Display Report'),
        //   backgroundColor: Colors.green.shade300,
        // ),
        body: Scrollbar(
            child: SingleChildScrollView(
                child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 25.0, top: 70.0, right: 340),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => HomePageScreen()));
                  },
                  child:
                      Icon(Icons.undo, size: 34.0, semanticLabel: 'Go back'))),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Report Details',
                  style: TextStyle(
                    fontSize: 29.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
          Text('', style: TextStyle(fontWeight: FontWeight.bold)),
          // Display customer details
          if (customerDetails != null)
            Column(
              children: customerDetails
                  .map((customer) => _buildCustomerDetail(customer))
                  .toList(),
            ),
        ],
      ),
    ))));
  }

  Widget _buildCustomerDetail(Map<String, dynamic> customer) {
    // Define the order in which fields should be displayed

    List<String> fieldOrder = [
      "Title",
      "Customer First Name",
      "Customer Last Name",
      "Customer Postcode",
      "Customer Address",
      "Customer Town/City",
      "Appliance 1 Location",
      "Appliance 1 Type",
      "Appliance 1 Manafacturer",
      "Appliance 1 Model",
      "Appliance 1 - Owned By Landlord",
      "Appliance 1 - Appliance Inspected",
      "Appliance 1 - Flue Type",
      "Appliance 1 - Operating Pressure",
      "Appliance 1 - Safety devices operating correctly",
      "Appliance 1 - Satisfactory Ventilation",
      "Appliance 1 - Visual Condition of Flue",
      "Appliance 1 - Termination satisfactory",
      "Appliance 1 - Flue performance checks complete",
      "Appliance 1 - Was Appliance Serviced?",
      "Appliance 1 - Is appliance safe to use?",
      "Appliance 1 - Reading 1/Min - CO",
      "Appliance 1 - Reading 1/Min - CO2",
      "Appliance 1 - Reading 1/Min - Ratio",
      "Appliance 1 - Reading 2/Max - CO",
      "Appliance 1 - Reading 2/Max - CO2",
      "Appliance 1 - Reading 2/Max - Ratio",
      "Appliance 1 - Defects Identified",
      "Appliance 1 - Remedial Action Taken",
      "Appliance 1 - Has warning notice been issued?",
      "Appliance 2 Location",
      "Appliance 2 Type",
      "Appliance 2 Manafacturer",
      "Appliance 2 Model",
      "Appliance 2 - Owned By Landlord",
      "Appliance 2 - Appliance Inspected",
      "Appliance 2 - Flue Type",
      "Appliance 2 - Operating Pressure",
      "Appliance 2 - Safety devices operating correctly",
      "Appliance 2 - Satisfactory Ventilation",
      "Appliance 2 - Visual Condition of Flue",
      "Appliance 2 - Termination satisfactory",
      "Appliance 2 - Flue performance checks complete",
      "Appliance 2 - Was Appliance Serviced?",
      "Appliance 2 - Is appliance safe to use?",
      "Appliance 2 - Reading 1/Min - CO",
      "Appliance 2 - Reading 1/Min - CO2",
      "Appliance 2 - Reading 1/Min - Ratio",
      "Appliance 2 - Reading 2/Max - CO",
      "Appliance 2 - Reading 2/Max - CO2",
      "Appliance 2 - Reading 2/Max - Ratio",
      "Appliance 2 - Defects Identified",
      "Appliance 2 - Remedial Action Taken",
      "Appliance 2 - Has warning notice been issued?",
      "Appliance 3 Location",
      "Appliance 3 Type",
      "Appliance 3 Manafacturer",
      "Appliance 3 Model",
      "Appliance 3 - Owned By Landlord",
      "Appliance 3 - Appliance Inspected",
      "Appliance 3 - Flue Type",
      "Appliance 3 - Operating Pressure",
      "Appliance 3 - Safety devices operating correctly",
      "Appliance 3 - Satisfactory Ventilation",
      "Appliance 3 - Visual Condition of Flue",
      "Appliance 3 - Termination satisfactory",
      "Appliance 3 - Flue performance checks complete",
      "Appliance 3 - Was Appliance Serviced?",
      "Appliance 3 - Is appliance safe to use?",
      "Appliance 3 - Reading 1/Min - CO",
      "Appliance 3 - Reading 1/Min - CO2",
      "Appliance 3 - Reading 1/Min - Ratio",
      "Appliance 3 - Reading 2/Max - CO",
      "Appliance 3 - Reading 2/Max - CO2",
      "Appliance 3 - Reading 2/Max - Ratio",
      "Appliance 3 - Defects Identified",
      "Appliance 3 - Remedial Action Taken",
      "Appliance 3 - Has warning notice been issued?",
      "Appliance 4 Location",
      "Appliance 4 Type",
      "Appliance 4 Manafacturer",
      "Appliance 4 Model",
      "Appliance 4 - Owned By Landlord",
      "Appliance 4 - Appliance Inspected",
      "Appliance 4 - Flue Type",
      "Appliance 4 - Operating Pressure",
      "Appliance 4 - Safety devices operating correctly",
      "Appliance 4 - Satisfactory Ventilation",
      "Appliance 4 - Visual Condition of Flue",
      "Appliance 4 - Termination satisfactory",
      "Appliance 4 - Flue performance checks complete",
      "Appliance 4 - Was Appliance Serviced?",
      "Appliance 4 - Is appliance safe to use?",
      "Appliance 4 - Reading 1/Min - CO",
      "Appliance 4 - Reading 1/Min - CO2",
      "Appliance 4 - Reading 1/Min - Ratio",
      "Appliance 4 - Reading 2/Max - CO",
      "Appliance 4 - Reading 2/Max - CO2",
      "Appliance 4 - Reading 2/Max - Ratio",
      "Appliance 4 - Defects Identified",
      "Appliance 4 - Remedial Action Taken",
      "Appliance 4 - Has warning notice been issued?",
      "Outcome of gas installation pipework visual inspection",
      "Outcome of gas supply pipework visual inspection",
      "Outcome of gas tightness test",
      "Is the emergency control valve access satisfactory?",
      "Is the protective equipotential bonding satisfactory?",
      "CO alarm present & working",
      "Smoke alarm present & working",
      "UserID",
      "ReportID",
      "Report Reference No.",
      "Date of report",
      "Date of next report"
    ];

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: fieldOrder
            .map((fieldName) => _buildField(fieldName, customer))
            .toList(),
      ),
    );
  }

  Widget _buildField(String fieldName, Map<String, dynamic> customer) {
    if (customer.containsKey(fieldName)) {
      return Padding(
          padding: EdgeInsets.symmetric(vertical: 0.01),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "$fieldName: ${customer[fieldName]}",
              textAlign: TextAlign.center,
              style: TextStyle(
                // Customize text style here
                fontSize: 15, // Change the font size
                fontWeight: FontWeight.normal, // Adjust font weight
                color: Colors.black, // Change text color
                // Add more text styling properties as needed
              ),
            ),
          ));
    } else {
      return SizedBox(); // Or return null if you want to skip this field
    }
  }
}
