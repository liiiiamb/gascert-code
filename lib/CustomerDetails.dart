import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:gascert/CreateReport.dart';
import 'package:gascert/PostReportOptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:telephony/telephony.dart';

import 'package:pdf/pdf.dart';
import 'BackupData.dart';
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

final FirebaseAuth _auth = FirebaseAuth.instance;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(CreateReport());
// }
class CustomerDetails extends StatefulWidget {
  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  late String userId;
  String emailAdd = '';

  var titleController = TextEditingController();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var postController = TextEditingController();
  var addressController = TextEditingController();
  var telController = TextEditingController();
  var cityController = TextEditingController();
  var locOneController = TextEditingController();
  var locOneController_2 = TextEditingController();
  var locOneController_3 = TextEditingController();
  var locOneController_4 = TextEditingController();
  var FlueTypeController = TextEditingController();
  var outcomeGasInstallController = TextEditingController();
  var outcomeGasSafeController = TextEditingController();
  var outcomeGasTightController = TextEditingController();
  var emergencyControlController = TextEditingController();
  var protectiveController = TextEditingController();
  var coAlarmController = TextEditingController();
  var smokeAlarmController = TextEditingController();
  var ApplianceInspectController = TextEditingController();
  var OwnedByController = TextEditingController();
  var operatePressureController = TextEditingController();
  var ModelController = TextEditingController();
  var ManafacturerController = TextEditingController();
  var TypeController = TextEditingController();
  var customLocController = TextEditingController();
  var safetyController = TextEditingController();
  var satisController = TextEditingController();
  var visualController = TextEditingController();
  var terminationController = TextEditingController();
  var fluePerformController = TextEditingController();
  var applianceServiceController = TextEditingController();
  var applianceSafeController = TextEditingController();
  var coController1 = TextEditingController();
  var remedialController = TextEditingController();
  var defectsController = TextEditingController();
  var warningController = TextEditingController();
  var co2Controller1 = TextEditingController();
  var ratioController1 = TextEditingController();
  var coController2 = TextEditingController();
  var co2Controller2 = TextEditingController();
  var ratioController2 = TextEditingController();
  var FlueTypeController_2 = TextEditingController();
  var ApplianceInspectController_2 = TextEditingController();
  var OwnedByController_2 = TextEditingController();
  var operatePressureController_2 = TextEditingController();
  var ModelController_2 = TextEditingController();
  var ManafacturerController_2 = TextEditingController();
  var TypeController_2 = TextEditingController();
  var customLocController_2 = TextEditingController();
  var safetyController_2 = TextEditingController();
  var satisController_2 = TextEditingController();
  var visualController_2 = TextEditingController();
  var terminationController_2 = TextEditingController();
  var fluePerformController_2 = TextEditingController();
  var applianceServiceController_2 = TextEditingController();
  var applianceSafeController_2 = TextEditingController();
  var coController1_2 = TextEditingController();
  var remedialController_2 = TextEditingController();
  var defectsController_2 = TextEditingController();
  var warningController_2 = TextEditingController();
  var co2Controller1_2 = TextEditingController();
  var ratioController1_2 = TextEditingController();
  var coController2_2 = TextEditingController();
  var co2Controller2_2 = TextEditingController();
  var ratioController2_2 = TextEditingController();
  var FlueTypeController_3 = TextEditingController();
  var ApplianceInspectController_3 = TextEditingController();
  var OwnedByController_3 = TextEditingController();
  var operatePressureController_3 = TextEditingController();
  var ModelController_3 = TextEditingController();
  var ManafacturerController_3 = TextEditingController();
  var TypeController_3 = TextEditingController();
  var customLocController_3 = TextEditingController();
  var safetyController_3 = TextEditingController();
  var satisController_3 = TextEditingController();
  var visualController_3 = TextEditingController();
  var terminationController_3 = TextEditingController();
  var fluePerformController_3 = TextEditingController();
  var applianceServiceController_3 = TextEditingController();
  var applianceSafeController_3 = TextEditingController();
  var coController1_3 = TextEditingController();
  var remedialController_3 = TextEditingController();
  var defectsController_3 = TextEditingController();
  var warningController_3 = TextEditingController();
  var co2Controller1_3 = TextEditingController();
  var ratioController1_3 = TextEditingController();
  var coController2_3 = TextEditingController();
  var co2Controller2_3 = TextEditingController();
  var ratioController2_3 = TextEditingController();
  var FlueTypeController_4 = TextEditingController();
  var ApplianceInspectController_4 = TextEditingController();
  var OwnedByController_4 = TextEditingController();
  var operatePressureController_4 = TextEditingController();
  var ModelController_4 = TextEditingController();
  var ManafacturerController_4 = TextEditingController();
  var TypeController_4 = TextEditingController();
  var customLocController_4 = TextEditingController();
  var safetyController_4 = TextEditingController();
  var satisController_4 = TextEditingController();
  var visualController_4 = TextEditingController();
  var terminationController_4 = TextEditingController();
  var fluePerformController_4 = TextEditingController();
  var applianceServiceController_4 = TextEditingController();
  var applianceSafeController_4 = TextEditingController();
  var coController1_4 = TextEditingController();
  var remedialController_4 = TextEditingController();
  var defectsController_4 = TextEditingController();
  var warningController_4 = TextEditingController();
  var co2Controller1_4 = TextEditingController();
  var ratioController1_4 = TextEditingController();
  var coController2_4 = TextEditingController();
  var co2Controller2_4 = TextEditingController();
  var ratioController2_4 = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  get data => null;
  String dropdownValue = "Title";
  String locValue = "-";
  String typeValue = "-";
  String currentText = "";
  String currentTextTwo = "";
  String currentTextThree = "";
  String flueValue = "-";
  bool isOwnedOne = false;
  bool isInspectOne = false;
  bool isWarning = false;
  bool isSafe = false;
  bool isSatis = false;
  bool isVisual = false;
  bool isTerminate = false;
  bool isFluePerform = false;
  bool isApplianceService = false;
  bool isApplianceSafe = false;
  bool isApp1Pressed = false;
  bool isApp2Pressed = false;
  bool isApp3Pressed = false;
  bool isApp4Pressed = false;
  String dropdownValue_2 = "-";
  String locValue_2 = "-";
  String typeValue_2 = "-";
  String currentText_2 = "";
  String currentTextTwo_2 = "";
  String currentTextThree_2 = "";
  String flueValue_2 = "-";
  bool isOwnedOne_2 = false;
  bool isInspectOne_2 = false;
  bool isWarning_2 = false;
  bool isSafe_2 = false;
  bool isSatis_2 = false;
  bool isVisual_2 = false;
  bool isTerminate_2 = false;
  bool isFluePerform_2 = false;
  bool isApplianceService_2 = false;
  bool isApplianceSafe_2 = false;
  bool isOwnedOne_3 = false;
  bool isInspectOne_3 = false;
  bool isWarning_3 = false;
  bool isSafe_3 = false;
  bool isSatis_3 = false;
  bool isVisual_3 = false;
  bool isTerminate_3 = false;
  bool isFluePerform_3 = false;
  bool isApplianceService_3 = false;
  bool isApplianceSafe_3 = false;
  String dropdownValue_3 = "-";
  String locValue_3 = "-";
  String typeValue_3 = "-";
  String currentText_3 = "";
  String currentTextTwo_3 = "";
  String currentTextThree_3 = "";
  String flueValue_3 = "-";
  bool isOwnedOne_4 = false;
  bool isInspectOne_4 = false;
  bool isWarning_4 = false;
  bool isSafe_4 = false;
  bool isSatis_4 = false;
  bool isVisual_4 = false;
  bool isTerminate_4 = false;
  bool isFluePerform_4 = false;
  bool isApplianceService_4 = false;
  bool isApplianceSafe_4 = false;
  String dropdownValue_4 = "-";
  String locValue_4 = "-";
  String typeValue_4 = "-";
  String currentText_4 = "";
  String currentTextTwo_4 = "";
  String currentTextThree_4 = "";
  String flueValue_4 = "-";
  bool isOutcomeGasInstall = false;
  bool isOutcomeGasSupply = false;
  bool isOutcomeGasTight = false;
  bool isEmergencyAccess = false;
  bool isProtective = false;
  bool alarmPresent = false;
  bool smokePresent = false;
  String isUpdate = "";

