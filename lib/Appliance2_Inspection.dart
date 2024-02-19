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
import 'package:gascert/Appliance1_Details.dart';
import 'package:gascert/Appliance2_Combustion.dart';
import 'package:gascert/Appliance2_Details.dart';
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

class Appliance2Inspection extends StatefulWidget {
  @override
  _ApplianceInspectionState createState() => _ApplianceInspectionState();
}

class _ApplianceInspectionState extends State<Appliance2Inspection> {
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
    String? opPress = prefs.getString('opPress2');
    String? safetyCorrect = prefs.getString('safetyCorrect2');
    String? satisfactory = prefs.getString('satisfactory2');
    String? visual = prefs.getString('visual2');
    String? termination = prefs.getString('termination2');
    String? fluePerformance = prefs.getString('fluePerformance2');
    String? applianceService = prefs.getString('applianceService2');
    String? applianceSafe = prefs.getString('applianceSafe2');
    if (visual != null) {
      setState(() {
        operatePressureController.text = opPress!;
        safetyController.text = safetyCorrect!;
        satisController.text = satisfactory!;
        visualController.text = visual;
        terminationController.text = termination!;
        fluePerformController.text = fluePerformance!;
        applianceServiceController.text = applianceService!;
        applianceSafeController.text = applianceSafe!;
      });
    }
    if (safetyCorrect == "Yes") {
      setState(() {
        isSafe = true;
      });
    }
    if (satisfactory == "Yes") {
      setState(() {
        isSatis = true;
      });
    }
    if (visual == "Yes") {
      setState(() {
        isVisual = true;
      });
    }
    if (termination == "Yes") {
      setState(() {
        isTerminate = true;
      });
    }
    if (fluePerformance == "Yes") {
      setState(() {
        isFluePerform = true;
      });
    }
    if (applianceService == "Yes") {
      setState(() {
        isApplianceService = true;
      });
    }
    if (applianceSafe == "Yes") {
      setState(() {
        isApplianceSafe = true;
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
                      "Inspection Details",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter'),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Container(
              width: 320.0,
              height: 70.0,
              padding: EdgeInsets.only(left: 40.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.pin),
                  hintText: 'Operating Pressue (mBars)',
                ),
                controller: operatePressureController,
                onChanged: (String value) {
                  _debounce(() {
                    setState(() {
                      operatePressureController.text = value;
                    });
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: CheckboxListTile(
                title: Text("Safety Devices operating correctly?"),
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                value: isSafe,
                onChanged: (newValue) {
                  setState(() {
                    if (newValue != null) {
                      isSafe = newValue;
                      safetyController.text = isSafe ? "Yes" : "No";
                    } else {
                      isSafe = false;
                      safetyController.text = "No";
                    }
                  });
                },
                activeColor: Colors.black,
                checkColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: CheckboxListTile(
                title: Text("Satisfactory Ventilation?"),
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                value: isSatis,
                onChanged: (newValue) {
                  setState(() {
                    if (newValue != null) {
                      isSatis = newValue;
                      satisController.text = isSatis ? "Yes" : "No";
                    } else {
                      isSatis = false;
                      satisController.text = "No";
                    }
                  });
                },
                activeColor: Colors.black,
                checkColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: CheckboxListTile(
                title: Text("Visual condition of flue?"),
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                value: isVisual,
                onChanged: (newValue) {
                  setState(() {
                    if (newValue != null) {
                      isVisual = newValue;
                      visualController.text = isVisual ? "Yes" : "No";
                    } else {
                      isVisual = false;
                      visualController.text = "No";
                    }
                  });
                },
                activeColor: Colors.black,
                checkColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: CheckboxListTile(
                title: Text("Termination satisfactory?"),
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                value: isTerminate,
                onChanged: (newValue) {
                  setState(() {
                    if (newValue != null) {
                      isTerminate = newValue;
                      terminationController.text = isTerminate ? "Yes" : "No";
                    } else {
                      isTerminate = false;
                      terminationController.text = "No";
                    }
                  });
                },
                activeColor: Colors.black,
                checkColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: CheckboxListTile(
                title: Text("Flue performance checks complete"),
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                value: isFluePerform,
                onChanged: (newValue) {
                  setState(() {
                    if (newValue != null) {
                      isFluePerform = newValue;
                      fluePerformController.text = isFluePerform ? "Yes" : "No";
                    } else {
                      isFluePerform = false;
                      fluePerformController.text = "No";
                    }
                  });
                },
                activeColor: Colors.black,
                checkColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: CheckboxListTile(
                title: Text("Was appliance serviced?"),
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                value: isApplianceService,
                onChanged: (newValue) {
                  setState(() {
                    if (newValue != null) {
                      isApplianceService = newValue;
                      applianceServiceController.text =
                          isApplianceService ? "Yes" : "No";
                    } else {
                      isApplianceService = false;
                      applianceServiceController.text = "No";
                    }
                  });
                },
                activeColor: Colors.black,
                checkColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: CheckboxListTile(
                title: Text("Is appliance safe to use?"),
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                value: isApplianceSafe,
                onChanged: (newValue) {
                  setState(() {
                    if (newValue != null) {
                      isApplianceSafe = newValue;
                      applianceSafeController.text =
                          isApplianceSafe ? "Yes" : "No";
                    } else {
                      isApplianceSafe = false;
                      applianceSafeController.text = "No";
                    }
                  });
                },
                activeColor: Colors.black,
                checkColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
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
                                  builder: (context) => Appliance2()));
                        },
                        child: Icon(Icons.arrow_back,
                            size: 40.0, semanticLabel: 'Go to last page')),
                    SizedBox(
                      width: 80,
                    ),
                    DotsIndicator(
                      dotsCount: 4,
                      position: 1,
                      decorator: DotsDecorator(
                          color: Colors.black,
                          activeColor: Colors.green.shade200),
                    ),
                    SizedBox(width: 80),
                    GestureDetector(
                        onTap: () async {
                          String opPress = operatePressureController.text;
                          String safetyCorrect = safetyController.text;
                          String satisfactory = satisController.text;
                          String visual = visualController.text;
                          String termination = terminationController.text;
                          String fluePerformance = fluePerformController.text;
                          String applianceService =
                              applianceServiceController.text;
                          String applianceSafe = applianceSafeController.text;

                          if (isSafe == false) {
                            safetyCorrect = "No";
                          }
                          if (isVisual == false) {
                            visual = "No";
                          }
                          if (isSatis == false) {
                            satisfactory = "No";
                          }
                          if (isTerminate == false) {
                            termination = "No";
                          }
                          if (isFluePerform == false) {
                            fluePerformance = "No";
                          }
                          if (isApplianceService == false) {
                            applianceService = "No";
                          }
                          if (isApplianceSafe == false) {
                            applianceSafe = "No";
                          }

                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('opPress2', opPress);
                          prefs.setString('safetyCorrect2', safetyCorrect);
                          prefs.setString('satisfactory2', satisfactory);
                          prefs.setString('visual2', visual);
                          prefs.setString('termination2', termination);
                          prefs.setString('fluePerformance2', fluePerformance);
                          prefs.setString(
                              'applianceService2', applianceService);
                          prefs.setString('applianceSafe2', applianceSafe);

                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      Appliance2Combustion()));
                        },
                        child: Icon(Icons.arrow_forward,
                            size: 40.0, semanticLabel: 'Go to next page'))
                  ],
                )),
          ]),
    ))));
  }
}
