import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
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
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //add in texteditingcontrollers here
  var titleController = TextEditingController();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var postController = TextEditingController();
  var addressController = TextEditingController();
  String? userId = _auth.currentUser?.uid;
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
  String dropdownValue = "-";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('CREATE REPORT'),
          ),
      body: Scrollbar(
        child: ListView(
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'CREATE REPORT',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return AlertDialog(
                                title: Text('Customer Information'),
                                content: Container(
                                  width: double.maxFinite,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Title: '),
                                          DropdownButton<String>(
                                            value: dropdownValue,
                                            icon: const Icon(Icons.menu),
                                            items: <String>[
                                              '-',
                                              'Mr',
                                              'Mrs',
                                              'Miss',
                                              'Ms',
                                              'Dr'
                                            ].map((String value) {
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
                                        ],
                                      ),
                                      TextFormField(
                                        controller: fNameController,
                                        decoration: InputDecoration(
                                          labelText: 'First Name',
                                        ),
                                      ),
                                      TextFormField(
                                        controller: lNameController,
                                        decoration: InputDecoration(
                                          labelText: 'Last Name',
                                        ),
                                      ),
                                      TextFormField(
                                        controller: postController,
                                        decoration: InputDecoration(
                                          labelText: 'Postcode',
                                        ),
                                      ),
                                      TextFormField(
                                        controller: addressController,
                                        decoration: InputDecoration(
                                          labelText: 'Address',
                                        ),
                                      ),
                                      TextFormField(
                                        controller: cityController,
                                        decoration: InputDecoration(
                                          labelText: 'Town/City',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Save functionality goes here
                                      // You can access the entered values using the controllers
                                      print('Saved');
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Save'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Cancel functionality goes here
                                      print('Cancelled');
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Text("Customer Details"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(20, 70),
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: Text('Appliance (1)'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return StatefulBuilder(
                                                    builder: (BuildContext
                                                            context,
                                                        StateSetter setState) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Appliance Details (1)'),
                                                        content: Container(
                                                            width: double
                                                                .maxFinite,
                                                            child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                          'Location: '),
                                                                      DropdownButton<
                                                                          String>(
                                                                        value:
                                                                            locValue,
                                                                        icon: const Icon(
                                                                            Icons.expand_more_rounded),
                                                                        items:
                                                                            <String>[
                                                                          '-',
                                                                          'Kitchen',
                                                                          'Living Room',
                                                                          'Dining Room',
                                                                          'Bedroom',
                                                                          'Hallway',
                                                                          'Outbuilding',
                                                                          'Cupboard',
                                                                          'Loft'
                                                                        ].map((String
                                                                                locvalue) {
                                                                          return DropdownMenuItem<
                                                                              String>(
                                                                            value:
                                                                                locvalue,
                                                                            child:
                                                                                Text(
                                                                              locvalue,
                                                                              style: TextStyle(color: Colors.black),
                                                                            ),
                                                                          );
                                                                        }).toList(),
                                                                        onChanged:
                                                                            (String?
                                                                                newLocValue) {
                                                                          setState(
                                                                              () {
                                                                            locValue =
                                                                                newLocValue!;
                                                                            locOneController.text =
                                                                                newLocValue;
                                                                          });
                                                                        },
                                                                      )
                                                                    ],
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        TypeController,
                                                                    decoration: InputDecoration(
                                                                        labelText:
                                                                            "Type"),
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        ManafacturerController,
                                                                    decoration: InputDecoration(
                                                                        labelText:
                                                                            "Manafacturer"),
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        ModelController,
                                                                    decoration: InputDecoration(
                                                                        labelText:
                                                                            "Model"),
                                                                  ),
                                                                  CheckboxListTile(
                                                                    title: Text(
                                                                        "Owned by Landlord"),
                                                                    value:
                                                                        isOwnedOne,
                                                                    onChanged:
                                                                        (newValue) {
                                                                      setState(
                                                                          () {
                                                                        if (newValue !=
                                                                            null) {
                                                                          isOwnedOne =
                                                                              newValue;
                                                                          OwnedByController.text = isInspectOne
                                                                              ? "Yes"
                                                                              : "No";
                                                                        } else {
                                                                          isOwnedOne =
                                                                              false;
                                                                          OwnedByController.text =
                                                                              "No";
                                                                        }
                                                                      });
                                                                    },
                                                                    activeColor:
                                                                        Colors
                                                                            .greenAccent,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  CheckboxListTile(
                                                                    title: Text(
                                                                        "Appliance Inspected"),
                                                                    value:
                                                                        isInspectOne,
                                                                    onChanged:
                                                                        (newValue) {
                                                                      setState(
                                                                          () {
                                                                        if (newValue !=
                                                                            null) {
                                                                          isInspectOne =
                                                                              newValue;
                                                                          ApplianceInspectController.text = isInspectOne
                                                                              ? "Yes"
                                                                              : "No";
                                                                        } else {
                                                                          isInspectOne =
                                                                              false;
                                                                          ApplianceInspectController.text =
                                                                              "No";
                                                                        }
                                                                      });
                                                                    },
                                                                    activeColor:
                                                                        Colors
                                                                            .greenAccent,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                          'Flue Type: '),
                                                                      DropdownButton<
                                                                              String>(
                                                                          value:
                                                                              flueValue,
                                                                          icon: const Icon(Icons
                                                                              .expand_more_rounded),
                                                                          items: <String>[
                                                                            '-',
                                                                            'RS',
                                                                            'FL',
                                                                            'BF',
                                                                            'OF',
                                                                            'CF'
                                                                          ].map((String
                                                                              flueValue) {
                                                                            return DropdownMenuItem<String>(
                                                                                value: flueValue,
                                                                                child: Text(
                                                                                  flueValue,
                                                                                  style: TextStyle(color: Colors.black),
                                                                                ));
                                                                          }).toList(),
                                                                          onChanged:
                                                                              (String? newFlueValue) {
                                                                            setState(() {
                                                                              flueValue = newFlueValue!;
                                                                              FlueTypeController.text = newFlueValue;
                                                                            });
                                                                          })
                                                                    ],
                                                                  ),
                                                                ])),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () {
                                                              print('Saved');
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text('Save'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              print(
                                                                  'Cancelled');
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child:
                                                                Text('cancel'),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  );
                                                });
                                          },
                                          child: Text("Appliance Details"),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.grey,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            side:
                                                BorderSide(color: Colors.black),
                                            minimumSize: Size(20, 40),
                                          )),
                                      ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return StatefulBuilder(
                                                    builder: (BuildContext
                                                            context,
                                                        StateSetter setState) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Inspection Details (1)'),
                                                        content: Container(
                                                            width: double
                                                                .maxFinite,
                                                            child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  TextFormField(
                                                                    controller:
                                                                        operatePressureController,
                                                                    decoration: InputDecoration(
                                                                        labelText:
                                                                            "Operating Pressure (mbars)"),
                                                                  ),
                                                                  CheckboxListTile(
                                                                    title: Text(
                                                                        "Safety Devices Operating Correctly"),
                                                                    value:
                                                                        isSafe,
                                                                    onChanged:
                                                                        (newValue) {
                                                                      setState(
                                                                          () {
                                                                        if (newValue !=
                                                                            null) {
                                                                          isSafe =
                                                                              newValue;
                                                                          safetyController.text = isSafe
                                                                              ? "Yes"
                                                                              : "No";
                                                                        } else {
                                                                          isSafe =
                                                                              false;
                                                                          safetyController.text =
                                                                              "No";
                                                                        }
                                                                      });
                                                                    },
                                                                    activeColor:
                                                                        Colors
                                                                            .greenAccent,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  CheckboxListTile(
                                                                    title: Text(
                                                                        "Satisfactory Ventilation"),
                                                                    value:
                                                                        isSatis,
                                                                    onChanged:
                                                                        (newValue) {
                                                                      setState(
                                                                          () {
                                                                        if (newValue !=
                                                                            null) {
                                                                          isSatis =
                                                                              newValue;
                                                                          satisController.text = isSatis
                                                                              ? "Yes"
                                                                              : "No";
                                                                        } else {
                                                                          isSatis =
                                                                              false;
                                                                          satisController.text =
                                                                              "No";
                                                                        }
                                                                      });
                                                                    },
                                                                    activeColor:
                                                                        Colors
                                                                            .greenAccent,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  CheckboxListTile(
                                                                    title: Text(
                                                                        "Visual Condition of Flue"),
                                                                    value:
                                                                        isVisual,
                                                                    onChanged:
                                                                        (newValue) {
                                                                      setState(
                                                                          () {
                                                                        if (newValue !=
                                                                            null) {
                                                                          isVisual =
                                                                              newValue;
                                                                          visualController.text = isVisual
                                                                              ? "Yes"
                                                                              : "No";
                                                                        } else {
                                                                          isVisual =
                                                                              false;
                                                                          visualController.text =
                                                                              "No";
                                                                        }
                                                                      });
                                                                    },
                                                                    activeColor:
                                                                        Colors
                                                                            .greenAccent,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  CheckboxListTile(
                                                                    title: Text(
                                                                        "Termination Satisfactory"),
                                                                    value:
                                                                        isTerminate,
                                                                    onChanged:
                                                                        (newValue) {
                                                                      setState(
                                                                          () {
                                                                        if (newValue !=
                                                                            null) {
                                                                          isTerminate =
                                                                              newValue;
                                                                          terminationController.text = isTerminate
                                                                              ? "Yes"
                                                                              : "No";
                                                                        } else {
                                                                          isTerminate =
                                                                              false;
                                                                          terminationController.text =
                                                                              "No";
                                                                        }
                                                                      });
                                                                    },
                                                                    activeColor:
                                                                        Colors
                                                                            .greenAccent,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  CheckboxListTile(
                                                                    title: Text(
                                                                        "Flue Performance Checks"),
                                                                    value:
                                                                        isFluePerform,
                                                                    onChanged:
                                                                        (newValue) {
                                                                      setState(
                                                                          () {
                                                                        if (newValue !=
                                                                            null) {
                                                                          isFluePerform =
                                                                              newValue;
                                                                          fluePerformController.text = isFluePerform
                                                                              ? "Pass"
                                                                              : "Fail";
                                                                        } else {
                                                                          isFluePerform =
                                                                              false;
                                                                          fluePerformController.text =
                                                                              "Fail";
                                                                        }
                                                                      });
                                                                    },
                                                                    activeColor:
                                                                        Colors
                                                                            .greenAccent,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  CheckboxListTile(
                                                                    title: Text(
                                                                        "Was Appliance Serviced"),
                                                                    value:
                                                                        isApplianceService,
                                                                    onChanged:
                                                                        (newValue) {
                                                                      setState(
                                                                          () {
                                                                        if (newValue !=
                                                                            null) {
                                                                          isApplianceService =
                                                                              newValue;
                                                                          applianceServiceController.text = isApplianceService
                                                                              ? "Yes"
                                                                              : "No";
                                                                        } else {
                                                                          isApplianceService =
                                                                              false;
                                                                          applianceServiceController.text =
                                                                              "No";
                                                                        }
                                                                      });
                                                                    },
                                                                    activeColor:
                                                                        Colors
                                                                            .greenAccent,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  CheckboxListTile(
                                                                    title: Text(
                                                                        "Is Appliance Safe to Use"),
                                                                    value:
                                                                        isApplianceSafe,
                                                                    onChanged:
                                                                        (newValue) {
                                                                      setState(
                                                                          () {
                                                                        if (newValue !=
                                                                            null) {
                                                                          isApplianceSafe =
                                                                              newValue;
                                                                          applianceSafeController.text = isApplianceSafe
                                                                              ? "Yes"
                                                                              : "No";
                                                                        } else {
                                                                          isApplianceSafe =
                                                                              false;
                                                                          applianceSafeController.text =
                                                                              "No";
                                                                        }
                                                                      });
                                                                    },
                                                                    activeColor:
                                                                        Colors
                                                                            .greenAccent,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                ])),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () {
                                                              print('Saved');
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text('Save'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              print(
                                                                  'Cancelled');
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child:
                                                                Text('cancel'),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  );
                                                });
                                          },
                                          child: Text("Inspection Details"),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.grey,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            side:
                                                BorderSide(color: Colors.black),
                                            minimumSize: Size(20, 40),
                                          )),
                                      ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(20.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Reading 1/Min',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          SizedBox(height: 10),
                                                          _buildTextFormField(
                                                              'Carbon Monoxide (CO)',
                                                              coController1),
                                                          _buildTextFormField(
                                                              'Carbon Dioxide (CO2)',
                                                              co2Controller1),
                                                          _buildTextFormField(
                                                              'Ratio (CO/CO2)',
                                                              ratioController1),
                                                          SizedBox(height: 20),
                                                          Text(
                                                            'Reading 2/Max',
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          SizedBox(height: 10),
                                                          _buildTextFormField(
                                                              'Carbon Monoxide (CO)',
                                                              coController2),
                                                          _buildTextFormField(
                                                              'Carbon Dioxide (CO2)',
                                                              co2Controller2),
                                                          _buildTextFormField(
                                                              'Ratio (CO/CO2)',
                                                              ratioController2),
                                                          SizedBox(height: 20),
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child:
                                                                Text('Close'),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Text(
                                              "Combustion Analysis Reading"),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.grey,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            side:
                                                BorderSide(color: Colors.black),
                                            minimumSize: Size(20, 40),
                                          )),
                                      ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return StatefulBuilder(
                                                  builder: (BuildContext
                                                          context,
                                                      StateSetter setState) {
                                                    return AlertDialog(
                                                      title: Text('Actions'),
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          TextFormField(
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Defects Identified',
                                                              labelText:
                                                                  'Defects Identified',
                                                            ),
                                                            controller:
                                                                defectsController,
                                                          ),
                                                          TextFormField(
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Remedial Action Taken',
                                                              labelText:
                                                                  'Remedial Action Taken',
                                                            ),
                                                            controller:
                                                                remedialController,
                                                          ),
                                                          CheckboxListTile(
                                                            title: Text(
                                                                "Has Warning Advice Notice Been Issued"),
                                                            value: isWarning,
                                                            onChanged:
                                                                (newValue) {
                                                              setState(() {
                                                                if (newValue !=
                                                                    null) {
                                                                  isWarning =
                                                                      newValue;
                                                                  warningController
                                                                          .text =
                                                                      isWarning
                                                                          ? "Yes"
                                                                          : "No";
                                                                } else {
                                                                  isWarning =
                                                                      false;
                                                                  warningController
                                                                          .text =
                                                                      "No";
                                                                }
                                                              });
                                                            },
                                                            activeColor: Colors
                                                                .greenAccent,
                                                            checkColor:
                                                                Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            // Perform save action here
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('Save'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('Cancel'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                          child: Text("Actions"),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.grey,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            side:
                                                BorderSide(color: Colors.black),
                                            minimumSize: Size(20, 40),
                                          )),
                                    ],
                                  ));
                            });
                      },
                      child: Text(
                        "Appliance 1",
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        side: BorderSide(color: Colors.black),
                        minimumSize: Size(20, 70),
                      )),
                ),

                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text('Appliance (2)'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return StatefulBuilder(
                                                  builder: (BuildContext
                                                          context,
                                                      StateSetter setState) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Appliance Details (2)'),
                                                      content: Container(
                                                          width:
                                                              double.maxFinite,
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        'Location: '),
                                                                    DropdownButton<
                                                                        String>(
                                                                      value:
                                                                          locValue_2,
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .expand_more_rounded),
                                                                      items:
                                                                          <String>[
                                                                        '-',
                                                                        'Kitchen',
                                                                        'Living Room',
                                                                        'Dining Room',
                                                                        'Bedroom',
                                                                        'Hallway',
                                                                        'Outbuilding',
                                                                        'Cupboard',
                                                                        'Loft'
                                                                      ].map((String
                                                                              locvalue_2) {
                                                                        return DropdownMenuItem<
                                                                            String>(
                                                                          value:
                                                                              locvalue_2,
                                                                          child:
                                                                              Text(
                                                                            locvalue_2,
                                                                            style:
                                                                                TextStyle(color: Colors.black),
                                                                          ),
                                                                        );
                                                                      }).toList(),
                                                                      onChanged:
                                                                          (String?
                                                                              newLocValue_2) {
                                                                        setState(
                                                                            () {
                                                                          locValue_2 =
                                                                              newLocValue_2!;
                                                                          locOneController_2.text =
                                                                              newLocValue_2;
                                                                        });
                                                                      },
                                                                    )
                                                                  ],
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      TypeController_2,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "Type"),
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      ManafacturerController_2,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "Manafacturer"),
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      ModelController_2,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "Model"),
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Owned by Landlord"),
                                                                  value:
                                                                      isOwnedOne_2,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isOwnedOne_2 =
                                                                            newValue;
                                                                        OwnedByController_2.text = isInspectOne_2
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isOwnedOne_2 =
                                                                            false;
                                                                        OwnedByController_2.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Appliance Inspected"),
                                                                  value:
                                                                      isInspectOne_2,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isInspectOne_2 =
                                                                            newValue;
                                                                        ApplianceInspectController_2.text = isInspectOne_2
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isInspectOne_2 =
                                                                            false;
                                                                        ApplianceInspectController_2.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        'Flue Type: '),
                                                                    DropdownButton<
                                                                            String>(
                                                                        value:
                                                                            flueValue_2,
                                                                        icon: const Icon(Icons
                                                                            .expand_more_rounded),
                                                                        items: <String>[
                                                                          '-',
                                                                          'RS',
                                                                          'FL',
                                                                          'BF',
                                                                          'OF',
                                                                          'CF'
                                                                        ].map((String
                                                                            flueValue_2) {
                                                                          return DropdownMenuItem<String>(
                                                                              value: flueValue_2,
                                                                              child: Text(
                                                                                flueValue_2,
                                                                                style: TextStyle(color: Colors.black),
                                                                              ));
                                                                        }).toList(),
                                                                        onChanged:
                                                                            (String?
                                                                                newFlueValue_2) {
                                                                          setState(
                                                                              () {
                                                                            flueValue_2 =
                                                                                newFlueValue_2!;
                                                                            FlueTypeController_2.text =
                                                                                newFlueValue_2;
                                                                          });
                                                                        })
                                                                  ],
                                                                ),
                                                              ])),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            print('Saved');
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('Save'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            print('Cancelled');
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('cancel'),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              });
                                        },
                                        child: Text("Appliance Details"),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          side: BorderSide(color: Colors.black),
                                          minimumSize: Size(20, 40),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return StatefulBuilder(
                                                  builder: (BuildContext
                                                          context,
                                                      StateSetter setState) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Inspection Details (2)'),
                                                      content: Container(
                                                          width:
                                                              double.maxFinite,
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                TextFormField(
                                                                  controller:
                                                                      operatePressureController_2,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "Operating Pressure (mbars)"),
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Safety Devices Operating Correctly"),
                                                                  value: isSafe,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isSafe_2 =
                                                                            newValue;
                                                                        safetyController_2.text = isSafe_2
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isSafe_2 =
                                                                            false;
                                                                        safetyController_2.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Satisfactory Ventilation"),
                                                                  value:
                                                                      isSatis_2,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isSatis_2 =
                                                                            newValue;
                                                                        satisController_2.text = isSatis_2
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isSatis_2 =
                                                                            false;
                                                                        satisController_2.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Visual Condition of Flue"),
                                                                  value:
                                                                      isVisual_2,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isVisual_2 =
                                                                            newValue;
                                                                        visualController_2.text = isVisual_2
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isVisual_2 =
                                                                            false;
                                                                        visualController_2.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Termination Satisfactory"),
                                                                  value:
                                                                      isTerminate_2,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isTerminate_2 =
                                                                            newValue;
                                                                        terminationController_2.text = isTerminate_2
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isTerminate_2 =
                                                                            false;
                                                                        terminationController_2.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Flue Performance Checks"),
                                                                  value:
                                                                      isFluePerform_2,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isFluePerform_2 =
                                                                            newValue;
                                                                        fluePerformController_2.text = isFluePerform_2
                                                                            ? "Pass"
                                                                            : "Fail";
                                                                      } else {
                                                                        isFluePerform_2 =
                                                                            false;
                                                                        fluePerformController_2.text =
                                                                            "Fail";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Was Appliance Serviced"),
                                                                  value:
                                                                      isApplianceService_2,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isApplianceService_2 =
                                                                            newValue;
                                                                        applianceServiceController_2.text = isApplianceService_2
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isApplianceService_2 =
                                                                            false;
                                                                        applianceServiceController_2.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Is Appliance Safe to Use"),
                                                                  value:
                                                                      isApplianceSafe_2,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isApplianceSafe_2 =
                                                                            newValue;
                                                                        applianceSafeController_2.text = isApplianceSafe_2
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isApplianceSafe_2 =
                                                                            false;
                                                                        applianceSafeController_2.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                              ])),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            print('Saved');
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('Save'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            print('Cancelled');
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('cancel'),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              });
                                        },
                                        child: Text("Inspection Details"),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          side: BorderSide(color: Colors.black),
                                          minimumSize: Size(20, 40),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Reading 1/Min',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        _buildTextFormField(
                                                            'Carbon Monoxide (CO)',
                                                            coController1_2),
                                                        _buildTextFormField(
                                                            'Carbon Dioxide (CO2)',
                                                            co2Controller1_2),
                                                        _buildTextFormField(
                                                            'Ratio (CO/CO2)',
                                                            ratioController1_2),
                                                        SizedBox(height: 20),
                                                        Text(
                                                          'Reading 2/Max',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        _buildTextFormField(
                                                            'Carbon Monoxide (CO)',
                                                            coController2_2),
                                                        _buildTextFormField(
                                                            'Carbon Dioxide (CO2)',
                                                            co2Controller2_2),
                                                        _buildTextFormField(
                                                            'Ratio (CO/CO2)',
                                                            ratioController2_2),
                                                        SizedBox(height: 20),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('Close'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child:
                                            Text("Combustion Analysis Reading"),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          side: BorderSide(color: Colors.black),
                                          minimumSize: Size(20, 40),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(
                                                builder: (BuildContext context,
                                                    StateSetter setState) {
                                                  return AlertDialog(
                                                    title: Text('Actions'),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Defects Identified',
                                                            labelText:
                                                                'Defects Identified',
                                                          ),
                                                          controller:
                                                              defectsController_2,
                                                        ),
                                                        TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Remedial Action Taken',
                                                            labelText:
                                                                'Remedial Action Taken',
                                                          ),
                                                          controller:
                                                              remedialController_2,
                                                        ),
                                                        CheckboxListTile(
                                                          title: Text(
                                                              "Has Warning Advice Notice Been Issued"),
                                                          value: isWarning_2,
                                                          onChanged:
                                                              (newValue) {
                                                            setState(() {
                                                              if (newValue !=
                                                                  null) {
                                                                isWarning_2 =
                                                                    newValue;
                                                                warningController_2
                                                                        .text =
                                                                    isWarning_2
                                                                        ? "Yes"
                                                                        : "No";
                                                              } else {
                                                                isWarning_2 =
                                                                    false;
                                                                warningController_2
                                                                        .text =
                                                                    "No";
                                                              }
                                                            });
                                                          },
                                                          activeColor: Colors
                                                              .greenAccent,
                                                          checkColor:
                                                              Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          // Perform save action here
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Save'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Cancel'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                        child: Text("Actions"),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          side: BorderSide(color: Colors.black),
                                          minimumSize: Size(20, 40),
                                        )),
                                  ],
                                ));
                          });
                    },
                    child: Text("Appliance 2"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(20, 70),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text('Appliance (3)'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return StatefulBuilder(
                                                  builder: (BuildContext
                                                          context,
                                                      StateSetter setState) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Appliance Details (3)'),
                                                      content: Container(
                                                          width:
                                                              double.maxFinite,
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        'Location: '),
                                                                    DropdownButton<
                                                                        String>(
                                                                      value:
                                                                          locValue_3,
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .expand_more_rounded),
                                                                      items:
                                                                          <String>[
                                                                        '-',
                                                                        'Kitchen',
                                                                        'Living Room',
                                                                        'Dining Room',
                                                                        'Bedroom',
                                                                        'Hallway',
                                                                        'Outbuilding',
                                                                        'Cupboard',
                                                                        'Loft'
                                                                      ].map((String
                                                                              locvalue_3) {
                                                                        return DropdownMenuItem<
                                                                            String>(
                                                                          value:
                                                                              locvalue_3,
                                                                          child:
                                                                              Text(
                                                                            locvalue_3,
                                                                            style:
                                                                                TextStyle(color: Colors.black),
                                                                          ),
                                                                        );
                                                                      }).toList(),
                                                                      onChanged:
                                                                          (String?
                                                                              newLocValue_3) {
                                                                        setState(
                                                                            () {
                                                                          locValue_3 =
                                                                              newLocValue_3!;
                                                                          locOneController_3.text =
                                                                              newLocValue_3;
                                                                        });
                                                                      },
                                                                    )
                                                                  ],
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      TypeController_3,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "Type"),
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      ManafacturerController_3,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "Manafacturer"),
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      ModelController_3,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "Model"),
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Owned by Landlord"),
                                                                  value:
                                                                      isOwnedOne_3,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isOwnedOne_3 =
                                                                            newValue;
                                                                        OwnedByController_3.text = isInspectOne_3
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isOwnedOne_3 =
                                                                            false;
                                                                        OwnedByController_3.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Appliance Inspected"),
                                                                  value:
                                                                      isInspectOne_3,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isInspectOne =
                                                                            newValue;
                                                                        ApplianceInspectController_3.text = isInspectOne_3
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isInspectOne_3 =
                                                                            false;
                                                                        ApplianceInspectController_3.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        'Flue Type: '),
                                                                    DropdownButton<
                                                                            String>(
                                                                        value:
                                                                            flueValue_3,
                                                                        icon: const Icon(Icons
                                                                            .expand_more_rounded),
                                                                        items: <String>[
                                                                          '-',
                                                                          'RS',
                                                                          'FL',
                                                                          'BF',
                                                                          'OF',
                                                                          'CF'
                                                                        ].map((String
                                                                            flueValue_3) {
                                                                          return DropdownMenuItem<String>(
                                                                              value: flueValue_3,
                                                                              child: Text(
                                                                                flueValue_3,
                                                                                style: TextStyle(color: Colors.black),
                                                                              ));
                                                                        }).toList(),
                                                                        onChanged:
                                                                            (String?
                                                                                newFlueValue_3) {
                                                                          setState(
                                                                              () {
                                                                            flueValue_3 =
                                                                                newFlueValue_3!;
                                                                            FlueTypeController_3.text =
                                                                                newFlueValue_3;
                                                                          });
                                                                        })
                                                                  ],
                                                                ),
                                                              ])),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            print('Saved');
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('Save'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            print('Cancelled');
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('cancel'),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              });
                                        },
                                        child: Text("Appliance Details"),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          side: BorderSide(color: Colors.black),
                                          minimumSize: Size(20, 40),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return StatefulBuilder(
                                                  builder: (BuildContext
                                                          context,
                                                      StateSetter setState) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Inspection Details (3)'),
                                                      content: Container(
                                                          width:
                                                              double.maxFinite,
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                TextFormField(
                                                                  controller:
                                                                      operatePressureController_3,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "Operating Pressure (mbars)"),
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Safety Devices Operating Correctly"),
                                                                  value:
                                                                      isSafe_3,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isSafe_3 =
                                                                            newValue;
                                                                        safetyController_3.text = isSafe_3
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isSafe_3 =
                                                                            false;
                                                                        safetyController_3.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Satisfactory Ventilation"),
                                                                  value:
                                                                      isSatis_3,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isSatis_3 =
                                                                            newValue;
                                                                        satisController_3.text = isSatis_3
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isSatis_3 =
                                                                            false;
                                                                        satisController_3.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Visual Condition of Flue"),
                                                                  value:
                                                                      isVisual_3,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isVisual_3 =
                                                                            newValue;
                                                                        visualController_3.text = isVisual_3
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isVisual_3 =
                                                                            false;
                                                                        visualController_3.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Termination Satisfactory"),
                                                                  value:
                                                                      isTerminate_3,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isTerminate_3 =
                                                                            newValue;
                                                                        terminationController_3.text = isTerminate_3
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isTerminate_3 =
                                                                            false;
                                                                        terminationController_3.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Flue Performance Checks"),
                                                                  value:
                                                                      isFluePerform_3,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isFluePerform_3 =
                                                                            newValue;
                                                                        fluePerformController_3.text = isFluePerform_3
                                                                            ? "Pass"
                                                                            : "Fail";
                                                                      } else {
                                                                        isFluePerform_3 =
                                                                            false;
                                                                        fluePerformController_3.text =
                                                                            "Fail";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Was Appliance Serviced"),
                                                                  value:
                                                                      isApplianceService_3,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isApplianceService_3 =
                                                                            newValue;
                                                                        applianceServiceController_3.text = isApplianceService_3
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isApplianceService_3 =
                                                                            false;
                                                                        applianceServiceController_3.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Is Appliance Safe to Use"),
                                                                  value:
                                                                      isApplianceSafe_3,
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue !=
                                                                          null) {
                                                                        isApplianceSafe_3 =
                                                                            newValue;
                                                                        applianceSafeController_3.text = isApplianceSafe_3
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isApplianceSafe_3 =
                                                                            false;
                                                                        applianceSafeController_3.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                              ])),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            print('Saved');
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('Save'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            print('Cancelled');
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('cancel'),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              });
                                        },
                                        child: Text("Inspection Details"),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          side: BorderSide(color: Colors.black),
                                          minimumSize: Size(20, 40),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Reading 1/Min',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        _buildTextFormField(
                                                            'Carbon Monoxide (CO)',
                                                            coController1_3),
                                                        _buildTextFormField(
                                                            'Carbon Dioxide (CO2)',
                                                            co2Controller1_3),
                                                        _buildTextFormField(
                                                            'Ratio (CO/CO2)',
                                                            ratioController1_3),
                                                        SizedBox(height: 20),
                                                        Text(
                                                          'Reading 2/Max',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        _buildTextFormField(
                                                            'Carbon Monoxide (CO)',
                                                            coController2_3),
                                                        _buildTextFormField(
                                                            'Carbon Dioxide (CO2)',
                                                            co2Controller2_3),
                                                        _buildTextFormField(
                                                            'Ratio (CO/CO2)',
                                                            ratioController2_3),
                                                        SizedBox(height: 20),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('Close'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child:
                                            Text("Combustion Analysis Reading"),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          side: BorderSide(color: Colors.black),
                                          minimumSize: Size(20, 40),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(
                                                builder: (BuildContext context,
                                                    StateSetter setState) {
                                                  return AlertDialog(
                                                    title: Text('Actions'),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Defects Identified',
                                                            labelText:
                                                                'Defects Identified',
                                                          ),
                                                          controller:
                                                              defectsController_3,
                                                        ),
                                                        TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Remedial Action Taken',
                                                            labelText:
                                                                'Remedial Action Taken',
                                                          ),
                                                          controller:
                                                              remedialController_3,
                                                        ),
                                                        CheckboxListTile(
                                                          title: Text(
                                                              "Has Warning Advice Notice Been Issued"),
                                                          value: isWarning_3,
                                                          onChanged:
                                                              (newValue) {
                                                            setState(() {
                                                              if (newValue !=
                                                                  null) {
                                                                isWarning_3 =
                                                                    newValue;
                                                                warningController_3
                                                                        .text =
                                                                    isWarning_3
                                                                        ? "Yes"
                                                                        : "No";
                                                              } else {
                                                                isWarning_3 =
                                                                    false;
                                                                warningController_3
                                                                        .text =
                                                                    "No";
                                                              }
                                                            });
                                                          },
                                                          activeColor: Colors
                                                              .greenAccent,
                                                          checkColor:
                                                              Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          // Perform save action here
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Save'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Cancel'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                        child: Text("Actions"),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          side: BorderSide(color: Colors.black),
                                          minimumSize: Size(20, 40),
                                        )),
                                  ],
                                ));
                          });
                    },
                    child: Text("Appliance 3"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(20, 70),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text('Appliance (4)'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return StatefulBuilder(
                                                  builder: (BuildContext
                                                          context,
                                                      StateSetter setState) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Appliance Details (4)'),
                                                      content: Container(
                                                          width:
                                                              double.maxFinite,
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        'Location: '),
                                                                    DropdownButton<
                                                                        String>(
                                                                      value:
                                                                          locValue_4,
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .expand_more_rounded),
                                                                      items:
                                                                          <String>[
                                                                        '-',
                                                                        'Kitchen',
                                                                        'Living Room',
                                                                        'Dining Room',
                                                                        'Bedroom',
                                                                        'Hallway',
                                                                        'Outbuilding',
                                                                        'Cupboard',
                                                                        'Loft'
                                                                      ].map((String
                                                                              locvalue_4) {
                                                                        return DropdownMenuItem<
                                                                            String>(
                                                                          value:
                                                                              locvalue_4,
                                                                          child:
                                                                              Text(
                                                                            locvalue_4,
                                                                            style:
                                                                                TextStyle(color: Colors.black),
                                                                          ),
                                                                        );
                                                                      }).toList(),
                                                                      onChanged:
                                                                          (String?
                                                                              newLocValue_4) {
                                                                        setState(
                                                                            () {
                                                                          locValue_4 =
                                                                              newLocValue_4!;
                                                                          locOneController_4.text =
                                                                              newLocValue_4;
                                                                        });
                                                                      },
                                                                    )
                                                                  ],
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      TypeController_4,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "Type"),
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      ManafacturerController_4,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "Manafacturer"),
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      ModelController_4,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "Model"),
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Owned by Landlord"),
                                                                  value:
                                                                      isOwnedOne_4,
                                                                  onChanged:
                                                                      (newValue_4) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue_4 !=
                                                                          null) {
                                                                        isOwnedOne_4 =
                                                                            newValue_4;
                                                                        OwnedByController_4.text = isInspectOne_4
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isOwnedOne_4 =
                                                                            false;
                                                                        OwnedByController_4.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Appliance Inspected"),
                                                                  value:
                                                                      isInspectOne_4,
                                                                  onChanged:
                                                                      (newValue_4) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue_4 !=
                                                                          null) {
                                                                        isInspectOne_4 =
                                                                            newValue_4;
                                                                        ApplianceInspectController_4.text = isInspectOne_4
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isInspectOne_4 =
                                                                            false;
                                                                        ApplianceInspectController_4.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        'Flue Type: '),
                                                                    DropdownButton<
                                                                            String>(
                                                                        value:
                                                                            flueValue_4,
                                                                        icon: const Icon(Icons
                                                                            .expand_more_rounded),
                                                                        items: <String>[
                                                                          '-',
                                                                          'RS',
                                                                          'FL',
                                                                          'BF',
                                                                          'OF',
                                                                          'CF'
                                                                        ].map((String
                                                                            flueValue_4) {
                                                                          return DropdownMenuItem<String>(
                                                                              value: flueValue_4,
                                                                              child: Text(
                                                                                flueValue_4,
                                                                                style: TextStyle(color: Colors.black),
                                                                              ));
                                                                        }).toList(),
                                                                        onChanged:
                                                                            (String?
                                                                                newFlueValue_4) {
                                                                          setState(
                                                                              () {
                                                                            flueValue_4 =
                                                                                newFlueValue_4!;
                                                                            FlueTypeController_4.text =
                                                                                newFlueValue_4;
                                                                          });
                                                                        })
                                                                  ],
                                                                ),
                                                              ])),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            print('Saved');
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('Save'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            print('Cancelled');
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('cancel'),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              });
                                        },
                                        child: Text("Appliance Details"),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          side: BorderSide(color: Colors.black),
                                          minimumSize: Size(20, 40),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return StatefulBuilder(
                                                  builder: (BuildContext
                                                          context,
                                                      StateSetter setState) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Inspection Details (1)'),
                                                      content: Container(
                                                          width:
                                                              double.maxFinite,
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                TextFormField(
                                                                  controller:
                                                                      operatePressureController_4,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "Operating Pressure (mbars)"),
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Safety Devices Operating Correctly"),
                                                                  value:
                                                                      isSafe_4,
                                                                  onChanged:
                                                                      (newValue_4) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue_4 !=
                                                                          null) {
                                                                        isSafe_4 =
                                                                            newValue_4;
                                                                        safetyController_4.text = isSafe_4
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isSafe_4 =
                                                                            false;
                                                                        safetyController_4.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Satisfactory Ventilation"),
                                                                  value:
                                                                      isSatis_4,
                                                                  onChanged:
                                                                      (newValue_4) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue_4 !=
                                                                          null) {
                                                                        isSatis_4 =
                                                                            newValue_4;
                                                                        satisController_4.text = isSatis_4
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isSatis_4 =
                                                                            false;
                                                                        satisController_4.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Visual Condition of Flue"),
                                                                  value:
                                                                      isVisual_4,
                                                                  onChanged:
                                                                      (newValue_4) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue_4 !=
                                                                          null) {
                                                                        isVisual_4 =
                                                                            newValue_4;
                                                                        visualController_4.text = isVisual_4
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isVisual_4 =
                                                                            false;
                                                                        visualController_4.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Termination Satisfactory"),
                                                                  value:
                                                                      isTerminate_4,
                                                                  onChanged:
                                                                      (newValue_4) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue_4 !=
                                                                          null) {
                                                                        isTerminate_4 =
                                                                            newValue_4;
                                                                        terminationController_4.text = isTerminate_4
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isTerminate_4 =
                                                                            false;
                                                                        terminationController_4.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Flue Performance Checks"),
                                                                  value:
                                                                      isFluePerform_4,
                                                                  onChanged:
                                                                      (newValue_4) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue_4 !=
                                                                          null) {
                                                                        isFluePerform_4 =
                                                                            newValue_4;
                                                                        fluePerformController_4.text = isFluePerform_4
                                                                            ? "Pass"
                                                                            : "Fail";
                                                                      } else {
                                                                        isFluePerform_4 =
                                                                            false;
                                                                        fluePerformController_4.text =
                                                                            "Fail";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Was Appliance Serviced"),
                                                                  value:
                                                                      isApplianceService_4,
                                                                  onChanged:
                                                                      (newValue_4) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue_4 !=
                                                                          null) {
                                                                        isApplianceService_4 =
                                                                            newValue_4;
                                                                        applianceServiceController_4.text = isApplianceService_4
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isApplianceService_4 =
                                                                            false;
                                                                        applianceServiceController_4.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                CheckboxListTile(
                                                                  title: Text(
                                                                      "Is Appliance Safe to Use"),
                                                                  value:
                                                                      isApplianceSafe_4,
                                                                  onChanged:
                                                                      (newValue_4) {
                                                                    setState(
                                                                        () {
                                                                      if (newValue_4 !=
                                                                          null) {
                                                                        isApplianceSafe_4 =
                                                                            newValue_4;
                                                                        applianceSafeController_4.text = isApplianceSafe_4
                                                                            ? "Yes"
                                                                            : "No";
                                                                      } else {
                                                                        isApplianceSafe_4 =
                                                                            false;
                                                                        applianceSafeController_4.text =
                                                                            "No";
                                                                      }
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      Colors
                                                                          .greenAccent,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                              ])),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            print('Saved');
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('Save'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            print('Cancelled');
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('cancel'),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              });
                                        },
                                        child: Text("Inspection Details"),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          side: BorderSide(color: Colors.black),
                                          minimumSize: Size(20, 40),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Reading 1/Min',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        _buildTextFormField(
                                                            'Carbon Monoxide (CO)',
                                                            coController1_4),
                                                        _buildTextFormField(
                                                            'Carbon Dioxide (CO2)',
                                                            co2Controller1_4),
                                                        _buildTextFormField(
                                                            'Ratio (CO/CO2)',
                                                            ratioController1_4),
                                                        SizedBox(height: 20),
                                                        Text(
                                                          'Reading 2/Max',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        _buildTextFormField(
                                                            'Carbon Monoxide (CO)',
                                                            coController2_4),
                                                        _buildTextFormField(
                                                            'Carbon Dioxide (CO2)',
                                                            co2Controller2_4),
                                                        _buildTextFormField(
                                                            'Ratio (CO/CO2)',
                                                            ratioController2_4),
                                                        SizedBox(height: 20),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('Close'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child:
                                            Text("Combustion Analysis Reading"),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          side: BorderSide(color: Colors.black),
                                          minimumSize: Size(20, 40),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(
                                                builder: (BuildContext context,
                                                    StateSetter setState) {
                                                  return AlertDialog(
                                                    title: Text('Actions'),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Defects Identified',
                                                            labelText:
                                                                'Defects Identified',
                                                          ),
                                                          controller:
                                                              defectsController_4,
                                                        ),
                                                        TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Remedial Action Taken',
                                                            labelText:
                                                                'Remedial Action Taken',
                                                          ),
                                                          controller:
                                                              remedialController_4,
                                                        ),
                                                        CheckboxListTile(
                                                          title: Text(
                                                              "Has Warning Advice Notice Been Issued"),
                                                          value: isWarning_4,
                                                          onChanged:
                                                              (newValue_4) {
                                                            setState(() {
                                                              if (newValue_4 !=
                                                                  null) {
                                                                isWarning_4 =
                                                                    newValue_4;
                                                                warningController_4
                                                                        .text =
                                                                    isWarning_4
                                                                        ? "Yes"
                                                                        : "No";
                                                              } else {
                                                                isWarning_4 =
                                                                    false;
                                                                warningController_4
                                                                        .text =
                                                                    "No";
                                                              }
                                                            });
                                                          },
                                                          activeColor: Colors
                                                              .greenAccent,
                                                          checkColor:
                                                              Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          // Perform save action here
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Save'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Cancel'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                        child: Text("Actions"),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          side: BorderSide(color: Colors.black),
                                          minimumSize: Size(20, 40),
                                        )),
                                  ],
                                ));
                          });
                    },
                    child: Text("Appliance 4"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(20, 70),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return AlertDialog(
                                title: Text('Final Checks'),
                                content: Container(
                                  width: double.maxFinite,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CheckboxListTile(
                                        title: Text(
                                            "Outcome of gas installation pipework visual inspection:"),
                                        value: isOutcomeGasInstall,
                                        onChanged: (newValue) {
                                          setState(() {
                                            if (newValue != null) {
                                              isOutcomeGasInstall = newValue;
                                              outcomeGasInstallController.text =
                                                  isOutcomeGasInstall
                                                      ? "Pass"
                                                      : "Fail";
                                            } else {
                                              isOutcomeGasInstall = false;
                                              outcomeGasInstallController.text =
                                                  "Fail";
                                            }
                                          });
                                        },
                                        activeColor: Colors.greenAccent,
                                        checkColor: Colors.white,
                                      ),
                                      CheckboxListTile(
                                        title: Text(
                                            "Outcome of gas supply pipework visual inspection:"),
                                        value: isOutcomeGasSupply,
                                        onChanged: (newValue) {
                                          setState(() {
                                            if (newValue != null) {
                                              isOutcomeGasSupply = newValue;
                                              outcomeGasSafeController.text =
                                                  isOutcomeGasSupply
                                                      ? "Pass"
                                                      : "Fail";
                                            } else {
                                              isOutcomeGasSupply = false;
                                              outcomeGasSafeController.text =
                                                  "Fail";
                                            }
                                          });
                                        },
                                        activeColor: Colors.greenAccent,
                                        checkColor: Colors.white,
                                      ),
                                      CheckboxListTile(
                                        title: Text(
                                            "Outcome of gas tightness test:"),
                                        value: isOutcomeGasTight,
                                        onChanged: (newValue) {
                                          setState(() {
                                            if (newValue != null) {
                                              isOutcomeGasTight = newValue;
                                              outcomeGasTightController.text =
                                                  isOutcomeGasTight
                                                      ? "Pass"
                                                      : "Fail";
                                            } else {
                                              isOutcomeGasTight = false;
                                              outcomeGasTightController.text =
                                                  "Fail";
                                            }
                                          });
                                        },
                                        activeColor: Colors.greenAccent,
                                        checkColor: Colors.white,
                                      ),
                                      CheckboxListTile(
                                        title: Text(
                                            "Is the Emergency Control Valve access satisfactory"),
                                        value: isEmergencyAccess,
                                        onChanged: (newValue) {
                                          setState(() {
                                            if (newValue != null) {
                                              isEmergencyAccess = newValue;
                                              emergencyControlController.text =
                                                  isEmergencyAccess
                                                      ? "Pass"
                                                      : "Fail";
                                            } else {
                                              isEmergencyAccess = false;
                                              emergencyControlController.text =
                                                  "Fail";
                                            }
                                          });
                                        },
                                        activeColor: Colors.greenAccent,
                                        checkColor: Colors.white,
                                      ),
                                      CheckboxListTile(
                                        title: Text(
                                            "Is the protective equipotential bonding satisfactory"),
                                        value: isProtective,
                                        onChanged: (newValue) {
                                          setState(() {
                                            if (newValue != null) {
                                              isProtective = newValue;
                                              protectiveController.text =
                                                  isProtective
                                                      ? "Pass"
                                                      : "Fail";
                                            } else {
                                              isProtective = false;
                                              protectiveController.text =
                                                  "Fail";
                                            }
                                          });
                                        },
                                        activeColor: Colors.greenAccent,
                                        checkColor: Colors.white,
                                      ),
                                      CheckboxListTile(
                                        title:
                                            Text("CO alarm present & working"),
                                        value: alarmPresent,
                                        onChanged: (newValue) {
                                          setState(() {
                                            if (newValue != null) {
                                              alarmPresent = newValue;
                                              coAlarmController.text =
                                                  alarmPresent
                                                      ? "Pass"
                                                      : "Fail";
                                            } else {
                                              alarmPresent = false;
                                              coAlarmController.text = "Fail";
                                            }
                                          });
                                        },
                                        activeColor: Colors.greenAccent,
                                        checkColor: Colors.white,
                                      ),
                                      CheckboxListTile(
                                        title: Text(
                                            "Smoke alarm present & working"),
                                        value: smokePresent,
                                        onChanged: (newValue) {
                                          setState(() {
                                            if (newValue != null) {
                                              smokePresent = newValue;
                                              smokeAlarmController.text =
                                                  smokePresent
                                                      ? "Pass"
                                                      : "Fail";
                                            } else {
                                              smokePresent = false;
                                              smokeAlarmController.text =
                                                  "Fail";
                                            }
                                          });
                                        },
                                        activeColor: Colors.greenAccent,
                                        checkColor: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                      // Perform actions after closing the dialog if needed
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Text("Final Checks"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(20, 70),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // Add other buttons in a similar manner
                // ...
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: ElevatedButton(
                    onPressed: () async {
                      //                     var titleController = TextEditingController();
                      // var fNameController = TextEditingController();
                      // var lNameController = TextEditingController();
                      // var postController = TextEditingController();
                      // var addressController = TextEditingController();
                      // var cityController = TextEditingController();
                      String title = titleController.text;
                      String fName = fNameController.text;
                      String lName = lNameController.text;
                      String post = postController.text;
                      String address = addressController.text;
                      String city = cityController.text;
                      String locOne = locOneController.text;
                      String typeOne = TypeController.text;
                      String manOne = ManafacturerController.text;
                      String modOne = ModelController.text;
                      String ownOne = OwnedByController.text;
                      String appOne = ApplianceInspectController.text;
                      String opPres = operatePressureController.text;
                      String flue = FlueTypeController.text;
                      String safe = safetyController.text;
                      String satisfactory = satisController.text;
                      String visual = visualController.text;
                      String termination = terminationController.text;
                      String fluePerform = fluePerformController.text;
                      String applianceService = applianceServiceController.text;
                      String applianceSafe = applianceSafeController.text;
                      String co1 = coController1.text;
                      String co2 = co2Controller1.text;
                      String ratio1 = ratioController1.text;
                      String co1_two = coController2.text;
                      String co2_two = co2Controller2.text;
                      String ratio2 = ratioController2.text;
                      String defect = defectsController.text;
                      String remedial = remedialController.text;
                      String warning = warningController.text;
                      String locOne_2 = locOneController_2.text;
                      String typeOne_2 = TypeController_2.text;
                      String manOne_2 = ManafacturerController_2.text;
                      String modOne_2 = ModelController_2.text;
                      String ownOne_2 = OwnedByController_2.text;
                      String appOne_2 = ApplianceInspectController_2.text;
                      String opPres_2 = operatePressureController_2.text;
                      String flue_2 = FlueTypeController_2.text;
                      String safe_2 = safetyController_2.text;
                      String satisfactory_2 = satisController_2.text;
                      String visual_2 = visualController_2.text;
                      String termination_2 = terminationController_2.text;
                      String fluePerform_2 = fluePerformController_2.text;
                      String applianceService_2 =
                          applianceServiceController_2.text;
                      String applianceSafe_2 = applianceSafeController_2.text;
                      String co1_2 = coController1_2.text;
                      String co2_2 = co2Controller1_2.text;
                      String ratio1_2 = ratioController1_2.text;
                      String co1_two_2 = coController2_2.text;
                      String co2_two_2 = co2Controller2_2.text;
                      String ratio2_2 = ratioController2_2.text;
                      String defect_2 = defectsController_2.text;
                      String remedial_2 = remedialController_2.text;
                      String warning_2 = warningController_2.text;
                      String locOne_3 = locOneController_3.text;
                      String typeOne_3 = TypeController_3.text;
                      String manOne_3 = ManafacturerController_3.text;
                      String modOne_3 = ModelController_3.text;
                      String ownOne_3 = OwnedByController_3.text;
                      String appOne_3 = ApplianceInspectController_3.text;
                      String opPres_3 = operatePressureController_3.text;
                      String flue_3 = FlueTypeController_3.text;
                      String safe_3 = safetyController_3.text;
                      String satisfactory_3 = satisController_3.text;
                      String visual_3 = visualController_3.text;
                      String termination_3 = terminationController_3.text;
                      String fluePerform_3 = fluePerformController_3.text;
                      String applianceService_3 =
                          applianceServiceController_3.text;
                      String applianceSafe_3 = applianceSafeController_3.text;
                      String co1_3 = coController1_3.text;
                      String co2_3 = co2Controller1_3.text;
                      String ratio1_3 = ratioController1_3.text;
                      String co1_two_3 = coController2_3.text;
                      String co2_two_3 = co2Controller2_3.text;
                      String ratio2_3 = ratioController2_3.text;
                      String defect_3 = defectsController_3.text;
                      String remedial_3 = remedialController_3.text;
                      String warning_3 = warningController_3.text;
                      String locOne_4 = locOneController_4.text;
                      String typeOne_4 = TypeController_4.text;
                      String manOne_4 = ManafacturerController_4.text;
                      String modOne_4 = ModelController_4.text;
                      String ownOne_4 = OwnedByController_4.text;
                      String appOne_4 = ApplianceInspectController_4.text;
                      String opPres_4 = operatePressureController_4.text;
                      String flue_4 = FlueTypeController_4.text;
                      String safe_4 = safetyController_4.text;
                      String satisfactory_4 = satisController_4.text;
                      String visual_4 = visualController_4.text;
                      String termination_4 = terminationController_4.text;
                      String fluePerform_4 = fluePerformController_4.text;
                      String applianceService_4 =
                          applianceServiceController_4.text;
                      String applianceSafe_4 = applianceSafeController_4.text;
                      String co1_4 = coController1_4.text;
                      String co2_4 = co2Controller1_4.text;
                      String ratio1_4 = ratioController1_4.text;
                      String co1_two_4 = coController2_4.text;
                      String co2_two_4 = co2Controller2_4.text;
                      String ratio2_4 = ratioController2_4.text;
                      String defect_4 = defectsController_4.text;
                      String remedial_4 = remedialController_4.text;
                      String warning_4 = warningController_4.text;
                      String outcomeGasInstall =
                          outcomeGasInstallController.text;
                      String outcomeGasSupply = outcomeGasSafeController.text;
                      String outcomeGasTight = outcomeGasTightController.text;
                      String emergencyControl = emergencyControlController.text;
                      String protective = protectiveController.text;
                      String coAlarmPres = coAlarmController.text;
                      String smokeAlarm = smokeAlarmController.text;
                      var now = new DateTime.now();
                      var formatter = new DateFormat('dd-MM-yyyy');
                      var nextdate = DateTime(now.year + 1, now.month, now.day);
                      var formatter2 = new DateFormat('dd-MM-yyyy');
                      String formatNext = formatter2.format(nextdate);
                      String formatDate = formatter.format(now);
                      if (outcomeGasInstall.isEmpty) {
                        outcomeGasInstall = "Fail";
                      }
                      if (outcomeGasSupply.isEmpty) {
                        outcomeGasSupply = "Fail";
                      }
                      if (outcomeGasTight.isEmpty) {
                        outcomeGasTight = "Fail";
                      }
                      if (emergencyControl.isEmpty) {
                        emergencyControl = "No";
                      }
                      if (protective.isEmpty) {
                        protective = "No";
                      }
                      if (coAlarmPres.isEmpty) {
                        coAlarmPres = "N/A";
                      }
                      if (smokeAlarm.isEmpty) {
                        smokeAlarm = "No";
                      }
                      if (appOne.isEmpty) {
                        appOne = "No";
                      }
                      if (defect.isEmpty) {
                        defect = "None";
                      }
                      if (remedial.isEmpty) {
                        remedial = "None";
                      }
                      if (warning.isEmpty) {
                        warning = "No";
                      }
                      if (ownOne.isEmpty) {
                        ownOne = "No";
                      }
                      if (safe.isEmpty) {
                        safe = "No";
                      }
                      if (satisfactory.isEmpty) {
                        satisfactory = "No";
                      }
                      if (visual.isEmpty) {
                        visual = "No";
                      }
                      if (termination.isEmpty) {
                        termination = "No";
                      }
                      if (fluePerform.isEmpty) {
                        fluePerform = "No";
                      }
                      if (applianceService.isEmpty) {
                        applianceService = "No";
                      }
                      if (applianceSafe.isEmpty) {
                        applianceSafe = "No";
                      }
                      if (co1.isEmpty) {
                        co1 = "-";
                      }
                      if (co2.isEmpty) {
                        co2 = "-";
                      }
                      if (ratio1.isEmpty) {
                        ratio1 = "-";
                      }
                      if (co1_two.isEmpty) {
                        co1_two = "-";
                      }
                      if (co2_two.isEmpty) {
                        co2_two = "-";
                      }
                      if (ratio2.isEmpty) {
                        ratio2 = "-";
                      }
                      if (appOne_2.isEmpty) {
                        appOne_2 = "No";
                      }
                      if (defect_2.isEmpty) {
                        defect_2 = "None";
                      }
                      if (remedial_2.isEmpty) {
                        remedial_2 = "None";
                      }
                      if (warning_2.isEmpty) {
                        warning_2 = "No";
                      }
                      if (ownOne_2.isEmpty) {
                        ownOne_2 = "No";
                      }
                      if (safe_2.isEmpty) {
                        safe_2 = "No";
                      }
                      if (satisfactory_2.isEmpty) {
                        satisfactory_2 = "No";
                      }
                      if (visual_2.isEmpty) {
                        visual_2 = "No";
                      }
                      if (termination_2.isEmpty) {
                        termination_2 = "No";
                      }
                      if (fluePerform_2.isEmpty) {
                        fluePerform_2 = "No";
                      }
                      if (applianceService_2.isEmpty) {
                        applianceService_2 = "No";
                      }
                      if (applianceSafe_2.isEmpty) {
                        applianceSafe_2 = "No";
                      }
                      if (co1_2.isEmpty) {
                        co1_2 = "-";
                      }
                      if (co2_2.isEmpty) {
                        co2_2 = "-";
                      }
                      if (ratio1_2.isEmpty) {
                        ratio1_2 = "-";
                      }
                      if (co1_two_2.isEmpty) {
                        co1_two_2 = "-";
                      }
                      if (co2_two_2.isEmpty) {
                        co2_two_2 = "-";
                      }
                      if (ratio2_2.isEmpty) {
                        ratio2_2 = "-";
                      }
                      if (appOne_3.isEmpty) {
                        appOne_3 = "No";
                      }
                      if (defect_3.isEmpty) {
                        defect_3 = "None";
                      }
                      if (remedial_3.isEmpty) {
                        remedial_3 = "None";
                      }
                      if (warning_3.isEmpty) {
                        warning_3 = "No";
                      }
                      if (ownOne_3.isEmpty) {
                        ownOne_3 = "No";
                      }
                      if (safe_3.isEmpty) {
                        safe_3 = "No";
                      }
                      if (satisfactory_3.isEmpty) {
                        satisfactory_3 = "No";
                      }
                      if (visual_3.isEmpty) {
                        visual_3 = "No";
                      }
                      if (termination_3.isEmpty) {
                        termination_3 = "No";
                      }
                      if (fluePerform_3.isEmpty) {
                        fluePerform_3 = "No";
                      }
                      if (applianceService_3.isEmpty) {
                        applianceService_3 = "No";
                      }
                      if (applianceSafe_3.isEmpty) {
                        applianceSafe_3 = "No";
                      }
                      if (co1_3.isEmpty) {
                        co1_3 = "-";
                      }
                      if (co2_3.isEmpty) {
                        co2_3 = "-";
                      }
                      if (ratio1_3.isEmpty) {
                        ratio1_3 = "-";
                      }
                      if (co1_two_3.isEmpty) {
                        co1_two_3 = "-";
                      }
                      if (co2_two_3.isEmpty) {
                        co2_two_3 = "-";
                      }
                      if (ratio2_3.isEmpty) {
                        ratio2_3 = "-";
                      }
                      if (locOne.isEmpty) {
                        locOne = "-";
                      }
                      if (locOne_2.isEmpty) {
                        locOne_2 = "-";
                      }
                      if (locOne_3.isEmpty) {
                        locOne_3 = "-";
                      }
                      if (locOne_4.isEmpty) {
                        locOne_4 = "-";
                      }
                      if (typeOne.isEmpty) {
                        typeOne = "-";
                      }
                      if (typeOne_2.isEmpty) {
                        typeOne_2 = "-";
                      }
                      if (typeOne_3.isEmpty) {
                        typeOne_3 = "-";
                      }
                      if (typeOne_4.isEmpty) {
                        typeOne_4 = "-";
                      }
                      if (manOne.isEmpty) {
                        manOne = "-";
                      }
                      if (manOne_2.isEmpty) {
                        manOne_2 = "-";
                      }
                      if (manOne_3.isEmpty) {
                        manOne_3 = "-";
                      }
                      if (manOne_4.isEmpty) {
                        manOne_4 = "-";
                      }
                      if (modOne.isEmpty) {
                        modOne = "-";
                      }
                      if (modOne_2.isEmpty) {
                        modOne_2 = "-";
                      }
                      if (modOne_3.isEmpty) {
                        modOne_3 = "-";
                      }
                      if (modOne_4.isEmpty) {
                        modOne_4 = "-";
                      }
                      if (opPres.isEmpty) {
                        opPres = "-";
                      }
                      if (opPres_2.isEmpty) {
                        opPres_2 = "-";
                      }
                      if (opPres_3.isEmpty) {
                        opPres_3 = "-";
                      }
                      if (opPres_4.isEmpty) {
                        opPres_4 = "-";
                      }
                      if (flue.isEmpty) {
                        flue = "-";
                      }
                      if (flue_2.isEmpty) {
                        flue_2 = "-";
                      }
                      if (flue_3.isEmpty) {
                        flue_3 = "-";
                      }
                      if (flue_4.isEmpty) {
                        flue_4 = "-";
                      }
                      if (appOne_4.isEmpty) {
                        appOne_4 = "No";
                      }
                      if (defect_4.isEmpty) {
                        defect_4 = "None";
                      }
                      if (remedial_4.isEmpty) {
                        remedial_4 = "None";
                      }
                      if (warning_4.isEmpty) {
                        warning_4 = "No";
                      }
                      if (ownOne_4.isEmpty) {
                        ownOne_4 = "No";
                      }
                      if (safe_4.isEmpty) {
                        safe_4 = "No";
                      }
                      if (satisfactory_4.isEmpty) {
                        satisfactory_4 = "No";
                      }
                      if (visual_4.isEmpty) {
                        visual_4 = "No";
                      }
                      if (termination_4.isEmpty) {
                        termination_4 = "No";
                      }
                      if (fluePerform_4.isEmpty) {
                        fluePerform_4 = "No";
                      }
                      if (applianceService_4.isEmpty) {
                        applianceService_4 = "No";
                      }
                      if (applianceSafe_4.isEmpty) {
                        applianceSafe_4 = "No";
                      }
                      // if (locOne.isNotEmpty && ownOne.isEmpty) {
                      //   ownOne = "--";
                      // }
                      // if (locOne_2.isNotEmpty && ownOne_2.isEmpty) {
                      //   ownOne_2 = "--";
                      // }
                      if (co1_4.isEmpty) {
                        co1_4 = "-";
                      }
                      if (co2_4.isEmpty) {
                        co2_4 = "-";
                      }
                      if (ratio1_4.isEmpty) {
                        ratio1_4 = "-";
                      }
                      if (co1_two_4.isEmpty) {
                        co1_two_4 = "-";
                      }
                      if (co2_two_4.isEmpty) {
                        co2_two_4 = "-";
                      }
                      if (ratio2_4.isEmpty) {
                        ratio2_4 = "-";
                      }
                      if (title.isNotEmpty &&
                          fName.isNotEmpty &&
                          lName.isNotEmpty &&
                          post.isNotEmpty &&
                          address.isNotEmpty &&
                          city.isNotEmpty &&
                          locOne.isNotEmpty &&
                          typeOne.isNotEmpty &&
                          manOne.isNotEmpty &&
                          modOne.isNotEmpty &&
                          ownOne.isNotEmpty &&
                          appOne.isNotEmpty &&
                          opPres.isNotEmpty &&
                          flue.isNotEmpty &&
                          safe.isNotEmpty &&
                          satisfactory.isNotEmpty &&
                          visual.isNotEmpty &&
                          termination.isNotEmpty &&
                          fluePerform.isNotEmpty &&
                          applianceService.isNotEmpty &&
                          applianceSafe.isNotEmpty &&
                          co1.isNotEmpty &&
                          co2.isNotEmpty &&
                          ratio1.isNotEmpty &&
                          co1_two.isNotEmpty &&
                          co2_two.isNotEmpty &&
                          ratio2.isNotEmpty &&
                          defect.isNotEmpty &&
                          remedial.isNotEmpty &&
                          warning.isNotEmpty &&
                          locOne_2.isNotEmpty &&
                          typeOne_2.isNotEmpty &&
                          manOne_2.isNotEmpty &&
                          modOne_2.isNotEmpty &&
                          ownOne_2.isNotEmpty &&
                          appOne_2.isNotEmpty &&
                          opPres_2.isNotEmpty &&
                          flue_2.isNotEmpty &&
                          safe_2.isNotEmpty &&
                          satisfactory_2.isNotEmpty &&
                          visual_2.isNotEmpty &&
                          termination_2.isNotEmpty &&
                          fluePerform_2.isNotEmpty &&
                          applianceService_2.isNotEmpty &&
                          applianceSafe_2.isNotEmpty &&
                          co1_2.isNotEmpty &&
                          co2_2.isNotEmpty &&
                          ratio1_2.isNotEmpty &&
                          co1_two_2.isNotEmpty &&
                          co2_two_2.isNotEmpty &&
                          ratio2_2.isNotEmpty &&
                          defect_2.isNotEmpty &&
                          remedial_2.isNotEmpty &&
                          warning_2.isNotEmpty &&
                          locOne_3.isNotEmpty &&
                          typeOne_3.isNotEmpty &&
                          manOne_3.isNotEmpty &&
                          modOne_3.isNotEmpty &&
                          ownOne_3.isNotEmpty &&
                          appOne_3.isNotEmpty &&
                          opPres_3.isNotEmpty &&
                          flue_3.isNotEmpty &&
                          safe_3.isNotEmpty &&
                          satisfactory_3.isNotEmpty &&
                          visual_3.isNotEmpty &&
                          termination_3.isNotEmpty &&
                          fluePerform_3.isNotEmpty &&
                          applianceService_3.isNotEmpty &&
                          applianceSafe_3.isNotEmpty &&
                          co1_3.isNotEmpty &&
                          co2_3.isNotEmpty &&
                          ratio1_3.isNotEmpty &&
                          co1_two_3.isNotEmpty &&
                          co2_two_3.isNotEmpty &&
                          ratio2_3.isNotEmpty &&
                          defect_3.isNotEmpty &&
                          remedial_3.isNotEmpty &&
                          warning_3.isNotEmpty &&
                          locOne_4.isNotEmpty &&
                          typeOne_4.isNotEmpty &&
                          manOne_4.isNotEmpty &&
                          modOne_4.isNotEmpty &&
                          ownOne_4.isNotEmpty &&
                          appOne_4.isNotEmpty &&
                          opPres_4.isNotEmpty &&
                          flue_4.isNotEmpty &&
                          safe_4.isNotEmpty &&
                          satisfactory_4.isNotEmpty &&
                          visual_4.isNotEmpty &&
                          termination_4.isNotEmpty &&
                          fluePerform_4.isNotEmpty &&
                          applianceService_4.isNotEmpty &&
                          applianceSafe_4.isNotEmpty &&
                          co1_4.isNotEmpty &&
                          co2_4.isNotEmpty &&
                          ratio1_4.isNotEmpty &&
                          co1_two_4.isNotEmpty &&
                          co2_two_4.isNotEmpty &&
                          ratio2_4.isNotEmpty &&
                          defect_4.isNotEmpty &&
                          remedial_4.isNotEmpty &&
                          warning_4.isNotEmpty &&
                          outcomeGasInstall.isNotEmpty &&
                          outcomeGasSupply.isNotEmpty &&
                          outcomeGasTight.isNotEmpty &&
                          emergencyControl.isNotEmpty &&
                          protective.isNotEmpty &&
                          coAlarmPres.isNotEmpty &&
                          smokeAlarm.isNotEmpty) {
                        firestore.collection("customers").add({
                          "Title": title,
                          "First Name": fName,
                          "Last Name": lName,
                          "Postcode": post,
                          "Address": address,
                          "City": city,
                          "Date": formatDate,
                          "Location (Appliance 1)": locOne,
                          "Type (Appliance 1)": typeOne,
                          "Manafacturer (Appliance 1)": manOne,
                          "Model (Appliance 1)": modOne,
                          "Owned By Landlord (Appliance 1)": ownOne,
                          "Appliance Inspected (Appliance 1)": appOne,
                          "Operating Pressure (Appliance 1)": opPres,
                          "Flue Type (Appliance 1)": flue,
                          "Safety Devices Operating Correctly (Appliance 1)":
                              safe,
                          "Satisfactory Ventilation (Appliance 1)":
                              satisfactory,
                          "Visual Condition of Flue (Appliance 1)": visual,
                          "Termination Satisfactory (Appliance 1)": termination,
                          "Flue Performance Checks (Appliance 1)": fluePerform,
                          "Was Appliance Serviced (Appliance 1)":
                              applianceService,
                          "Is Appliance Safe to Use (Appliance 1)":
                              applianceSafe,
                          "Carbon Monoxide (Reading 1/Min) (Appliance 1)": co1,
                          "Carbon Dioxide (Reading 1/Min) (Appliance 1)": co2,
                          "Ratio (Reading 1/Min) (Appliance 1)": ratio1,
                          "Carbon Monoxide (Reading 2/Max) (Appliance 1)":
                              co1_two,
                          "Carbon Dioxide (Reading 2/Max) (Appliance 1)":
                              co2_two,
                          "Ratio (Reading 2/Max) (Appliance 1)": ratio2,
                          "Defects Identified (Appliance 1)": defect,
                          "Remedial Action Taken (Appliance 1)": remedial,
                          "Has Warning Advice Notice Been Issued (Appliance 1)":
                              warning,
                          "Location (Appliance 2)": locOne_2,
                          "Type (Appliance 2)": typeOne_2,
                          "Manafacturer (Appliance 2)": manOne_2,
                          "Model (Appliance 2)": modOne_2,
                          "Owned By Landlord (Appliance 2)": ownOne_2,
                          "Appliance Inspected (Appliance 2)": appOne_2,
                          "Operating Pressure (Appliance 2)": opPres_2,
                          "Flue Type (Appliance 2)": flue_2,
                          "Safety Devices Operating Correctly (Appliance 2)":
                              safe_2,
                          "Satisfactory Ventilation (Appliance 2)":
                              satisfactory_2,
                          "Visual Condition of Flue (Appliance 2)": visual_2,
                          "Termination Satisfactory (Appliance 2)":
                              termination_2,
                          "Flue Performance Checks (Appliance 2)":
                              fluePerform_2,
                          "Was Appliance Serviced (Appliance 2)":
                              applianceService_2,
                          "Is Appliance Safe to Use (Appliance 2)":
                              applianceSafe_2,
                          "Carbon Monoxide (Reading 1/Min) (Appliance 2)":
                              co1_2,
                          "Carbon Dioxide (Reading 1/Min) (Appliance 2)": co2_2,
                          "Ratio (Reading 1/Min) (Appliance 2)": ratio1_2,
                          "Carbon Monoxide (Reading 2/Max) (Appliance 2)":
                              co1_two_2,
                          "Carbon Dioxide (Reading 2/Max) (Appliance 2)":
                              co2_two_2,
                          "Ratio (Reading 2/Max) (Appliance 2)": ratio2_2,
                          "Defects Identified (Appliance 2)": defect_2,
                          "Remedial Action Taken (Appliance 2)": remedial_2,
                          "Has Warning Advice Notice Been Issued (Appliance 2)":
                              warning_2,
                          "Location (Appliance 3)": locOne_3,
                          "Type (Appliance 3)": typeOne_3,
                          "Manafacturer (Appliance 3)": manOne_3,
                          "Model (Appliance 3)": modOne_3,
                          "Owned By Landlord (Appliance 3)": ownOne_3,
                          "Appliance Inspected (Appliance 3)": appOne_3,
                          "Operating Pressure (Appliance 3)": opPres_3,
                          "Flue Type (Appliance 3)": flue_3,
                          "Safety Devices Operating Correctly (Appliance 3)":
                              safe_3,
                          "Satisfactory Ventilation (Appliance 3)":
                              satisfactory_3,
                          "Visual Condition of Flue (Appliance 3)": visual_3,
                          "Termination Satisfactory (Appliance 3)":
                              termination_3,
                          "Flue Performance Checks (Appliance 3)":
                              fluePerform_3,
                          "Was Appliance Serviced (Appliance 3)":
                              applianceService_3,
                          "Is Appliance Safe to Use (Appliance 3)":
                              applianceSafe_3,
                          "Carbon Monoxide (Reading 1/Min) (Appliance 3)":
                              co1_3,
                          "Carbon Dioxide (Reading 1/Min) (Appliance 3)": co2_3,
                          "Ratio (Reading 1/Min) (Appliance 3)": ratio1_3,
                          "Carbon Monoxide (Reading 2/Max) (Appliance 3)":
                              co1_two_3,
                          "Carbon Dioxide (Reading 2/Max) (Appliance 3)":
                              co2_two_3,
                          "Ratio (Reading 2/Max) (Appliance 3)": ratio2_3,
                          "Defects Identified (Appliance 3)": defect_3,
                          "Remedial Action Taken (Appliance 3)": remedial_3,
                          "Has Warning Advice Notice Been Issued (Appliance 3)":
                              warning_3,
                          "Location (Appliance 4)": locOne_4,
                          "Type (Appliance 4)": typeOne_4,
                          "Manafacturer (Appliance 4)": manOne_4,
                          "Model (Appliance 4)": modOne_4,
                          "Owned By Landlord (Appliance 4)": ownOne_4,
                          "Appliance Inspected (Appliance 4)": appOne_4,
                          "Operating Pressure (Appliance 4)": opPres_4,
                          "Flue Type (Appliance 4)": flue_4,
                          "Safety Devices Operating Correctly (Appliance 4)":
                              safe_4,
                          "Satisfactory Ventilation (Appliance 4)":
                              satisfactory_4,
                          "Visual Condition of Flue (Appliance 4)": visual_4,
                          "Termination Satisfactory (Appliance 4)":
                              termination_4,
                          "Flue Performance Checks (Appliance 4)":
                              fluePerform_4,
                          "Was Appliance Serviced (Appliance 4)":
                              applianceService_4,
                          "Is Appliance Safe to Use (Appliance 4)":
                              applianceSafe_4,
                          "Carbon Monoxide (Reading 1/Min) (Appliance 4)":
                              co1_4,
                          "Carbon Dioxide (Reading 1/Min) (Appliance 4)": co2_4,
                          "Ratio (Reading 1/Min) (Appliance 4)": ratio1_4,
                          "Carbon Monoxide (Reading 2/Max) (Appliance 4)":
                              co1_two_4,
                          "Carbon Dioxide (Reading 2/Max) (Appliance 4)":
                              co2_two_4,
                          "Ratio (Reading 2/Max) (Appliance 4)": ratio2_4,
                          "Defects Identified (Appliance 4)": defect_4,
                          "Remedial Action Taken (Appliance 4)": remedial_4,
                          "Has Warning Advice Notice Been Issued (Appliance 4)":
                              warning_4,
                          "Outcome of gas installation pipework visual inspection":
                              outcomeGasInstall,
                          "Outcome of gas supply pipework visual inspection":
                              outcomeGasSupply,
                          "Outcome of gas tightness test": outcomeGasTight,
                          "Is the Emergency Control valve access satisfactory":
                              emergencyControl,
                          "Is the protective equipotential bonding satisfactory":
                              protective,
                          "CO alarm present & working": coAlarmPres,
                          "Smoke alarm present & working": smokeAlarm,
                          "Next Safety Check:": nextdate,
                          "UserID": userId
                        });
                      } else {
                        print("update failed");
                        // print(title);
                        // print(fName);
                        // print(lName);
                        print(post);
                        print(address);
                        print(locOne);
                        print(locOne_2);
                        // print(typeOne);
                        // print(manOne);
                        // print(modOne);
                        // print(ownOne);
                        // print(appOne);
                        // print(flue);
                        // print(opPres);
                        // print(safe);
                        // print(satisfactory);
                        // print(visual);
                        // print(termination);
                        // print(fluePerform);
                        // print(applianceService);
                        // print(applianceSafe);
                        // print(defect);
                        // print(warning);
                        // print(remedial);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestDisplayData(),
                        ),
                      );
                    },
                    child: Text("Submit"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(20, 70),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(
      String labelText, TextEditingController controller) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      controller: controller,
    );
  }
}