  // String _generateUserId(User? user) {
  //   if (user != null) {
  //     String uid = user.uid;
  //     return uid;
  //   }
  //   return '';
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _initDeviceId();
  // }

  // void _initDeviceId() {
  //   userId = Uuid().v4();
  // }

  @override
  void initState() {
    super.initState();
    _initUserId();
    getEmailFromShared();
    _getInitialValues();
  }

  void _getInitialValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? firstName = prefs.getString('firstName');
    String? title1 = prefs.getString('title');
    String? lastName = prefs.getString('lastName');
    String? post = prefs.getString('post');
    String? address = prefs.getString('address');
    String? town = prefs.getString('town');
    String? telephone = prefs.getString('telephone');
    if (firstName != null) {
      setState(() {
        fNameController.text = firstName;
        titleController.text = title1!;
        lNameController.text = lastName!;
        postController.text = post!;
        addressController.text = address!;
        cityController.text = town!;
        telController.text = telephone!;
      });
    }
    // if (title != null) {
    //   setState(() {
    //     titleController.text = title;
    //   });
    // }
  }

  void _initUserId() async {
    userId = await generateUserId();
    setState(() {});
  }

  Future<void> getEmailFromShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userEmail = prefs.getString('Email') ?? '';

    setState(() {
      emailAdd = userEmail;
    });
  }

  Future<String> generateUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUserId = prefs.getString('userID');
    if (storedUserId != null && storedUserId.isNotEmpty) {
      return storedUserId;
    } else {
      var uuid = Uuid();
      userId = uuid.v4();
      await prefs.setString('userID', userId);
      return userId;
    }
  }

  Timer? _debounceTimer;

  Future<void> _debounce(VoidCallback callback) async {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), callback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   //title: Text('CREATE REPORT'),
        //   backgroundColor: Colors.green.shade300,
        // ),
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
                              builder: (context) => CreateReport()));
                    },
                    child: Icon(Icons.undo,
                        size: 34.0, semanticLabel: 'Go back'))),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Customer Details',
                    style: TextStyle(
                      fontSize: 29.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Icon(
                Icons.person,
                size: 34.0,
                semanticLabel: 'Go back',
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.menu),
                items: <String>['Title', 'Mr', 'Mrs', 'Miss', 'Ms', 'Dr']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    titleController.text = newValue;
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300.0,
              height: 70.0,
              padding: EdgeInsets.only(left: 90.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter first name',
                ),
                controller: fNameController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+'))
                ],
                // onChanged: (value) {
                //   if (value.isNotEmpty) {
                //     _debounce(() {
                //       setState(() {
                //         fNameController.text = value;
                //       });
                //     });
                //   }
                // },
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300.0,
              height: 70.0,
              padding: EdgeInsets.only(left: 90.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter last name',
                ),
                controller: lNameController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+'))
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 270.0,
              height: 70.0,
              padding: EdgeInsets.only(left: 110.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.pin_drop),
                  hintText: 'Enter postcode',
                ),
                controller: postController,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 360.0,
              height: 70.0,
              padding: EdgeInsets.only(left: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.home),
                  hintText: 'Enter address',
                ),
                controller: addressController,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300.0,
              height: 70.0,
              padding: EdgeInsets.only(left: 90.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.map),
                  hintText: 'Enter town/city',
                ),
                controller: cityController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+'))
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300.0,
              height: 70.0,
              padding: EdgeInsets.only(left: 90.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: 'Enter telephone number',
                ),
                controller: telController,
                keyboardType: TextInputType.numberWithOptions(),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]+')),
                  LengthLimitingTextInputFormatter(11)
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: OutlinedButton(
                onPressed: () async {
                  String title = titleController.text;
                  String fName = fNameController.text;
                  String lName = lNameController.text;
                  String post = postController.text;
                  String address = addressController.text;
                  String town = cityController.text;
                  String telephone = telController.text;

                  if (title.isEmpty) {
                    title = "-";
                  }
                  if (fName.isEmpty) {
                    fName = "-";
                  }
                  if (lName.isEmpty) {
                    lName = "-";
                  }
                  if (post.isEmpty) {
                    post = "-";
                  }
                  if (address.isEmpty) {
                    address = "-";
                  }
                  if (town.isEmpty) {
                    town = "-";
                  }
                  if (telephone.isEmpty) {
                    telephone = "-";
                  }

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('title', title);
                  prefs.setString('firstName', fName);
                  prefs.setString('lastName', lName);
                  prefs.setString('post', post);
                  prefs.setString('address', address);
                  prefs.setString('town', town);
                  prefs.setString('telephone', telephone);

                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => CreateReport()),
                  );
                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(width: 1.0, color: Colors.black),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(150.0, 40.0), // Set the width and height of the button
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green.shade200,
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ]),
    ))));
  }
}
