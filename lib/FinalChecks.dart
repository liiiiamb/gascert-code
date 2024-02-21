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
import 'package:gascert/CreateReport.dart';
import 'package:gascert/PostReportOptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import 'main.dart';
import 'TestingScreen.dart';
import 'package:permission_handler/permission_handler.dart';

class FinalChecks extends StatefulWidget {
  @override
  _FinalChecksState createState() => _FinalChecksState();
}

class _FinalChecksState extends State<FinalChecks> {
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
  var gasController = TextEditingController();
  var supplyController = TextEditingController();
  var tightController = TextEditingController();
  var controlController = TextEditingController();
  var protectController = TextEditingController();
  var alarmController = TextEditingController();
  var smokeController = TextEditingController();
  bool isGasInstall = false;
  bool isGasSupply = false;
  bool isGasTight = false;
  bool isEmergencyControl = false;
  bool isProtect = false;
  bool isAlarmPresent = false;
  bool isSmokePresent = false;

  @override
  void initState() {
    super.initState();
    _getInitialValues();
  }

  void _getInitialValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? outcomeGasInstall = prefs.getString('gasInstall');
    String? outcomeGasSupply = prefs.getString('gasSupply');
    String? outcomeGasTight = prefs.getString('gasTight');
    String? emergencyControl = prefs.getString('emergencyControl');
    String? protective = prefs.getString('protective');
    String? alarmPresent = prefs.getString('alarmPresent');
    String? smokePresent = prefs.getString('smokePresent');

    setState(() {
      gasController.text = outcomeGasInstall!;
      supplyController.text = outcomeGasSupply!;
      tightController.text = outcomeGasTight!;
      controlController.text = emergencyControl!;
      protectController.text = protective!;
      alarmController.text = alarmPresent!;
      smokeController.text = smokePresent!;
    });

    if (outcomeGasInstall == "Pass") {
      setState(() {
        isGasInstall = true;
      });
    }
    if (outcomeGasSupply == "Pass") {
      setState(() {
        isGasSupply = true;
      });
    }
    if (outcomeGasTight == "Pass") {
      setState(() {
        isGasTight = true;
      });
    }
    if (emergencyControl == "Yes") {
      setState(() {
        isEmergencyControl = true;
      });
    }
    if (protective == "Yes") {
      setState(() {
        isProtect = true;
      });
    }
    if (alarmPresent == "Yes") {
      setState(() {
        isAlarmPresent = true;
      });
    }
    if (smokePresent == "Yes") {
      setState(() {
        isSmokePresent = true;
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
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                CreateReport()));
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
                                  'Final Checks',
                                  style: TextStyle(
                                    fontSize: 29.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 50),
                          Padding(
                            padding: EdgeInsets.only(left: 80),
                            child: CheckboxListTile(
                              title: Text(
                                  "Outcome of Gas Installation Pipework Visual Inspection"),
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.leading,
                              value: isGasInstall,
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    isGasInstall = newValue;
                                    gasController.text =
                                        isGasInstall ? "Pass" : "Fail";
                                  } else {
                                    isGasInstall = false;
                                    gasController.text = "Fail";
                                  }
                                });
                              },
                              activeColor: Colors.black,
                              checkColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: EdgeInsets.only(left: 80),
                            child: CheckboxListTile(
                              title: Text(
                                  "Outcome of Gas Supply Pipework Visual Inspection"),
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.leading,
                              value: isGasSupply,
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    isGasSupply = newValue;
                                    supplyController.text =
                                        isGasSupply ? "Pass" : "Fail";
                                  } else {
                                    isGasSupply = false;
                                    supplyController.text = "Fail";
                                  }
                                });
                              },
                              activeColor: Colors.black,
                              checkColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: CheckboxListTile(
                              title: Text("Outcome of gas tightness test"),
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.leading,
                              value: isGasTight,
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    isGasTight = newValue;
                                    tightController.text =
                                        isGasTight ? "Pass" : "Fail";
                                  } else {
                                    isGasTight = false;
                                    tightController.text = "Fail";
                                  }
                                });
                              },
                              activeColor: Colors.black,
                              checkColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 80),
                            child: CheckboxListTile(
                              title: Text(
                                  "Is the emergency control valve access satisfactory?"),
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.leading,
                              value: isEmergencyControl,
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    isEmergencyControl = newValue;
                                    controlController.text =
                                        isEmergencyControl ? "Yes" : "No";
                                  } else {
                                    isEmergencyControl = false;
                                    controlController.text = "No";
                                  }
                                });
                              },
                              activeColor: Colors.black,
                              checkColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 80),
                            child: CheckboxListTile(
                              title: Text(
                                  "Is the protective equipotential bonding satisfactory?"),
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.leading,
                              value: isProtect,
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    isProtect = newValue;
                                    protectController.text =
                                        isProtect ? "Yes" : "No";
                                  } else {
                                    isProtect = false;
                                    protectController.text = "No";
                                  }
                                });
                              },
                              activeColor: Colors.black,
                              checkColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 80),
                            child: CheckboxListTile(
                              title: Text("CO Alarm present & working"),
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.leading,
                              value: isAlarmPresent,
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    isAlarmPresent = newValue;
                                    alarmController.text =
                                        isAlarmPresent ? "Yes" : "No";
                                  } else {
                                    isAlarmPresent = false;
                                    alarmController.text = "No";
                                  }
                                });
                              },
                              activeColor: Colors.black,
                              checkColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 80),
                            child: CheckboxListTile(
                              title: Text("Smoke alarm present & working"),
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.leading,
                              value: isSmokePresent,
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    isSmokePresent = newValue;
                                    smokeController.text =
                                        isSmokePresent ? "Yes" : "No";
                                  } else {
                                    isSmokePresent = false;
                                    smokeController.text = "No";
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
                                String gasInstall = gasController.text;
                                String gasSupply = supplyController.text;
                                String gasTight = tightController.text;
                                String controlValve = controlController.text;
                                String protect = protectController.text;
                                String alarm = alarmController.text;
                                String smoke = smokeController.text;

                                if (isGasInstall == false) {
                                  gasInstall = "Fail";
                                }
                                if (isGasSupply == false) {
                                  gasSupply = "Fail";
                                }
                                if (isGasTight == false) {
                                  gasTight = "Fail";
                                }
                                if (isEmergencyControl == false) {
                                  controlValve = "No";
                                }
                                if (isProtect == false) {
                                  protect = "No";
                                }
                                if (isAlarmPresent == false) {
                                  alarm = "No";
                                }
                                if (isSmokePresent == false) {
                                  smoke = "No";
                                }

                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('gasInstall', gasInstall);
                                prefs.setString('gasSupply', gasSupply);
                                prefs.setString('gasTight', gasTight);
                                prefs.setString(
                                    'emergencyControl', controlValve);
                                prefs.setString('protective', protect);
                                prefs.setString('alarmPresent', alarm);
                                prefs.setString('smokePresent', smoke);

                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => CreateReport()));
                              },
                              style: ButtonStyle(
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(width: 1.0, color: Colors.black),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  Size(150.0,
                                      40.0), // Set the width and height of the button
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.green.shade200,
                                ),
                              ),
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ])))));
  }
}
