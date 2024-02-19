import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:gascert/Appliance1_Combustion.dart';
import 'package:gascert/Appliance1_Inspection.dart';
import 'package:gascert/Appliance2_Combustion.dart';
import 'package:gascert/CreateReport.dart';
import 'package:gascert/PostReportOptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gascert/TestDisplayData.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:telephony/telephony.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:pdf/pdf.dart';
import 'BackupData.dart';
import 'FirestoreDataDisplay';
import 'TestDisplayUser.dart';
import 'dart:convert';
import 'dart:io';
import 'package:pdf/widgets.dart' as pdfWid;
import 'package:excel/excel.dart' as excel;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'SignUpScreen.dart';
import 'SignInScreen.dart';
import 'ForgPasswordScreen.dart';
import 'main.dart';
import 'TestingScreen.dart';
import 'package:permission_handler/permission_handler.dart';

class Appliance2Actions extends StatefulWidget {
  @override
  _ApplianceActionsState createState() => _ApplianceActionsState();
}

class _ApplianceActionsState extends State<Appliance2Actions> {
  var titleController = TextEditingController();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var postController = TextEditingController();
  var addressController = TextEditingController();

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
  String dropdownValue = "Location";
  String locValue = "-";
  String typeValue = "-";
  String currentText = "";
  String currentTextTwo = "";
  String currentTextThree = "";
  String flueValue = "Flue Type";
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

  @override
  void initState() {
    super.initState();
    _getInitialValues();
  }

  void _getInitialValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? defects = prefs.getString('defects2');
    String? remedial = prefs.getString('remedial2');
    String? warningNotice = prefs.getString('warningNotice2');
    if (remedial != null) {
      setState(() {
        defectsController.text = defects!;
        remedialController.text = remedial!;
        warningController.text = warningNotice!;
      });
    }
    if (warningNotice == "Yes") {
      setState(() {
        isWarning = true;
      });
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
                          MaterialPageRoute(
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
                    'Appliance 2',
                    style: TextStyle(
                      fontSize: 29.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Text(
                      "Actions",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter'),
                    ),
                  ],
                )),
            SizedBox(height: 50),
            Container(
              width: 400.0,
              height: 180.0,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 8.0), // Adjust padding as needed
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Defects Identified...',
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.all(8.0), // Adjust content padding
                  ),
                  controller: defectsController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      _debounce(() {
                        setState(() {
                          defectsController.text = value;
                        });
                      });
                    }
                  },
                  maxLines: null, // Allow the text field to expand vertically
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 400.0,
              height: 180.0,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 8.0), // Adjust padding as needed
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Remedial action taken...',
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.all(8.0), // Adjust content padding
                  ),
                  controller: remedialController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      _debounce(() {
                        setState(() {
                          remedialController.text = value;
                        });
                      });
                    }
                  },
                  maxLines: null, // Allow the text field to expand vertically
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: CheckboxListTile(
                title: Text("Has warning notice been issued?"),
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                value: isWarning,
                onChanged: (newValue) {
                  setState(() {
                    if (newValue != null) {
                      isWarning = newValue;
                      warningController.text = isWarning ? "Yes" : "No";
                    } else {
                      isWarning = false;
                      warningController.text = "No";
                    }
                  });
                },
                activeColor: Colors.black,
                checkColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: OutlinedButton(
                onPressed: () async {
                  String defects = defectsController.text;
                  String remedial = remedialController.text;
                  String warningNotice = warningController.text;

                  if (defects.isEmpty) {
                    defects = "none";
                  }
                  if (remedial.isEmpty) {
                    remedial = "none";
                  }

                  if (isWarning == false) {
                    warningNotice = "No";
                  }

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('defects2', defects);
                  prefs.setString('remedial2', remedial);
                  prefs.setString('warningNotice2', warningNotice);

                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => CreateReport()));
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
            ),
            Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () async {
                          // String type = TypeController.text;
                          // String loc = locOneController.text;
                          // String mana = ManafacturerController.text;
                          // String model = ModelController.text;
                          // String ownedBy = OwnedByController.text;
                          // String applianceInspect =
                          //     ApplianceInspectController.text;
                          // String flueType = FlueTypeController.text;

                          // SharedPreferences prefs =
                          //     await SharedPreferences.getInstance();
                          // prefs.setString('type', type);
                          // prefs.setString('location', loc);
                          // prefs.setString('manafacturer', mana);
                          // prefs.setString('model', model);
                          // prefs.setString('ownedBy', ownedBy);
                          // prefs.setString('applianceInspect', applianceInspect);
                          // prefs.setString('flueType', flueType);

                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      Appliance2Combustion()));
                        },
                        child: Icon(Icons.arrow_back,
                            size: 40.0, semanticLabel: 'Go to last page')),
                    SizedBox(
                      width: 80,
                    ),
                    DotsIndicator(
                      dotsCount: 4,
                      position: 3,
                      decorator: DotsDecorator(
                          color: Colors.black,
                          activeColor: Colors.green.shade200),
                    ),
                  ],
                )),
          ]),
    ))));
  }
}
