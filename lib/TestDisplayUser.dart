import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gascert/CreatePDF.dart';
import 'package:gascert/DisplayReport.dart';
import 'package:gascert/main.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:material_dialogs/material_dialogs.dart';

import 'PDFtest.dart';

// void main() {
//   runApp(TestDisplayUser());
// }

// class MyApp extends StatelessWidget {
//   final CreateReport = CreateReport();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firestore Data',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: TestDisplayUser(
//           isAppPressed_One: isApp1Pressed,
//           isAppPressed_Two: isApp2Pressed,
//           isAppPressed_Three: isApp3Pressed,
//           isAppPressed_Four: isApp4Pressed),
//     );
//   }
// }

class TestDisplayUser extends StatefulWidget {
  final bool isAppPressed_One;
  final bool isAppPressed_Two;
  final bool isAppPressed_Three;
  final bool isAppPressed_Four;

  TestDisplayUser(
      {required this.isAppPressed_One,
      required this.isAppPressed_Two,
      required this.isAppPressed_Three,
      required this.isAppPressed_Four});

  @override
  _TestDisplayUserState createState() => _TestDisplayUserState();
}

class _TestDisplayUserState extends State<TestDisplayUser> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _searchController = TextEditingController();

  Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentUserId = prefs.getString('userID');
    print('Current User ID: $currentUserId'); // Print currentUserId
    print('isAppPressedOne: ${widget.isAppPressed_One}');
    print('isAppPressedTwo: ${widget.isAppPressed_Two}');
    print('isAppPressedThree: ${widget.isAppPressed_Three}');
    print('isAppPressedFour: ${widget.isAppPressed_Four}');

    return currentUserId ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Past Reports'),
      //   backgroundColor: Colors.green.shade300,
      // ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 05.0, top: 70.0, right: 300),
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
                  'View Past Reports',
                  style: TextStyle(
                    fontSize: 29.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by name or postcode',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Flexible(
            child: FutureBuilder<String>(
              future: getUserId(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                String currentUserId = snapshot.data ?? '';

                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('customers')
                      .where('UserID', isEqualTo: currentUserId)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No records found.'));
                    }

                    List<QueryDocumentSnapshot> filteredCustomers =
                        snapshot.data!.docs.where((document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      String searchTerm = _searchController.text.toLowerCase();
                      String customerFName = data['Customer First Name'] ?? '';
                      String customerPost = data['Customer Postcode'] ?? '';
                      return customerFName.toLowerCase().contains(searchTerm) ||
                          customerPost.toLowerCase().contains(searchTerm);
                    }).toList();

                    if (filteredCustomers.isEmpty) {
                      return Center(child: Text('No customers found.'));
                    }

                    return ListView.builder(
                      itemCount: filteredCustomers.length,
                      itemBuilder: (BuildContext context, int index) {
                        var doc = filteredCustomers[index];
                        return ListTile(
                          title: Text(doc['Customer First Name']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Customer Postcode: ${doc['Customer Postcode']}'),
                              //Text('Date: ${doc['Date']}'),
                              //Text('Report ID: ${doc['Report ID']}')
                            ],
                          ),
                          onTap: () {
                            String reportID = doc['ReportID'];
                            // CupertinoAlertDialog(
                            //   title: Text('Select an option'),
                            //   actions: [
                            //     CupertinoDialogAction(
                            //         onPressed: () {
                            //           Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //               builder: (context) =>
                            //                   DisplayReportPage(
                            //                 uniqueID: reportID,
                            //               ),
                            //             ),
                            //           );
                            //         },
                            //         child: Text('View Report Content')),
                            //     CupertinoDialogAction(
                            //         onPressed: () {}, child: Text('View PDF'))
                            //   ],
                            // );
                            Dialogs.materialDialog(
                                title: "Select an option",
                                color: Colors.white,
                                context: context,
                                actions: [
                                  IconsOutlineButton(
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     CupertinoPageRoute(
                                      //         // builder: ((context) => CreatePDF(
                                      //         //     uniqueID: reportID))));
                                      //         builder: (((context) => CreatePDF(
                                      //               uniqueID: reportID,
                                      //             )))));
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  DocumentPage()));
                                    },
                                    text: 'Create PDF',
                                    iconData: Icons.picture_as_pdf_rounded,
                                    textStyle: TextStyle(color: Colors.black),
                                    iconColor: Colors.grey,
                                  ),
                                  IconsOutlineButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DisplayReportPage(
                                            uniqueID: reportID,
                                          ),
                                        ),
                                      );
                                    },
                                    text: 'View Report',
                                    iconData: Icons.search,
                                    textStyle: TextStyle(color: Colors.black),
                                    iconColor: Colors.grey,
                                  ),
                                ]);
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
